using RigoRigoSimple.Aplicacion.Interface;
using RigoRigoSimple.Domain.Entities;
using RigoRigoSimple.Infraestructura.Interface;
using RigoRigoSimple.Infraestructura.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Aplicacion.Services
{
    public class ProductoService : IProductoService
    {
        private readonly IProductoRepositorio _productoRepositorio;

        public ProductoService(IProductoRepositorio productoRepositorio)
        {
            _productoRepositorio = productoRepositorio;
        }

        public async Task ActualizarProductoAsync(Producto producto)
        {
            await _productoRepositorio.ActualizarProductoAsync(producto);
        }

        public async Task AgregarProductoAsync(Producto producto)
        {
            await _productoRepositorio.AgregarProductoAsync(producto);
        }

        public async Task EliminarProductoAsync(Guid id)
        {
            await _productoRepositorio.EliminarProductoAsync(id);
        }

        public async Task<Producto?> ObtenerProductoIdAsync(Guid id)
        {
            return await _productoRepositorio.ObtenerProductoIdAsync(id);
        }

        public async Task<IEnumerable<Producto>> ObtenerProductosAsync()
        {
            return await _productoRepositorio.ObtenerProductosAsync();
        }
    }
}
