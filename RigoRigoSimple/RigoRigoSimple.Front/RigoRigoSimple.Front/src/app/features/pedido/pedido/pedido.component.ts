import { Component, OnInit } from '@angular/core';
import { PedidoService } from 'src/app/core/producto.service';
import { Producto } from 'src/app/Models/producto.model'; 
import { OrdenProcesada } from 'src/app/Models/orden-procesada.model';

@Component({
  selector: 'app-pedido',
  templateUrl: './pedido.component.html',
  styleUrls: ['./pedido.component.css']
})
export class PedidoComponent implements OnInit {
  productos: Producto[] = [];
  carrito: any[] = []; 
  cedula: string = ''; 
  direccion: string = '';
  total: number = 0;
  displayedColumnsProductos: string[] = ['nombre', 'precio', 'acciones'];
  displayedColumnsCarrito: string[] = ['nombre', 'cantidad', 'subtotal'];


  constructor(private pedidoService: PedidoService) {}

  ngOnInit(): void {
    debugger;
    this.obtenerProductos();
  }

  obtenerProductos() {
    this.pedidoService.obtenerProductos().subscribe((data) => {
      this.productos = data;
    });
  }

  agregarAlCarrito(producto: Producto) {
    const itemIndex = this.carrito.findIndex(p => p.productoId === producto.id);
  
    if (itemIndex !== -1) {
      this.carrito[itemIndex].cantidad++;
      this.carrito[itemIndex].subtotal = this.carrito[itemIndex].cantidad * this.carrito[itemIndex].precioUnitario;
    } else {
      this.carrito = [
        ...this.carrito,
        {
          productoId: producto.id,
          nombre: producto.nombre,
          cantidad: 1,
          precioUnitario: producto.precio,
          subtotal: producto.precio
        }
      ];
    }
  
    console.log('Carrito actualizado:', this.carrito);
  
    this.calcularTotal();
  }
  

  calcularTotal() {
    this.total = this.carrito.reduce((sum, item) => sum + item.subtotal, 0);
  }


  guardarOrden() {
    if (this.cedula && this.direccion && this.carrito.length > 0) {
      const orden: OrdenProcesada = {
        id: this.generarId(),
        cedula: this.cedula,
        direccion: this.direccion,
        detalles: this.carrito.map(item => ({
          ordenProcesadaId: this.generarId(),
          productoId: item.productoId,
          cantidad: item.cantidad,
          precioUnitario: item.precioUnitario
        }))
      };

      this.pedidoService.enviarOrden(orden).subscribe(() => {
        alert('Orden guardada con éxito');
      });
    } else {
      alert('Por favor complete todos los campos');
    }
  }


  generarId(): string {
    return '3fa85f64-5717-4562-b3fc-2c963f66afa6';
  }
}
