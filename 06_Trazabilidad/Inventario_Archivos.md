# Inventario de archivos reorganizados

Este documento resume el origen de cada archivo del ZIP entregado por el equipo y su nueva ubicación.

| Archivo original | Nueva ubicación |
|---|---|
| Esquema generado desde SQL Server (tablas operacionales) | `01_Automatizacion/00_Creacion_Base_y_Tablas.sql` |
| SQLQuery1 - función escalar | `01_Automatizacion/01_fn_NormalizarTexto.sql` |
| SQLQuery2 - poblar Ubigeo | `01_Automatizacion/02_sp_Ingestar_Ubigeo.sql` |
| SQLQuery3 - poblar Atenciones | `01_Automatizacion/03_sp_Ingestar_Atenciones.sql` |
| SQLQuery4 - trigger integridad | `01_Automatizacion/04_trg_Integridad_Atenciones.sql` |
| SQLQuery5 - trigger auditoría | `01_Automatizacion/05_trg_Auditoria_Atenciones.sql` |
| SQLQuery6 - ejecución procedimientos | `01_Automatizacion/06_Ejecutar_Ingesta_y_Log.sql` |
| SQLQuery7 - roles y privilegios | `02_Seguridad_Rendimiento/01_Roles_y_Privilegios.sql` |
| SQLQuery8 - respaldos/restauración | `02_Seguridad_Rendimiento/02_Backup_y_Restore.sql` |
| SQLQuery9 - rendimiento | `02_Seguridad_Rendimiento/03_Analisis_Rendimiento.sql` |
| Scripts de MongoDB (CRUD).md | `03_NoSQL/CRUD_Atenciones_Clinicas.js` |
| SQLQuery10 - modelo físico estrella | `04_BI_ETL/01_Modelo_Estrella_DW.sql` |
| SQLQuery11 - proceso ETL | `04_BI_ETL/02_Proceso_ETL.sql` |
| Dashboard_DesafioFinal.pbix | `04_BI_ETL/Dashboard_DesafioFinal.pbix` |
| Analisis_BigData_NoteBook_PySpark_LosDateros.ipynb | `05_BigData/Analisis_BigData_NoteBook_PySpark_LosDateros.ipynb` |
