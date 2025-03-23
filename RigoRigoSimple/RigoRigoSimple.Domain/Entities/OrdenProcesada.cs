using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Domain.Entities
{
    public class OrdenProcesada
    {
        public Guid Id { get; set; }
        public string Cedula { get; set; } = null!;
        public string Direccion { get; set; } = null!;
        public List<OrdenDetalle> Detalles { get; set; } = new();

        public decimal Total => Detalles.Sum(d => d.Subtotal);

    }
}
