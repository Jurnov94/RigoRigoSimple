using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RigoRigoSimple.Aplicacion.Interface;
using RigoRigoSimple.Domain.Entities;
using RigoRigoSimple.Infraestructura.Data;
using System.Diagnostics.Metrics;

namespace RigoRigoSimple.API.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public class ProductosController : Controller
    {

        private readonly IProductoService _productoService;

        public ProductosController(IProductoService productoService)
        {
            _productoService = productoService;
        }


        [HttpGet]
        public async Task<IActionResult> GetAsync()
        {
            return Ok(await _productoService.ObtenerProductosAsync());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAsync(Guid id)
        {
            var producto = await _productoService.ObtenerProductoIdAsync(id);

            if (producto == null)
            {
                return NotFound();
            }

            return Ok(producto);
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync(Producto producto)
        {
            await _productoService.AgregarProductoAsync(producto);

            return NoContent();
        }

        [HttpPut]
        public async Task<IActionResult> PutAsync(Producto producto)
        {
            await _productoService.ActualizarProductoAsync(producto);

            return NoContent();
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAsync(Guid id)
        {
            await _productoService.EliminarProductoAsync(id);
      
            return NoContent();
        }

    }
}
