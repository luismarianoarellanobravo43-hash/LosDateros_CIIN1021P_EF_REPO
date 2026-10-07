# DataSalud Perú — Los Dateros

Proyecto integrador del curso **Base de Datos Avanzadas y Big Data (CIIN1021P)**.

El proyecto implementa una solución orientada a la gestión y análisis de información epidemiológica de **Leishmaniosis** del MINSA. Integra automatización en SQL Server, seguridad y auditoría, evaluación NoSQL con MongoDB, un Data Warehouse con proceso ETL, un dashboard en Power BI y análisis con PySpark.

## Integrantes

- Luis Mariana Arellano Bravo
- Jordan Fabian Canchumanya Cupe
- Samuel Rohi Gonzales Cruz
- Jorge Luis Mirano García

## Repositorio del proyecto

Repositorio GitHub del equipo:

`https://github.com/luismarianoarellanobravo43-hash/LosDateros_CIIN1021P_EF_REPO.git`

## Estructura del repositorio

```text
LosDateros_CIIN1021P_EF_REPO/
├── README.md
├── .gitignore
├── 01_Automatizacion/
│   ├── 00_Creacion_Base_y_Tablas.sql
│   ├── 01_fn_NormalizarTexto.sql
│   ├── 02_sp_Ingestar_Ubigeo.sql
│   ├── 03_sp_Ingestar_Atenciones.sql
│   ├── 04_trg_Integridad_Atenciones.sql
│   ├── 05_trg_Auditoria_Atenciones.sql
│   └── 06_Ejecutar_Ingesta_y_Log.sql
├── 02_Seguridad_Rendimiento/
│   ├── 01_Roles_y_Privilegios.sql
│   ├── 02_Backup_y_Restore.sql
│   └── 03_Analisis_Rendimiento.sql
├── 03_NoSQL/
│   └── CRUD_Atenciones_Clinicas.js
├── 04_BI_ETL/
│   ├── 01_Modelo_Estrella_DW.sql
│   ├── 02_Proceso_ETL.sql
│   └── Dashboard_DesafioFinal.pbix
├── 05_BigData/
│   └── Analisis_BigData_NoteBook_PySpark_LosDateros.ipynb
└── 06_Trazabilidad/
    ├── Matriz_Trazabilidad.md
    └── Inventario_Archivos.md
```

## Herramientas requeridas

- **Microsoft SQL Server** y **SQL Server Management Studio (SSMS)**.
- **MongoDB / MongoDB Compass**.
- **Power BI Desktop**.
- **Google Colab** o un entorno Python con **PySpark**.
- **Git y GitHub** para control de versiones y entrega.

## Instrucciones de ejecución

### 1. Crear la base operacional

Ejecutar primero:

`01_Automatizacion/00_Creacion_Base_y_Tablas.sql`

Este script crea la base de datos `DataSalud_Peru` si no existe y genera las tablas operacionales:

- `dbo.STG_Leishmaniosis`
- `dbo.Ubigeo`
- `dbo.Atencion_Leish`
- `dbo.Log_Auditoria`

El script contiene **solo el esquema**, no copia los registros del dataset.

Luego se debe cargar el archivo CSV de Leishmaniosis del MINSA en `dbo.STG_Leishmaniosis` mediante el mecanismo de importación usado por el equipo en SQL Server.

### 2. Automatización

Ejecutar en este orden:

1. `01_Automatizacion/01_fn_NormalizarTexto.sql`
2. `01_Automatizacion/02_sp_Ingestar_Ubigeo.sql`
3. `01_Automatizacion/03_sp_Ingestar_Atenciones.sql`
4. `01_Automatizacion/04_trg_Integridad_Atenciones.sql`
5. `01_Automatizacion/05_trg_Auditoria_Atenciones.sql`
6. `01_Automatizacion/06_Ejecutar_Ingesta_y_Log.sql`

Los procedimientos implementan manejo de excepciones y control transaccional. Los triggers validan la integridad de los datos y registran operaciones en `Log_Auditoria`.

### 3. Seguridad y rendimiento

Ejecutar:

1. `02_Seguridad_Rendimiento/01_Roles_y_Privilegios.sql`
2. `02_Seguridad_Rendimiento/02_Backup_y_Restore.sql`
3. `02_Seguridad_Rendimiento/03_Analisis_Rendimiento.sql`

Este bloque contiene la configuración de roles y privilegios, la política de respaldo/restauración y las pruebas de rendimiento asociadas al uso de índices.

### 4. MongoDB

Abrir `03_NoSQL/CRUD_Atenciones_Clinicas.js` en MongoDB Compass o `mongosh` y ejecutar las operaciones CRUD en orden:

1. Create
2. Read
3. Update
4. Delete

### 5. Data Warehouse y ETL

Ejecutar:

1. `04_BI_ETL/01_Modelo_Estrella_DW.sql`
2. `04_BI_ETL/02_Proceso_ETL.sql`

El modelo crea el esquema `dw`, las dimensiones `Dim_Tiempo`, `Dim_Ubigeo`, `Dim_Perfil_Paciente` y la tabla de hechos `Fact_Atenciones_Leish`.

El ETL realiza extracción, limpieza, normalización, enriquecimiento y carga del modelo dimensional.

### 6. Power BI

Abrir:

`04_BI_ETL/Dashboard_DesafioFinal.pbix`

El dashboard fue construido a partir de la información almacenada en SQL Server. Para actualizarlo en otro equipo se debe configurar la conexión a la instancia local de SQL Server donde se haya creado y cargado `DataSalud_Peru`.

### 7. Apache Spark / PySpark

Abrir:

`05_BigData/Analisis_BigData_NoteBook_PySpark_LosDateros.ipynb`

en Google Colab o en un entorno compatible con PySpark y ejecutar las celdas en orden.

**Nota de reproducibilidad:** la versión del notebook incluida en este repositorio contiene una celda de carga que referencia el archivo `Fact_Atenciones_Leish.csv` con separador `;`. Antes de ejecutarlo en otro entorno, debe colocarse el archivo utilizado por el equipo con ese nombre o actualizar la ruta de carga para que coincida con el archivo empleado en la ejecución real.

## Fuente de datos

Dataset principal:

- **Vigilancia Epidemiológica de Leishmaniosis (2000–2024)**
- Fuente: Ministerio de Salud del Perú (MINSA) — Datos Abiertos.

Los datos se utilizan con fines académicos dentro del proyecto DataSalud Perú.

## Trazabilidad

La matriz que relaciona temas del sílabo, actividades de práctica de campo, secciones del entregable y criterios de evaluación se encuentra en:

`06_Trazabilidad/Matriz_Trazabilidad.md`

El inventario de archivos organizados se encuentra en:

`06_Trazabilidad/Inventario_Archivos.md`

## Uso académico

Repositorio elaborado con fines académicos para el curso **Base de Datos Avanzadas y Big Data (CIIN1021P)**. Los datos fuente pertenecen a sus respectivas entidades públicas y conservan sus condiciones de uso originales.
