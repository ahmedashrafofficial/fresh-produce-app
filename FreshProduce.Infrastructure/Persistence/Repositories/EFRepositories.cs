using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace FreshProduce.Infrastructure.Persistence.Repositories
{
    public class EFRepository<T> : IRepository<T> where T : class
    {
        protected readonly FreshProduceDbContext _context;

        public EFRepository(FreshProduceDbContext context)
        {
            _context = context;
        }

        public async Task<T> GetByIdAsync(Guid id) => await _context.Set<T>().FindAsync(id);

        public virtual async Task<IEnumerable<T>> GetAllAsync() => await _context.Set<T>().ToListAsync();

        public async Task AddAsync(T entity)
        {
            await _context.Set<T>().AddAsync(entity);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateAsync(T entity)
        {
            _context.Set<T>().Update(entity);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteAsync(Guid id)
        {
            var entity = await GetByIdAsync(id);
            if (entity != null)
            {
                _context.Set<T>().Remove(entity);
                await _context.SaveChangesAsync();
            }
        }
    }

    public class RoundRepository : EFRepository<Round>, IRoundRepository
    {
        public RoundRepository(FreshProduceDbContext context) : base(context) { }

        public override async Task<IEnumerable<Round>> GetAllAsync()
        {
            return await _context.Rounds
                .Include(r => r.RoundProducts)
                .ThenInclude(rp => rp.Product)
                .ToListAsync();
        }

        public async Task<IEnumerable<Round>> GetActiveRoundsAsync(Guid neighborhoodId)
        {
            var shownStatuses = new[] { 
                RoundStatus.Open, 
                RoundStatus.Locked, 
                RoundStatus.Finished, 
                RoundStatus.Delivering, 
                RoundStatus.Delivered, 
                RoundStatus.Completed 
            };
            return await _context.Rounds
                .Include(r => r.Neighborhood)
                .Include(r => r.RoundProducts)
                .ThenInclude(rp => rp.Product)
                .Where(r => r.NeighborhoodId == neighborhoodId && shownStatuses.Contains(r.Status))
                .OrderByDescending(r => r.EndDate)
                .ToListAsync();
        }

        public new async Task<Round?> GetByIdAsync(Guid id)
        {
            return await _context.Rounds
                .Include(r => r.Neighborhood)
                .Include(r => r.RoundProducts)
                .ThenInclude(rp => rp.Product)
                .FirstOrDefaultAsync(r => r.Id == id);
        }

        public async Task<Round?> GetByIdAsNoTrackingAsync(Guid id)
        {
            return await _context.Rounds
                .AsNoTracking()
                .Include(r => r.RoundProducts)
                .ThenInclude(rp => rp.Product)
                .FirstOrDefaultAsync(r => r.Id == id);
        }
    }

    public class OrderRepository : EFRepository<Order>, IOrderRepository
    {
        public OrderRepository(FreshProduceDbContext context) : base(context) { }

        public async Task<IEnumerable<Order>> GetOrdersByUserIdAsync(string userId)
        {
            return await _context.Orders
                .Include(o => o.Items)
                    .ThenInclude(i => i.Product)
                .Include(o => o.Payments)
                .Where(o => o.UserId == userId)
                .ToListAsync();
        }

        public override async Task<IEnumerable<Order>> GetAllAsync()
        {
             return await _context.Orders
                .Include(o => o.Items)
                    .ThenInclude(i => i.Product)
                .Include(o => o.Payments)
                .OrderByDescending(o => o.OrderDate)
                .ToListAsync();
        }

        public async Task<IEnumerable<Order>> GetOrdersByRoundIdAsync(Guid roundId)
        {
            return await _context.Orders
                .Include(o => o.Items)
                    .ThenInclude(i => i.Product) // Also include Product here just in case
                .Include(o => o.Payments)
                .Where(o => o.RoundId == roundId)
                .ToListAsync();
        }
    }

    public class PaymentRepository : EFRepository<Payment>, IPaymentRepository
    {
        public PaymentRepository(FreshProduceDbContext context) : base(context) { }

        public async Task<IEnumerable<Payment>> GetByOrderIdAsync(Guid orderId)
        {
            return await _context.Payments
                .Include(p => p.Order)
                .Where(p => p.OrderId == orderId)
                .OrderByDescending(p => p.CreatedAt)
                .ToListAsync();
        }

        public async Task<IEnumerable<Payment>> GetPendingPaymentsAsync()
        {
            return await _context.Payments
                .Include(p => p.Order)
                .Where(p => p.Status == PaymentStatus.Pending)
                .OrderBy(p => p.CreatedAt)
                .ToListAsync();
        }

        public async Task<IEnumerable<Payment>> GetByUserIdAsync(string userId)
        {
            return await _context.Payments
                .Include(p => p.Order)
                .Where(p => p.UserId == userId)
                .OrderByDescending(p => p.CreatedAt)
                .ToListAsync();
        }
    }

    public class WalletRepository : IWalletRepository
    {
        private readonly FreshProduceDbContext _context;

        public WalletRepository(FreshProduceDbContext context)
        {
            _context = context;
        }

        public async Task<UserWallet?> GetByUserIdAsync(string userId)
        {
            return await _context.UserWallets
                .FirstOrDefaultAsync(w => w.UserId == userId);
        }

        public async Task<UserWallet> CreateWalletAsync(string userId)
        {
            var wallet = new UserWallet
            {
                Id = Guid.NewGuid(),
                UserId = userId,
                Balance = 0,
                LastUpdated = DateTime.UtcNow
            };
            await _context.UserWallets.AddAsync(wallet);
            await _context.SaveChangesAsync();
            return wallet;
        }

        public async Task UpdateBalanceAsync(string userId, decimal amount, string description, Guid? orderId = null)
        {
            var wallet = await GetByUserIdAsync(userId);
            if (wallet == null)
            {
                wallet = await CreateWalletAsync(userId);
            }

            wallet.Balance += amount;
            wallet.LastUpdated = DateTime.UtcNow;

            var transaction = new WalletTransaction
            {
                Id = Guid.NewGuid(),
                UserId = userId,
                Amount = amount,
                Description = description,
                OrderId = orderId,
                CreatedAt = DateTime.UtcNow
            };

            await _context.WalletTransactions.AddAsync(transaction);
            await _context.SaveChangesAsync();
        }

        public async Task<IEnumerable<WalletTransaction>> GetTransactionsAsync(string userId)
        {
            return await _context.WalletTransactions
                .Where(t => t.UserId == userId)
                .OrderByDescending(t => t.CreatedAt)
                .ToListAsync();
        }
    }
}
