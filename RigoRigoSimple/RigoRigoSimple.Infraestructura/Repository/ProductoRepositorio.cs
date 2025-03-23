using Microsoft.EntityFrameworkCore;
using RigoRigoSimple.Domain.Entities;
using RigoRigoSimple.Infraestructura.Data;
using RigoRigoSimple.Infraestructura.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Infraestructura.Repository
{
    public class ProductoRepositorio : IProductoRepositorio
    {
        private readonly DataContext _context;

        public ProductoRepositorio(DataContext context)
        {
            _context = context;
        }

        public async Task ActualizarProductoAsync(Producto producto)
        {
            
                _context.Productos.Update(producto);
                await _context.SaveChangesAsync();
           
        }


        public async Task AgregarProductoAsync(Producto producto)
        {
            _context.Productos.Add(producto);
            await _context.SaveChangesAsync();
        }


        public async Task EliminarProductoAsync(Guid id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto != null)
            {
                _context.Productos.Remove(producto);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<Producto?> ObtenerProductoIdAsync(Guid id)
        {
            return await _context.Productos.FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<IEnumerable<Producto>> ObtenerProductosAsync()
        {
            return await _context.Productos.ToArrayAsync();
        }

    }
}
