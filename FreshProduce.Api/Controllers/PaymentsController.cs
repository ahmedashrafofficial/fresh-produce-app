using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace FreshProduce.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentsController : ControllerBase
    {
        private readonly IPaymentRepository _paymentRepository;
        private readonly IOrderRepository _orderRepository;
        private readonly IWalletRepository _walletRepository;

        public PaymentsController(
            IPaymentRepository paymentRepository,
            IOrderRepository orderRepository,
            IWalletRepository walletRepository)
        {
            _paymentRepository = paymentRepository;
            _orderRepository = orderRepository;
            _walletRepository = walletRepository;
        }

        // User submits a payment
        [HttpPost("submit")]
        [Authorize]
        public async Task<IActionResult> SubmitPayment([FromBody] SubmitPaymentRequest request)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var order = await _orderRepository.GetByIdAsync(request.OrderId);
            if (order == null)
                return NotFound("Order not found");

            if (order.UserId != userId)
                return Forbid();

            var payment = new Payment
            {
                Id = Guid.NewGuid(),
                OrderId = request.OrderId,
                UserId = userId,
                Amount = request.Amount,
                ReferenceId = request.ReferenceId,
                ScreenshotUrl = request.ScreenshotUrl,
                Notes = request.Notes,
                Status = PaymentStatus.Pending,
                CreatedAt = DateTime.UtcNow
            };

            await _paymentRepository.AddAsync(payment);
            return Ok(new { PaymentId = payment.Id, Message = "Payment submitted for confirmation" });
        }

        // Get payments for an order
        [HttpGet("order/{orderId}")]
        [Authorize]
        public async Task<IActionResult> GetPaymentsByOrder(Guid orderId)
        {
            var payments = await _paymentRepository.GetByOrderIdAsync(orderId);
            return Ok(payments);
        }

        // Get user's payments
        [HttpGet("my")]
        [Authorize]
        public async Task<IActionResult> GetMyPayments()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var payments = await _paymentRepository.GetByUserIdAsync(userId);
            return Ok(payments);
        }

        // Admin: Get all pending payments
        [HttpGet("admin/pending")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetPendingPayments()
        {
            var payments = await _paymentRepository.GetPendingPaymentsAsync();
            return Ok(payments);
        }

        // Admin: Confirm a payment
        [HttpPost("admin/{paymentId}/confirm")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> ConfirmPayment(Guid paymentId)
        {
            var payment = await _paymentRepository.GetByIdAsync(paymentId);
            if (payment == null)
                return NotFound();

            var adminId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            payment.Status = PaymentStatus.Confirmed;
            payment.ConfirmedAt = DateTime.UtcNow;
            payment.ConfirmedByAdminId = adminId;

            await _paymentRepository.UpdateAsync(payment);

            // Update order's AmountPaid
            var order = await _orderRepository.GetByIdAsync(payment.OrderId);
            if (order != null)
            {
                order.AmountPaid += payment.Amount;
                await _orderRepository.UpdateAsync(order);
            }

            return Ok(new { Message = "Payment confirmed" });
        }

        // Admin: Reject a payment
        [HttpPost("admin/{paymentId}/reject")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> RejectPayment(Guid paymentId, [FromBody] RejectPaymentRequest request)
        {
            var payment = await _paymentRepository.GetByIdAsync(paymentId);
            if (payment == null)
                return NotFound();

            payment.Status = PaymentStatus.Rejected;
            payment.RejectionReason = request.Reason;
            await _paymentRepository.UpdateAsync(payment);

            return Ok(new { Message = "Payment rejected" });
        }

        // Get user's wallet
        [HttpGet("wallet")]
        [Authorize]
        public async Task<IActionResult> GetWallet()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var wallet = await _walletRepository.GetByUserIdAsync(userId);
            if (wallet == null)
            {
                wallet = await _walletRepository.CreateWalletAsync(userId);
            }

            var transactions = await _walletRepository.GetTransactionsAsync(userId);
            return Ok(new { Balance = wallet.Balance, Transactions = transactions });
        }

        // Admin: Credit user's wallet (for refunds)
        [HttpPost("admin/wallet/credit")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreditWallet([FromBody] WalletCreditRequest request)
        {
            await _walletRepository.UpdateBalanceAsync(
                request.UserId,
                request.Amount,
                request.Description,
                request.OrderId);

            return Ok(new { Message = "Wallet credited successfully" });
        }
    }

    // DTOs
    public class SubmitPaymentRequest
    {
        public Guid OrderId { get; set; }
        public decimal Amount { get; set; }
        public string? ReferenceId { get; set; }
        public string? ScreenshotUrl { get; set; }
        public string? Notes { get; set; }
    }

    public class RejectPaymentRequest
    {
        public string Reason { get; set; } = string.Empty;
    }

    public class WalletCreditRequest
    {
        public string UserId { get; set; } = string.Empty;
        public decimal Amount { get; set; }
        public string Description { get; set; } = string.Empty;
        public Guid? OrderId { get; set; }
    }
}
