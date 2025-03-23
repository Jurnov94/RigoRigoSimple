import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OrdenProcesada } from 'src/app/Models/orden-procesada.model';

@Injectable({
  providedIn: 'root'
})
export class PedidoService {

  private apiUrlOrdenes = 'https://localhost:7094/api/Ordenes';
  private apiUrlProductos = 'https://localhost:7094/api/Productos';

  constructor(private http: HttpClient) { }


  enviarOrden(orden: OrdenProcesada): Observable<void> {
    return this.http.post<void>(this.apiUrlOrdenes, orden);
  }

  obtenerProductos(): Observable<any> {
    return this.http.get<any>(this.apiUrlProductos);
  }
}