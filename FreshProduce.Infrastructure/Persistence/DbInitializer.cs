using System;
using System.Linq;
using FreshProduce.Domain.Entities;
using FreshProduce.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace FreshProduce.Infrastructure.Persistence
{
    public static class DbInitializer
    {
        public static void Initialize(FreshProduceDbContext context)
        {
            context.Database.Migrate();

            if (context.Neighborhoods.Any()) return;

            var maadiId = new Guid("11111111-1111-1111-1111-111111111111");
            var zamalekId = new Guid("22222222-2222-2222-2222-222222222222");

            var maadi = new Neighborhood { Id = maadiId, Name = "المعادي", City = "Cairo" };
            var zamalek = new Neighborhood { Id = zamalekId, Name = "الزمالك", City = "Cairo" };
            
            context.Neighborhoods.AddRange(maadi, zamalek);

            var tomatoId = new Guid("33333333-3333-3333-3333-333333333333");
            var potatoId = new Guid("44444444-4444-4444-4444-444444444444");
            var cucumberId = new Guid("55555555-5555-5555-5555-555555555555");

            var tomato = new Product { Id = tomatoId, Name = "طماطم", Unit = "كجم", ImageUrl = "https://example.com/tomato.jpg", MinInventoryAmount = 20, EstimatedWholesalePrice = 20 };
            var potato = new Product { Id = potatoId, Name = "بطاطس", Unit = "كجم", ImageUrl = "https://example.com/potato.jpg", MinInventoryAmount = 50, EstimatedWholesalePrice = 15 };
            var cucumber = new Product { Id = cucumberId, Name = "خيار", Unit = "كجم", ImageUrl = "https://example.com/cucumber.jpg", MinInventoryAmount = 15, EstimatedWholesalePrice = 10 };

            context.Products.AddRange(tomato, potato, cucumber);

            var roundId = new Guid("66666666-6666-6666-6666-666666666666");
            var round = new Round
            {
                Id = roundId,
                NeighborhoodId = maadi.Id,
                Status = RoundStatus.Open,
                StartDate = DateTime.UtcNow,
                EndDate = DateTime.UtcNow.AddDays(3),
                TotalTransportCost = 400
            };

            round.RoundProducts.Add(new RoundProduct
            {
                Id = Guid.NewGuid(),
                ProductId = tomato.Id,
                TargetQuantityKg = 50,
                MinQuantityKg = 20,
                EstimatedWholesalePrice = 10,
                MarginPerKg = 2,
                OperationalSharePerKg = 1
            });

            round.RoundProducts.Add(new RoundProduct
            {
                Id = Guid.NewGuid(),
                ProductId = potato.Id,
                TargetQuantityKg = 100,
                MinQuantityKg = 40,
                EstimatedWholesalePrice = 8,
                MarginPerKg = 1.5m,
                OperationalSharePerKg = 1
            });

            context.Rounds.Add(round);
            context.SaveChanges();
        }
    }
}
