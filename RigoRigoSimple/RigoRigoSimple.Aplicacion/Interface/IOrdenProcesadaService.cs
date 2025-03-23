using RigoRigoSimple.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Aplicacion.Interface
{
    public interface IOrdenProcesadaService
    {
        Task AgregarOrdenProcesadaAsync(OrdenProcesada ordenProcesada);
    }
}
