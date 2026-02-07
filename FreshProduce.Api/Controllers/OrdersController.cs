using System;
using System.Linq;
using System.Security.Claims;
using FreshProduce.Application;
using FreshProduce.Application.Interfaces;
using FreshProduce.Application.Services;
using FreshProduce.Domain.Entities;
using FreshProduce.Infrastructure.Persistence; // For ApplicationUser
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity; // For UserManager
using Microsoft.AspNetCore.Mvc;

namespace FreshProduce.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderRepository _orderRepository;
        private readonly OrderService _orderService;
        private readonly UserManager<ApplicationUser> _userManager;

        public OrdersController(
            IOrderRepository orderRepository,
            OrderService orderService,
            UserManager<ApplicationUser> userManager)
        {
            _orderRepository = orderRepository;
            _orderService = orderService;
            _userManager = userManager;
        }

        [HttpPost]
        public async Task<IActionResult> PlaceOrder([FromBody] OrderPlacementRequest request)
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (string.IsNullOrEmpty(userId)) return Unauthorized();

                Console.WriteLine($"PlaceOrder requested by User: {userId}, Round: {request?.RoundId}, Items: {request?.Items?.Count ?? 0}");

                if (request == null)
                {
                    Console.WriteLine("ERROR: Request is null");
                    return BadRequest("Request body is null");
                }

                // Fetch User details for UserName
                var user = await _userManager.FindByIdAsync(userId);
                var userName = user?.FullName ?? user?.UserName ?? "Unknown";

                var orderItems = request.Items
                    .Select(i => (ProductId: i.ProductId, QuantityKg: i.QuantityKg))
                    .ToList();

                var order = await _orderService.PlaceOrderAsync(
                    userId,
                    request.RoundId,
                    orderItems,
                    request.DeliveryType,
                    request.DeliveryAddress,
                    request.DeliveryPhone,
                    userName); // Pass userName

                return Ok(MapToDto(order));
            }
            catch (InvalidOperationException ex)
            {
                Console.WriteLine($"InvalidOperationException in PlaceOrder: {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                var errorMsg = $"[{DateTime.Now}] EXCEPTION in PlaceOrder: {ex.GetType().Name}\nMessage: {ex.Message}\nStack trace: {ex.StackTrace}";
                if (ex.InnerException != null)
                {
                    errorMsg += $"\nInner exception: {ex.InnerException.Message}";
                }

                try
                {
                    System.IO.File.AppendAllText("error_log.txt", errorMsg + "\n\n");
                }
                catch { /* Ignore logging errors */ }

                Console.WriteLine(errorMsg);
                return StatusCode(500, new { error = ex.Message, type = ex.GetType().Name });
            }
        }

        [HttpGet("my")]
        public async Task<IActionResult> GetMyOrders()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId)) return Unauthorized();

            var orders = await _orderRepository.GetOrdersByUserIdAsync(userId);

            // Map to DTOs to avoid serialization issues
            var dtos = orders.Select(MapToDto);

            return Ok(dtos);
        }

        private OrderDto MapToDto(Order o)
        {
            return new OrderDto
            {
                Id = o.Id,
                OrderNumber = o.OrderNumber,
                UserId = o.UserId,
                UserName = o.UserName,
                RoundId = o.RoundId,
                Status = (int)o.Status,
                OrderDate = o.OrderDate,
                IsConfirmed = o.IsConfirmed,
                TotalEstimatedAmount = o.TotalEstimatedAmount,
                PrepaymentAmount = o.PrepaymentAmount,
                FinalAmount = o.FinalAmount,
                AmountPaid = o.AmountPaid,
                DeliveryType = (int)o.DeliveryType,
                DeliveryFee = o.DeliveryFee,
                DeliveryAddress = o.DeliveryAddress,
                DeliveryPhone = o.DeliveryPhone,
                Items = o.Items.Select(i => new OrderItemDto
                {
                    Id = i.Id,
                    ProductId = i.ProductId,
                    Product = i.Product != null ? new ProductDto
                    {
                        Id = i.Product.Id,
                        Name = i.Product.Name,
                        Unit = i.Product.Unit,
                        ImageUrl = i.Product.ImageUrl,
                        MinInventoryAmount = i.Product.MinInventoryAmount,
                        EstimatedWholesalePrice = i.Product.EstimatedWholesalePrice
                    } : null,
                    QuantityKg = i.QuantityKg,
                    EstimatedPricePerKg = i.EstimatedPricePerKg,
                    FinalPricePerKg = i.FinalPricePerKg
                }).ToList(),
                Payments = o.Payments.Select(p => new PaymentDto
                {
                    Id = p.Id,
                    OrderId = p.OrderId,
                    UserId = p.UserId,
                    Amount = p.Amount,
                    ReferenceId = p.ReferenceId,
                    ScreenshotUrl = p.ScreenshotUrl,
                    Notes = p.Notes,
                    Status = (int)p.Status,
                    RejectionReason = p.RejectionReason,
                    CreatedAt = p.CreatedAt,
                    ConfirmedAt = p.ConfirmedAt,
                    ConfirmedByAdminId = p.ConfirmedByAdminId
                }).ToList()
            };
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetOrder(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var order = await _orderRepository.GetByIdAsync(id);
            if (order == null) return NotFound();

            // Only owner or admin can see the order
            if (order.UserId != userId && !User.IsInRole("Admin")) return Forbid();

            return Ok(order);
        }

        [HttpGet("admin/all")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAllOrders()
        {
            var orders = await _orderRepository.GetAllAsync();
            var dtos = orders.Select(MapToDto);
            return Ok(dtos);
        }

        [HttpPost("{id}/confirm")]
        public async Task<IActionResult> ConfirmOrder(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId)) return Unauthorized();

            try
            {
                await _orderService.ConfirmOrderAsync(id, userId);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("{id}/reject")]
        public async Task<IActionResult> RejectOrder(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId)) return Unauthorized();

            try
            {
                await _orderService.RejectOrderAsync(id, userId);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("{id}/cancel")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CancelOrder(Guid id)
        {
            try
            {
                await _orderService.CancelOrderAsync(id);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("{id}/status")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateOrderStatus(Guid id, [FromQuery] OrderStatus status)
        {
            try
            {
                await _orderService.UpdateStatusAsync(id, status);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }



    // DTOs for response
    public class OrderDto
    {
        public Guid Id { get; set; }
        public long OrderNumber { get; set; }
        public string UserId { get; set; } = string.Empty;
        public string? UserName { get; set; }
        public Guid RoundId { get; set; }
        public int Status { get; set; }
        public DateTime OrderDate { get; set; }
        public bool IsConfirmed { get; set; }
        public decimal TotalEstimatedAmount { get; set; }
        public decimal PrepaymentAmount { get; set; }
        public decimal? FinalAmount { get; set; }
        public decimal AmountPaid { get; set; }
        public int DeliveryType { get; set; }
        public decimal DeliveryFee { get; set; }
        public string? DeliveryAddress { get; set; }
        public string? DeliveryPhone { get; set; }
        public List<OrderItemDto> Items { get; set; } = new();
        public List<PaymentDto> Payments { get; set; } = new();
    }

    public class OrderItemDto
    {
        public Guid Id { get; set; }
        public Guid ProductId { get; set; }
        public ProductDto? Product { get; set; }
        public decimal QuantityKg { get; set; }
        public decimal EstimatedPricePerKg { get; set; }
        public decimal? FinalPricePerKg { get; set; }
    }

    public class ProductDto
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Unit { get; set; } = string.Empty;
        public string? ImageUrl { get; set; }
        public decimal MinInventoryAmount { get; set; }
        public decimal EstimatedWholesalePrice { get; set; }
    }

    public class PaymentDto
    {
        public Guid Id { get; set; }
        public Guid OrderId { get; set; }
        public string UserId { get; set; } = string.Empty;
        public decimal Amount { get; set; }
        public string? ReferenceId { get; set; }
        public string? ScreenshotUrl { get; set; }
        public string? Notes { get; set; }
        public int Status { get; set; }
        public string? RejectionReason { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? ConfirmedAt { get; set; }
        public string? ConfirmedByAdminId { get; set; }
    }
}
