using System;
using System.Linq;
using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Services
{
    public class PricingService : IPricingService
    {
        private const decimal PrepaymentPercentage = 0.7m; // 70% prepayment as discussed

        public decimal CalculateTransportSharePerKg(decimal totalTransportCost, decimal totalQuantityKg)
        {
            if (totalQuantityKg <= 0) return 0;
            return totalTransportCost / totalQuantityKg;
        }

        public decimal CalculatePrepaymentAmount(decimal totalEstimatedAmount)
        {
            return Math.Round(totalEstimatedAmount * PrepaymentPercentage, 2);
        }

        public void FinalizeOrderPrices(Order order, Round round)
        {
            var finalizableStatuses = new[] { RoundStatus.Finished, RoundStatus.Delivering, RoundStatus.Delivered, RoundStatus.Completed };
            if (!finalizableStatuses.Contains(round.Status))
            {
                throw new InvalidOperationException("Round must be at least in 'Finished' status to finalize prices.");
            }

            decimal totalFinalAmount = 0;
            decimal totalQuantityInRound = round.RoundProducts.Sum(rp => rp.AccumulatedQuantityKg);
            decimal transportShare = CalculateTransportSharePerKg(round.TotalTransportCost, totalQuantityInRound);

            foreach (var item in order.Items)
            {
                var roundProduct = round.RoundProducts.FirstOrDefault(rp => rp.ProductId == item.ProductId);
                if (roundProduct == null) continue;

                var finalPrice = roundProduct.GetFinalCustomerPrice(transportShare);
                if (finalPrice.HasValue)
                {
                    item.FinalPricePerKg = finalPrice.Value;
                    totalFinalAmount += item.QuantityKg * item.FinalPricePerKg.Value;
                }
            }

            order.FinalAmount = totalFinalAmount + order.DeliveryFee;
        }
    }
}
