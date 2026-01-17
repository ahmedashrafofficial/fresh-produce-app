using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Interfaces
{
    public interface IOrderService
    {
        Task<Order> PlaceOrderAsync(
            string userId, 
            Guid roundId, 
            List<(Guid ProductId, decimal QuantityKg)> items, 
            DeliveryType deliveryType,
            string? deliveryAddress = null,
            string? deliveryPhone = null,
            string? userName = null);
        Task ConfirmOrderAsync(Guid orderId, string userId);
        Task RejectOrderAsync(Guid orderId, string userId);
        Task CancelOrderAsync(Guid orderId);
        Task UpdateStatusAsync(Guid orderId, OrderStatus status);
    }
}
