using FreshProduce.Application.Interfaces;
using FreshProduce.Application.Services;
using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FreshProduce.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RoundsController : ControllerBase
    {
        private readonly IRoundRepository _roundRepository;
        private readonly RoundService _roundService;

        public RoundsController(IRoundRepository roundRepository, RoundService roundService)
        {
            _roundRepository = roundRepository;
            _roundService = roundService;
        }

        [HttpGet("active/{neighborhoodId}")]
        public async Task<IActionResult> GetActiveRounds(Guid neighborhoodId)
        {
            var rounds = await _roundRepository.GetActiveRoundsAsync(neighborhoodId);
            return Ok(rounds);
        }

        [HttpGet("{id}/products")]
        public async Task<IActionResult> GetRoundProducts(Guid id)
        {
            var round = await _roundRepository.GetByIdAsync(id);
            if (round == null) return NotFound();
            return Ok(round.RoundProducts);
        }

        [HttpPost("admin")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> CreateRound([FromBody] Round round)
        {
            if (round.Id == Guid.Empty) round.Id = Guid.NewGuid();
            
            foreach (var rp in round.RoundProducts)
            {
                if (rp.Id == Guid.Empty) rp.Id = Guid.NewGuid();
                rp.RoundId = round.Id;
            }

            await _roundRepository.AddAsync(round);
            return CreatedAtAction(nameof(GetRoundProducts), new { id = round.Id }, round);
        }

        [HttpPatch("admin/{id}/finalize")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> FinalizeRound(Guid id, [FromBody] FinalizeRoundRequest request)
        {
            var productPrices = request.ProductActualPrices.ToDictionary(p => p.ProductId, p => p.ActualWholesalePrice);
            await _roundService.FinalizeRoundAsync(id, request.TotalTransportCost, productPrices);
            return NoContent();
        }

        [HttpGet("admin/all")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAllRounds()
        {
            var rounds = await _roundRepository.GetAllAsync();
            return Ok(rounds);
        }

        [HttpPut("admin/{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UpdateRound(Guid id, [FromBody] Round round)
        {
            if (id != round.Id) return BadRequest();
            await _roundService.UpdateRoundWithPricingAsync(round);
            return NoContent();
        }
    }

    public class FinalizeRoundRequest
    {
        public decimal TotalTransportCost { get; set; }
        public List<ProductActualPriceRequest> ProductActualPrices { get; set; } = new();
    }

    public class ProductActualPriceRequest
    {
        public Guid ProductId { get; set; }
        public decimal ActualWholesalePrice { get; set; }
    }
}
