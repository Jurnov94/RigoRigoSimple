using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using RigoRigoSimple.Domain.Entities;
using RigoRigoSimple.Infraestructura.Data;
using RigoRigoSimple.Infraestructura.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace RigoRigoSimple.Infraestructura.Repository
{
    public class OrdenProcesadaRepositorio : IOrdenProcesadaRepositorio
    {

        private readonly DataContext _context;

        public OrdenProcesadaRepositorio(DataContext context)
        {
            _context = context;
        }

        public async Task AgregarAsync(OrdenProcesada ordenProcesada)
        {

            var productosJson = JsonSerializer.Serialize(ordenProcesada.Detalles.Select(d => new {
                d.ordenProcesadaId,
                d.ProductoId,
                d.Cantidad,
                d.PrecioUnitario
            }));

            await _context.Database.ExecuteSqlRawAsync(
                "EXEC InsertarPedido @Cedula, @Direccion, @Productos",
                new SqlParameter("@Cedula", ordenProcesada.Cedula),
                new SqlParameter("@Direccion", ordenProcesada.Direccion),
                new SqlParameter("@Productos", productosJson)
            );
        }

    }
}
