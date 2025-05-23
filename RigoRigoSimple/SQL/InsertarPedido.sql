USE [RigoRigo]
GO
/****** Object:  StoredProcedure [dbo].[InsertarPedido]    Script Date: 23/03/2025 11:19:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPedido]
    @Cedula NVARCHAR(50),
    @Direccion NVARCHAR(100),
    @Productos NVARCHAR(MAX)
AS
BEGIN
    DECLARE @OrdenId UNIQUEIDENTIFIER;

    SET @OrdenId = NEWID();

    INSERT INTO OrdenesProcesadas (Id, Cedula, Direccion)
    VALUES (@OrdenId, @Cedula, @Direccion);

    IF @OrdenId IS NULL
    BEGIN
        RAISERROR('No se pudo generar el GUID de la orden procesada', 16, 1);
        RETURN;
    END

    INSERT INTO OrdenesDetalles (OrdenProcesadaId, ProductoId, Cantidad, PrecioUnitario)
    SELECT 
        @OrdenId,
        ProductoId,
        Cantidad,
        PrecioUnitario
    FROM OPENJSON(@Productos)
    WITH (
        ProductoId UNIQUEIDENTIFIER,
        Cantidad INT,
        PrecioUnitario DECIMAL(18,2)
    );
END

