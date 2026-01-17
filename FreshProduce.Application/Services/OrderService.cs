using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Services
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IRoundRepository _roundRepository;
        private readonly IPricingService _pricingService;

        public OrderService(IOrderRepository orderRepository, IRoundRepository roundRepository, IPricingService pricingService)
        {
            _orderRepository = orderRepository;
            _roundRepository = roundRepository;
            _pricingService = pricingService;
        }

        public async Task<Order> PlaceOrderAsync(
            string userId, 
            Guid roundId, 
            List<(Guid ProductId, decimal QuantityKg)> items, 
            DeliveryType deliveryType,
            string? deliveryAddress = null,
            string? deliveryPhone = null,
            string? userName = null)
        {
            var round = await GetValidRoundForOrdering(roundId);

            
            decimal fee = 0;
            if (deliveryType == DeliveryType.HomeDelivery)
            {
                fee = round.Neighborhood?.DeliveryFee ?? 20m;
            }

            var order = CreateBaseOrder(userId, roundId, deliveryType, fee, deliveryAddress, deliveryPhone, userName);

            ProcessOrderItems(order, round, items);
            
            order.PrepaymentAmount = _pricingService.CalculatePrepaymentAmount(order.TotalEstimatedAmount);

            await UpdateRoundStatusIfTargetReached(round);

            await _orderRepository.AddAsync(order);
            await _roundRepository.UpdateAsync(round);

            return order;
        }

        private async Task<Round> GetValidRoundForOrdering(Guid roundId)
        {
            var round = await _roundRepository.GetByIdAsync(roundId);
            if (round == null || round.Status != RoundStatus.Open)
            {
                throw new InvalidOperationException("Round is not open for orders.");
            }
            return round;
        }

        private Order CreateBaseOrder(
            string userId, 
            Guid roundId, 
            DeliveryType deliveryType,
            decimal deliveryFee,
            string? deliveryAddress,
            string? deliveryPhone,
            string? userName)
        {
            return new Order
            {
                Id = Guid.NewGuid(),
                UserId = userId,
                UserName = userName,
                RoundId = roundId,
                Status = OrderStatus.Placed,
                OrderDate = DateTime.UtcNow,
                DeliveryType = deliveryType,
                DeliveryFee = deliveryFee,
                DeliveryAddress = deliveryAddress,
                DeliveryPhone = deliveryPhone
            };
        }

        private void ProcessOrderItems(Order order, Round round, List<(Guid ProductId, decimal QuantityKg)> items)
        {
            decimal totalEstimated = 0;
            decimal totalTargetKg = round.RoundProducts.Sum(rp => rp.TargetQuantityKg);
            decimal transportShareEstimate = totalTargetKg > 0 
                ? round.TotalTransportCost / totalTargetKg 
                : 2.0m;

            foreach (var item in items)
            {
                var roundProduct = round.RoundProducts.FirstOrDefault(rp => rp.ProductId == item.ProductId);
                if (roundProduct == null) continue;

                var orderItem = new OrderItem
                {
                    Id = Guid.NewGuid(),
                    OrderId = order.Id,
                    ProductId = item.ProductId,
                    QuantityKg = item.QuantityKg,
                    EstimatedPricePerKg = roundProduct.GetEstimatedCustomerPrice(transportShareEstimate)
                };
                
                order.Items.Add(orderItem);
                totalEstimated += orderItem.QuantityKg * orderItem.EstimatedPricePerKg;
                roundProduct.AccumulatedQuantityKg += item.QuantityKg;
            }

            order.TotalEstimatedAmount = totalEstimated + order.DeliveryFee;
        }

        private async Task UpdateRoundStatusIfTargetReached(Round round)
        {
            if (round.RoundProducts.All(rp => rp.AccumulatedQuantityKg >= rp.TargetQuantityKg))
            {
                round.Status = RoundStatus.Locked;
            }
            await Task.CompletedTask; // Keep it async-ready
        }

        public async Task ConfirmOrderAsync(Guid orderId, string userId)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null || order.UserId != userId) throw new Exception("Order not found");
            
            order.Status = OrderStatus.Confirmed;
            order.IsConfirmed = true;
            await _orderRepository.UpdateAsync(order);
        }

        public async Task RejectOrderAsync(Guid orderId, string userId)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null || order.UserId != userId) throw new Exception("Order not found");
            
            order.Status = OrderStatus.Rejected;
            order.IsConfirmed = false;
            await _orderRepository.UpdateAsync(order);
            
            await AdjustRoundQuota(order, -1);
        }

        public async Task CancelOrderAsync(Guid orderId)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null) throw new Exception("Order not found");
            
            if (order.Status == OrderStatus.Cancelled) return;

            var oldStatus = order.Status;
            order.Status = OrderStatus.Cancelled;
            await _orderRepository.UpdateAsync(order);

            if (oldStatus != OrderStatus.Rejected)
            {
                await AdjustRoundQuota(order, -1);
            }
        }

        public async Task UpdateStatusAsync(Guid orderId, OrderStatus status)
        {
            var order = await _orderRepository.GetByIdAsync(orderId);
            if (order == null) throw new KeyNotFoundException("Order not found");
            
            order.Status = status;
            await _orderRepository.UpdateAsync(order);
        }

        private async Task AdjustRoundQuota(Order order, int multiplier)
        {
            var round = await _roundRepository.GetByIdAsync(order.RoundId);
            if (round == null) return;

            foreach (var item in order.Items)
            {
                var rp = round.RoundProducts.FirstOrDefault(p => p.ProductId == item.ProductId);
                if (rp != null)
                {
                    rp.AccumulatedQuantityKg += (item.QuantityKg * multiplier);
                }
            }
            await _roundRepository.UpdateAsync(round);
        }
    }
}
