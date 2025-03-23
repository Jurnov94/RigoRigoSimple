using RigoRigoSimple.Aplicacion.Interface;
using RigoRigoSimple.Domain.Entities;
using RigoRigoSimple.Infraestructura.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Aplicacion.Services
{
    public class OrdenProcesadaService : IOrdenProcesadaService
    {
        private readonly IOrdenProcesadaRepositorio _ordenProcesadaRepositorio;

        public OrdenProcesadaService(IOrdenProcesadaRepositorio pedidoRepository)
        {
            _ordenProcesadaRepositorio = pedidoRepository;
        }
        public async Task AgregarOrdenProcesadaAsync(OrdenProcesada ordenProcesada)
        {
            await _ordenProcesadaRepositorio.AgregarAsync(ordenProcesada);
        }
    }
}
