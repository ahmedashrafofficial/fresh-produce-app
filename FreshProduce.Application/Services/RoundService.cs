using System;
using System.Threading.Tasks;
using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Services
{
    public class RoundService
    {
        private readonly IRoundRepository _roundRepository;
        private readonly IOrderRepository _orderRepository;
        private readonly IPricingService _pricingService;

        public RoundService(IRoundRepository roundRepository, IOrderRepository orderRepository, IPricingService pricingService)
        {
            _roundRepository = roundRepository;
            _orderRepository = orderRepository;
            _pricingService = pricingService;
        }

        public async Task FinalizeRoundAsync(Guid roundId, decimal totalTransportCost, Dictionary<Guid, decimal> productActualPrices)
        {
            var round = await _roundRepository.GetByIdAsync(roundId);
            if (round == null) throw new Exception("Round not found");

            round.TotalTransportCost = totalTransportCost;
            round.Status = RoundStatus.Finished;

            foreach (var rp in round.RoundProducts)
            {
                if (productActualPrices.TryGetValue(rp.ProductId, out decimal actualPrice))
                {
                    rp.ActualWholesalePrice = actualPrice;
                }
            }

            await UpdateRoundWithPricingAsync(round);
        }

        public async Task UpdateRoundWithPricingAsync(Round round)
        {
            // Get the current state from database to check for status transitions (No Tracking to avoid conflicts)
            var existingRound = await _roundRepository.GetByIdAsNoTrackingAsync(round.Id);
            
            // Prevent modifications to delivered/completed rounds
            if (existingRound != null && 
                (existingRound.Status == RoundStatus.Delivered || 
                 existingRound.Status == RoundStatus.Completed))
            {
                throw new InvalidOperationException("Cannot modify a round that has been delivered or completed.");
            }

            var isTransitioningToDelivering = existingRound != null && 
                                             existingRound.Status != RoundStatus.Delivering && 
                                             round.Status == RoundStatus.Delivering;

            // If moving to LOCKED, notify orders (AwaitingConfirmation)
            if (round.Status == RoundStatus.Locked)
            {
                var orders = await _orderRepository.GetOrdersByRoundIdAsync(round.Id);
                foreach (var order in orders)
                {
                    if (order.Status == OrderStatus.Placed)
                    {
                        order.Status = OrderStatus.AwaitingConfirmation;
                        await _orderRepository.UpdateAsync(order);
                    }
                }
            }

            // If TRANSITIONING to DELIVERING, check if all orders are confirmed
            // (Users must confirm prices before delivery can start)
            if (isTransitioningToDelivering)
            {
                var orders = await _orderRepository.GetOrdersByRoundIdAsync(round.Id);
                var unconfirmed = orders.Where(o => o.Status == OrderStatus.AwaitingConfirmation || o.Status == OrderStatus.Placed);
                if (unconfirmed.Any())
                {
                    throw new InvalidOperationException("Cannot start delivery while some users haven't confirmed price changes.");
                }
            }

            await _roundRepository.UpdateAsync(round);

            // Global Price Sync: If the admin is updating a round in a "pricing" state,
            // propagate these market prices to other rounds that haven't been completed yet.
            if (round.Status == RoundStatus.Locked || round.Status == RoundStatus.Finished)
            {
                var allRounds = await _roundRepository.GetAllAsync();
                var activeRounds = allRounds.Where(r => r.Id != round.Id && 
                                                 r.Status != RoundStatus.Draft && 
                                                 r.Status != RoundStatus.Completed && 
                                                 r.Status != RoundStatus.Cancelled);

                foreach (var otherRound in activeRounds)
                {
                    bool updated = false;
                    foreach (var rp in round.RoundProducts)
                    {
                        var matchingProduct = otherRound.RoundProducts.FirstOrDefault(orp => orp.ProductId == rp.ProductId);
                        if (matchingProduct != null)
                        {
                            matchingProduct.ActualWholesalePrice = rp.ActualWholesalePrice;
                            matchingProduct.EstimatedWholesalePrice = rp.EstimatedWholesalePrice;
                            updated = true;
                        }
                    }
                    if (updated) await _roundRepository.UpdateAsync(otherRound);
                }
            }

            // Finalize order prices for rounds that are being finalized or delivering
            if (round.Status == RoundStatus.Finished || round.Status == RoundStatus.Delivering)
            {
                var orders = await _orderRepository.GetOrdersByRoundIdAsync(round.Id);
                foreach (var order in orders)
                {
                    if (order.Status != OrderStatus.Cancelled && order.Status != OrderStatus.Rejected)
                    {
                        _pricingService.FinalizeOrderPrices(order, round);
                        await _orderRepository.UpdateAsync(order);
                    }
                }
            }
        }

        public async Task OpenRoundAsync(Guid roundId)
        {
            var round = await _roundRepository.GetByIdAsync(roundId);
            if (round == null) throw new Exception("Round not found");

            round.Status = RoundStatus.Open;
            await _roundRepository.UpdateAsync(round);
        }
    }
}
