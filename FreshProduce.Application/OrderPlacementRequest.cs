using System;
using System.Collections.Generic;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application
{
    public class OrderPlacementRequest
    {
        public Guid RoundId { get; set; }
        public List<OrderItemPlacementRequest> Items { get; set; } = new List<OrderItemPlacementRequest>();
        public DeliveryType DeliveryType { get; set; }
        public string? DeliveryAddress { get; set; }
        public string? DeliveryPhone { get; set; }
    }

    public class OrderItemPlacementRequest
    {
        public Guid ProductId { get; set; }
        public decimal QuantityKg { get; set; }
    }
}
