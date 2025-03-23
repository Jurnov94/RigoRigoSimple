Base de Datos

Restaurar la base de datos con el archivo que se encuentra en la carpeta SQL con el nombre de BBDD
Ejecutar el procedimiento almacenado que se encuentra en la carpeta SQL con el nombre de InsertarPedido

Ejecución de la aplicación Back-End

Configure como proyecto de arranque en visual studio el proyecto RigoRigoSimple.API
Cambie en el archivo appSettings.json la cadena de conexcion de su equipo el nombre der server Server="su servidor"
Ya puede ejecutar la aplicación del back

Ejecución de la aplicación Front-End

Abra el aplicativo del Front-End desde visual estudio code
En el archivo producto.service.ts cambie los valores por el de la URL de su API

private apiUrlOrdenes = 'https://{su_localhots}/api/Ordenes';
private apiUrlProductos = 'https://{su_localhots}/api/Productos';

