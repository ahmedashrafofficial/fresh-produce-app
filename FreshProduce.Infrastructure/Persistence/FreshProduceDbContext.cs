using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace FreshProduce.Infrastructure.Persistence
{
    public class FreshProduceDbContext(DbContextOptions<FreshProduceDbContext> options) : IdentityDbContext<ApplicationUser>(options)
    {
        public DbSet<Neighborhood>? Neighborhoods { get; set; }
        public DbSet<Product>? Products { get; set; }
        public DbSet<Round>? Rounds { get; set; }
        public DbSet<RoundProduct>? RoundProducts { get; set; }
        public DbSet<Order>? Orders { get; set; }
        public DbSet<OrderItem>? OrderItems { get; set; }
        public DbSet<RefreshToken>? RefreshTokens { get; set; }

        // Payment System
        public DbSet<Payment>? Payments { get; set; }
        public DbSet<UserWallet>? UserWallets { get; set; }
        public DbSet<WalletTransaction>? WalletTransactions { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            _ = builder.Entity<RoundProduct>()
                .HasOne(static rp => rp.Product)
                .WithMany()
                .HasForeignKey(static rp => rp.ProductId)
                .OnDelete(DeleteBehavior.Restrict);

            _ = builder.Entity<Order>()
                .HasMany(static o => o.Items)
                .WithOne()
                .HasForeignKey(static oi => oi.OrderId);

            _ = builder.Entity<Order>()
                .HasMany(static o => o.Payments)
                .WithOne(static p => p.Order)
                .HasForeignKey(static p => p.OrderId);

            // Ignore computed property
            _ = builder.Entity<Order>()
                .Ignore(static o => o.BalanceDue);

            _ = builder.Entity<OrderItem>()
                .HasOne(static oi => oi.Product)
                .WithMany()
                .HasForeignKey(static oi => oi.ProductId)
                .OnDelete(DeleteBehavior.Restrict);

            // Configure Decimal Precision
            IEnumerable<Microsoft.EntityFrameworkCore.Metadata.IMutableProperty> decimalProps = builder.Model
                .GetEntityTypes()
                .SelectMany(static t => t.GetProperties())
                .Where(static p => p.ClrType == typeof(decimal) || p.ClrType == typeof(decimal?));

            foreach (Microsoft.EntityFrameworkCore.Metadata.IMutableProperty? prop in decimalProps)
            {
                prop.SetPrecision(18);
                prop.SetScale(2);
            }

            // Configure Auto-Increment IDs
            builder.Entity<Round>()
                .Property(static r => r.RoundNumber)
                .ValueGeneratedOnAdd()
                .Metadata.SetAfterSaveBehavior(Microsoft.EntityFrameworkCore.Metadata.PropertySaveBehavior.Ignore);

            builder.Entity<Order>()
                .Property(static o => o.OrderNumber)
                .ValueGeneratedOnAdd()
                .Metadata.SetAfterSaveBehavior(Microsoft.EntityFrameworkCore.Metadata.PropertySaveBehavior.Ignore);

            base.OnModelCreating(builder);
        }
    }
}
