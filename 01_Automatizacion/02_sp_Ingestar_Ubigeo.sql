CREATE PROCEDURE dbo.sp_Ingestar_Ubigeo
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            
            SAVE TRANSACTION PuntoGuardado_Ubigeo;
            
            INSERT INTO dbo.Ubigeo (Codigo_Ubigeo, Departamento, Provincia, Distrito)
            SELECT DISTINCT 
                CAST(ubigeo AS INT), 
                dbo.fn_NormalizarTexto(departamento), 
                dbo.fn_NormalizarTexto(provincia), 
                dbo.fn_NormalizarTexto(distrito)
            FROM dbo.STG_Leishmaniosis
            WHERE ubigeo IS NOT NULL AND ISNUMERIC(ubigeo) = 1;
            
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION PuntoGuardado_Ubigeo;
            COMMIT TRANSACTION; 
            
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Error en la ingesta de Ubigeo: %s', 16, 1, @ErrorMsg);
    END CATCH
END;
GO