using System;
using System.Collections.Generic;

namespace FreshProduce.Domain.Entities
{
    public class Neighborhood
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string City { get; set; } = "Cairo";
        public decimal DeliveryFee { get; set; } = 20; // EGP, admin configurable
        public string? PickupPointAddress { get; set; }
        public string? PickupPointNotes { get; set; }
    }

    public class Product
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Unit { get; set; } // e.g., "kg", "crate"
        public string ImageUrl { get; set; }
        public decimal MinInventoryAmount { get; set; }
        public decimal EstimatedWholesalePrice { get; set; }
    }

    public enum RoundStatus
    {
        Draft,
        Open,
        Locked,
        Finished,
        Delivering,
        Delivered,
        Completed,
        Cancelled
    }

    public class Round
    {
        public Guid Id { get; set; }
        public long RoundNumber { get; set; } // Auto-increment friendly ID
        public Guid NeighborhoodId { get; set; }
        public Neighborhood? Neighborhood { get; set; }
        public RoundStatus Status { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public decimal TotalTransportCost { get; set; } = 400; // Default estimate for Cairo
        public List<RoundProduct> RoundProducts { get; set; } = new List<RoundProduct>();
    }

    public class RoundProduct
    {
        public Guid Id { get; set; }
        public Guid RoundId { get; set; }
        public Guid ProductId { get; set; }
        public Product? Product { get; set; }
        
        public decimal TargetQuantityKg { get; set; }
        public decimal MinQuantityKg { get; set; }
        public decimal AccumulatedQuantityKg { get; set; }
        
        public decimal EstimatedWholesalePrice { get; set; }
        public decimal? ActualWholesalePrice { get; set; }
        
        public decimal MarginPerKg { get; set; }
        public decimal OperationalSharePerKg { get; set; }
        
        public decimal GetEstimatedCustomerPrice(decimal transportShare) 
            => EstimatedWholesalePrice + MarginPerKg + OperationalSharePerKg + transportShare;

        public decimal? GetFinalCustomerPrice(decimal transportShare) 
            => ActualWholesalePrice.HasValue 
                ? ActualWholesalePrice.Value + MarginPerKg + OperationalSharePerKg + transportShare 
                : (decimal?)null;
    }

    public enum OrderStatus
    {
        Placed,
        AwaitingConfirmation,
        Confirmed,
        Rejected,
        Paid,
        Delivered,
        Cancelled
    }

    public enum DeliveryType
    {
        HomeDelivery,
        PickupPoint
    }

    public class Order
    {
        public Guid Id { get; set; }
        public long OrderNumber { get; set; } // Auto-increment friendly ID
        public string UserId { get; set; }
        public string? UserName { get; set; } // Snapshot of user name
        public Guid RoundId { get; set; }
        public Round? Round { get; set; }
        public OrderStatus Status { get; set; }
        public DateTime OrderDate { get; set; }
        
        public bool IsConfirmed { get; set; } // For User price confirmation
        
        public decimal TotalEstimatedAmount { get; set; }
        public decimal PrepaymentAmount { get; set; }
        public decimal? FinalAmount { get; set; }
        
        // Payment tracking
        public decimal AmountPaid { get; set; }
        public decimal BalanceDue => (FinalAmount ?? TotalEstimatedAmount) - AmountPaid;
        
        public DeliveryType DeliveryType { get; set; }
        public decimal DeliveryFee { get; set; }
        public string? DeliveryAddress { get; set; }
        public string? DeliveryPhone { get; set; }
        
        public List<OrderItem> Items { get; set; } = new List<OrderItem>();
        public List<Payment> Payments { get; set; } = new List<Payment>();
    }

    public class OrderItem
    {
        public Guid Id { get; set; }
        public Guid OrderId { get; set; }
        public Guid ProductId { get; set; }
        public Product? Product { get; set; }
        public decimal QuantityKg { get; set; }
        public decimal EstimatedPricePerKg { get; set; }
        public decimal? FinalPricePerKg { get; set; }
    }

    public class RefreshToken
    {
        public Guid Id { get; set; }
        public string Token { get; set; } = string.Empty;
        public string UserId { get; set; } = string.Empty;
        public DateTime ExpiryDate { get; set; }
        public bool IsRevoked { get; set; }
    }

    // Payment System Entities

    public enum PaymentStatus
    {
        Pending,
        Confirmed,
        Rejected
    }

    public class Payment
    {
        public Guid Id { get; set; }
        public Guid OrderId { get; set; }
        public Order? Order { get; set; }
        public string UserId { get; set; } = string.Empty;
        
        public decimal Amount { get; set; }
        public string? ReferenceId { get; set; } // Vodafone Cash transaction ID
        public string? ScreenshotUrl { get; set; }
        public string? Notes { get; set; }
        
        public PaymentStatus Status { get; set; } = PaymentStatus.Pending;
        public string? RejectionReason { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public DateTime? ConfirmedAt { get; set; }
        public string? ConfirmedByAdminId { get; set; }
    }

    public class UserWallet
    {
        public Guid Id { get; set; }
        public string UserId { get; set; } = string.Empty;
        public decimal Balance { get; set; }
        public DateTime LastUpdated { get; set; } = DateTime.UtcNow;
    }

    public class WalletTransaction
    {
        public Guid Id { get; set; }
        public string UserId { get; set; } = string.Empty;
        public decimal Amount { get; set; } // Positive = credit, Negative = debit
        public string Description { get; set; } = string.Empty;
        public Guid? OrderId { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}
