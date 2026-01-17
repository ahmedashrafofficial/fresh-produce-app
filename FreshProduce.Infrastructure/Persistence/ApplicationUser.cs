using Microsoft.AspNetCore.Identity;

namespace FreshProduce.Infrastructure.Persistence
{
    public class ApplicationUser : IdentityUser
    {
        public string? FullName { get; set; }
        public string? Address { get; set; }
    }
}
