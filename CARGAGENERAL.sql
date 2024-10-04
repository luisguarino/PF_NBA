USE Sportics_LAM;

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
 
 --PROCEDIMIENTO PARA LEER EL ARCHIVO DE DATOS A ACTUALIZAR
CREATE PROCEDURE LECTURA_ARCHIVOS
AS
BEGIN
    BEGIN TRY
        
      BULK INSERT player_stats_temp
	FROM 'C:\Users\raulp\Desktop\mariana\PROYECTO FINAL HENRY\tareasautomatizadas\Datos_BrutosKnicks - FILTRADO 2024 NBA Player Stats - Regular - Hoja 1.csv'
	WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2)

    END TRY
    BEGIN CATCH
        -- Mostrar el mensaje de error
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO

EXEC LECTURA_ARCHIVOS
--PROCEDIMIENTO PARA CARGAR LOS DATOS ACTUALES
CREATE PROCEDURE [dbo].[AutomatizacionDatos]
AS
BEGIN
    BEGIN TRY
        -- Insertar en la tabla Conductores_TEMP
      INSERT INTO [Sportics_LAM].[dbo].[player_stats] (
    [Rk], [Player], [Pos], [Age], [Tm], 
    [G], [GS], [MP], [FG], [FGA], 
    [FG1], [_3P], [_3PA], [_3P1], [_2P], 
    [_2PA], [_2P1], [eFG], [FT], [FTA], 
    [FT1], [ORB], [DRB], [TRB], [AST], 
    [STL], [BLK], [TOV], [PF], [PTS], 
    [Season], [Season_type], [player_id]
)
SELECT 
    [Rk], [Player], [Pos], [Age], [Tm], 
    [G], [GS], [MP], [FG], [FGA], 
    [FG1], [_3P], [_3PA], [_3P1], [_2P], 
    [_2PA], [_2P1], [eFG], [FT], [FTA], 
    [FT1], [ORB], [DRB], [TRB], [AST], 
    [STL], [BLK], [TOV], [PF], [PTS], 
    [Season], [Season_type], [player_id]
FROM [player_stats_temp]  

        PRINT 'Ingesta de datos completada con éxito';
    END TRY
    BEGIN CATCH
        -- Mostrar el mensaje de error
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO

--PROCEDIMIENTO FINAL DE AUTOMATIZACIION

CREATE PROCEDURE AUTOMATIZACION_GENERAL_SLAM
AS
BEGIN
    -- Llamar al primer procedimiento
   
   EXEC LECTURA_ARCHIVOS;

   EXEC AutomatizacionDatos;

    -- Llamar al segundo procedimiento
   DELETE  FROM player_stats_temp; 

    
END;

EXEC AUTOMATIZACION_GENERAL_SLAM