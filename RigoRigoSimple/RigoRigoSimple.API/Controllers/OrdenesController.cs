using Microsoft.AspNetCore.Mvc;
using RigoRigoSimple.Aplicacion.Interface;
using RigoRigoSimple.Aplicacion.Services;
using RigoRigoSimple.Domain.Entities;

namespace RigoRigoSimple.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrdenesController : Controller
    {
        private readonly IOrdenProcesadaService _ordenProcesadaService;

        public OrdenesController(IOrdenProcesadaService ordenProcesada)
        {
            _ordenProcesadaService = ordenProcesada;
        }


        [HttpPost]
        public async Task<IActionResult> PostAsync(OrdenProcesada ordenProcesada)
        {
            await _ordenProcesadaService.AgregarOrdenProcesadaAsync(ordenProcesada);

            return NoContent();
        }
    }
}
