CREATE PROCEDURE dbo.sp_Ingestar_Atenciones
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            
            SAVE TRANSACTION PuntoGuardado_Atenciones;
            
            INSERT INTO dbo.Atencion_Leish (Codigo_Ubigeo, Edad, Sexo, Enfermedad, Diagnostico, Anio, Semana)
            SELECT 
                CAST(ubigeo AS INT),
                CAST(edad AS INT),
                dbo.fn_NormalizarTexto(sexo),
                dbo.fn_NormalizarTexto(enfermedad),
                dbo.fn_NormalizarTexto(diagnostic),
                CAST(anio AS INT),
                CAST(semana AS INT)
            FROM dbo.STG_Leishmaniosis
            WHERE ubigeo IS NOT NULL AND ISNUMERIC(ubigeo) = 1
            AND edad IS NOT NULL AND ISNUMERIC(edad) = 1;
            
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION PuntoGuardado_Atenciones;
            COMMIT TRANSACTION;
            
        DECLARE @ErrorMsg VARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR ('Error en la ingesta de Atenciones: %s', 16, 1, @ErrorMsg);
    END CATCH
END;
GO