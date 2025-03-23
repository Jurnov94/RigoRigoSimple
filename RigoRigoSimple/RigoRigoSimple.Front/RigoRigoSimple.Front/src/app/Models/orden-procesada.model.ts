import { OrdenDetalle } from "./orden-detalle.model";

export interface OrdenProcesada {
    id: string;
    cedula: string;
    direccion: string;
    detalles: OrdenDetalle[];
}