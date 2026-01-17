using FreshProduce.Application.Interfaces;
using FreshProduce.Domain.Entities;
using Microsoft.AspNetCore.Mvc;

namespace FreshProduce.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class NeighborhoodsController : ControllerBase
    {
        private readonly IRepository<Neighborhood> _neighborhoodRepository;

        public NeighborhoodsController(IRepository<Neighborhood> neighborhoodRepository)
        {
            _neighborhoodRepository = neighborhoodRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var neighborhoods = await _neighborhoodRepository.GetAllAsync();
            return Ok(neighborhoods);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Neighborhood neighborhood)
        {
            await _neighborhoodRepository.AddAsync(neighborhood);
            return Ok(neighborhood);
        }
    }
}
