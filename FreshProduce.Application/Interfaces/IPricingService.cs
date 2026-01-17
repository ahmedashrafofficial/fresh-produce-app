using System.Collections.Generic;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Interfaces
{
    public interface IPricingService
    {
        decimal CalculateTransportSharePerKg(decimal totalTransportCost, decimal totalQuantityKg);
        
        void FinalizeOrderPrices(Order order, Round round);
        
        decimal CalculatePrepaymentAmount(decimal totalEstimatedAmount);
    }
}
