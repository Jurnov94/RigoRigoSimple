import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Routes } from '@angular/router';  // Importa RouterModule y Routes
import { FormsModule } from '@angular/forms';  // Si estás usando ngModel
import { AppComponent } from './app.component';
import { PedidoComponent } from './features/pedido/pedido/pedido.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';  // Importa tu componente Pedido

import { MatTableModule } from '@angular/material/table';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';

const appRoutes: Routes = [
  { path: '', component: PedidoComponent },

];

@NgModule({
  declarations: [
    AppComponent,
    PedidoComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(appRoutes),
    BrowserAnimationsModule,
    MatTableModule,
    MatButtonModule,
    MatInputModule,
    MatCardModule,
    MatIconModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }