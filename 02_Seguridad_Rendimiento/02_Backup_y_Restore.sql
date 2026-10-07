USE master;
GO

BACKUP DATABASE DataSalud_Peru
TO DISK = 'C:\Backups\DataSalud_Peru_Full.bak'
WITH FORMAT, INIT, NAME = 'Copia Completa - DataSalud Peru';
GO


BACKUP DATABASE DataSalud_Peru
TO DISK = 'C:\Backups\DataSalud_Peru_Diff.bak'
WITH DIFFERENTIAL, NAME = 'Copia Diferencial - DataSalud Peru';
GO





-- 3. Script de Restauración
/*
USE master;
GO
-- Expulsa a los usuarios conectados para poder restaurar
ALTER DATABASE DataSalud_Peru SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Restaura la copia completa dejándola en estado de espera (NORECOVERY)
RESTORE DATABASE DataSalud_Peru
FROM DISK = 'C:\Backups\DataSalud_Peru_Full.bak'
WITH NORECOVERY, REPLACE;
GO

-- Restaura la copia diferencial y reactiva la base de datos (RECOVERY)
RESTORE DATABASE DataSalud_Peru
FROM DISK = 'C:\Backups\DataSalud_Peru_Diff.bak'
WITH RECOVERY;
GO

-- Vuelve a permitir múltiples usuarios
ALTER DATABASE DataSalud_Peru SET MULTI_USER;
GO
*/
