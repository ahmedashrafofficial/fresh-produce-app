using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace FreshProduce.Infrastructure.Persistence
{
    public class FreshProduceDbContext : IdentityDbContext<ApplicationUser>
    {
        public FreshProduceDbContext(DbContextOptions<FreshProduceDbContext> options) : base(options) { }

        public DbSet<Neighborhood> Neighborhoods { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Round> Rounds { get; set; }
        public DbSet<RoundProduct> RoundProducts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        public DbSet<RefreshToken> RefreshTokens { get; set; }
        
        // Payment System
        public DbSet<Payment> Payments { get; set; }
        public DbSet<UserWallet> UserWallets { get; set; }
        public DbSet<WalletTransaction> WalletTransactions { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<RoundProduct>()
                .HasOne(rp => rp.Product)
                .WithMany()
                .HasForeignKey(rp => rp.ProductId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<Order>()
                .HasMany(o => o.Items)
                .WithOne()
                .HasForeignKey(oi => oi.OrderId);

            modelBuilder.Entity<Order>()
                .HasMany(o => o.Payments)
                .WithOne(p => p.Order)
                .HasForeignKey(p => p.OrderId);

            // Ignore computed property
            modelBuilder.Entity<Order>()
                .Ignore(o => o.BalanceDue);

            modelBuilder.Entity<OrderItem>()
                .HasOne(oi => oi.Product)
                .WithMany()
                .HasForeignKey(oi => oi.ProductId)
                .OnDelete(DeleteBehavior.Restrict);
            
            // Configure Decimal Precision
            var decimalProps = modelBuilder.Model
                .GetEntityTypes()
                .SelectMany(t => t.GetProperties())
                .Where(p => p.ClrType == typeof(decimal) || p.ClrType == typeof(decimal?));

            foreach (var prop in decimalProps)
            {
                prop.SetPrecision(18);
                prop.SetScale(2);
            }
            
            // Configure Auto-Increment IDs
            modelBuilder.Entity<Round>()
                .Property(r => r.RoundNumber)
                .ValueGeneratedOnAdd();
                
            modelBuilder.Entity<Order>()
                .Property(o => o.OrderNumber)
                .ValueGeneratedOnAdd();
            
            base.OnModelCreating(modelBuilder);
        }
    }
}
