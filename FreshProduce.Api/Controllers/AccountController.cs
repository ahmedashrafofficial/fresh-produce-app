using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using FreshProduce.Infrastructure.Persistence;
using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace FreshProduce.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly IConfiguration _configuration;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IConfiguration configuration)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterDto model)
        {
            var user = new ApplicationUser
            {
                UserName = model.Email,
                Email = model.Email,
                FullName = model.FullName,
                PhoneNumber = model.PhoneNumber,
                Address = model.Address
            };
            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                return Ok(new { Message = "Registration successful" });
            }

            return BadRequest(result.Errors);
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginDto model)
        {
            var user = await _userManager.FindByEmailAsync(model.Email);
            if (user != null)
            {
                if (await _userManager.CheckPasswordAsync(user, model.Password))
                {
                    var userRoles = await _userManager.GetRolesAsync(user);
                    var token = GenerateJwtToken(user, userRoles);
                    
                    var refreshToken = new RefreshToken
                    {
                        Id = Guid.NewGuid(),
                        UserId = user.Id,
                        Token = Guid.NewGuid().ToString(),
                        ExpiryDate = DateTime.UtcNow.AddDays(model.RememberMe ? 30 : 1),
                        IsRevoked = false
                    };

                    var dbContext = HttpContext.RequestServices.GetRequiredService<FreshProduceDbContext>();
                    dbContext.RefreshTokens.Add(refreshToken);
                    await dbContext.SaveChangesAsync();

                    return Ok(new
                    {
                        token = new JwtSecurityTokenHandler().WriteToken(token),
                        refreshToken = refreshToken.Token,
                        expiration = token.ValidTo,
                        user = new { user.Id, user.Email, user.FullName, Roles = userRoles }
                    });
                }
                else
                {
                    Console.WriteLine($"Login failed for user {model.Email}: Invalid password.");
                }
            }
            else
            {
                Console.WriteLine($"Login failed: User {model.Email} not found.");
            }
            return Unauthorized();
        }

        [HttpPost("refresh")]
        public async Task<IActionResult> Refresh(RefreshRequestDto model)
        {
            var dbContext = HttpContext.RequestServices.GetRequiredService<FreshProduceDbContext>();
            var storedToken = dbContext.RefreshTokens.FirstOrDefault(t => t.Token == model.RefreshToken && !t.IsRevoked);

            if (storedToken == null || storedToken.ExpiryDate < DateTime.UtcNow)
            {
                return Unauthorized(new { Message = "Invalid or expired refresh token" });
            }

            var user = await _userManager.FindByIdAsync(storedToken.UserId);
            if (user == null) return Unauthorized();

            var userRoles = await _userManager.GetRolesAsync(user);
            var newToken = GenerateJwtToken(user, userRoles);

            return Ok(new
            {
                token = new JwtSecurityTokenHandler().WriteToken(newToken),
                refreshToken = storedToken.Token, // Re-use or rotate. Re-using for simplicity here.
                expiration = newToken.ValidTo
            });
        }

        private JwtSecurityToken GenerateJwtToken(ApplicationUser user, IList<string> roles)
        {
            var authClaims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.UserName!),
                new Claim(ClaimTypes.NameIdentifier, user.Id),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            };

            foreach (var role in roles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, role));
            }

            var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]!));

            return new JwtSecurityToken(
                issuer: _configuration["Jwt:Issuer"],
                audience: _configuration["Jwt:Audience"],
                expires: DateTime.UtcNow.AddMinutes(Convert.ToDouble(_configuration["Jwt:DurationInMinutes"])),
                claims: authClaims,
                signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
            );
        }
    }

    public class RegisterDto
    {
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;
        public string? PhoneNumber { get; set; }
        public string? Address { get; set; }
    }

    public class LoginDto
    {
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public bool RememberMe { get; set; }
    }

    public class RefreshRequestDto
    {
        public string RefreshToken { get; set; } = string.Empty;
    }
}
