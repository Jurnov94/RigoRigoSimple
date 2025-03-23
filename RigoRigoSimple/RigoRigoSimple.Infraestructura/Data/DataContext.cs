using Microsoft.EntityFrameworkCore;
using RigoRigoSimple.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RigoRigoSimple.Infraestructura.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Producto> Productos { get; set; }
        public DbSet<OrdenProcesada> OrdenesProcesadas { get; set; }
        public DbSet<OrdenDetalle> OrdenesDetalles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<OrdenProcesada>()
                        .Property(o => o.Id)
                        .ValueGeneratedOnAdd();
            modelBuilder.Entity<Producto>().HasIndex(x => x.Nombre).IsUnique();
        }
    }
}
