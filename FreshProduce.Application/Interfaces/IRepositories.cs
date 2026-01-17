using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FreshProduce.Domain.Entities;

namespace FreshProduce.Application.Interfaces
{
    public interface IRepository<T> where T : class
    {
        Task<T> GetByIdAsync(Guid id);
        Task<IEnumerable<T>> GetAllAsync();
        Task AddAsync(T entity);
        Task UpdateAsync(T entity);
        Task DeleteAsync(Guid id);
    }

    public interface IRoundRepository : IRepository<Round>
    {
        Task<IEnumerable<Round>> GetActiveRoundsAsync(Guid neighborhoodId);
        Task<Round> GetByIdAsNoTrackingAsync(Guid id);
    }

    public interface IOrderRepository : IRepository<Order>
    {
        Task<IEnumerable<Order>> GetOrdersByUserIdAsync(string userId);
        Task<IEnumerable<Order>> GetOrdersByRoundIdAsync(Guid roundId);
    }

    public interface IPaymentRepository : IRepository<Payment>
    {
        Task<IEnumerable<Payment>> GetByOrderIdAsync(Guid orderId);
        Task<IEnumerable<Payment>> GetPendingPaymentsAsync();
        Task<IEnumerable<Payment>> GetByUserIdAsync(string userId);
    }

    public interface IWalletRepository
    {
        Task<UserWallet?> GetByUserIdAsync(string userId);
        Task<UserWallet> CreateWalletAsync(string userId);
        Task UpdateBalanceAsync(string userId, decimal amount, string description, Guid? orderId = null);
        Task<IEnumerable<WalletTransaction>> GetTransactionsAsync(string userId);
    }
}
