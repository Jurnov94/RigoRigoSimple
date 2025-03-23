using RigoRigoSimple.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Infraestructura.Interface
{
    public interface IOrdenProcesadaRepositorio
    {
        Task AgregarAsync(OrdenProcesada ordenProcesada);
    }
}
