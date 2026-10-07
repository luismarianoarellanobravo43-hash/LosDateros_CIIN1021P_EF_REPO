// DataSalud_Peru - Operaciones CRUD en MongoDB
// Colección: Atenciones_Clinicas

use DataSalud_Peru_NoSQL;

// CREATE - inserción de documentos con estructura flexible
db.Atenciones_Clinicas.insertMany([
  {
    "ID_Paciente": "PAC-1001",
    "Fecha": ISODate("2024-05-10T08:30:00Z"),
    "Enfermedad": "LEISHMANIASIS CUTANEA",
    "Ubigeo": "130101",
    "Datos_Clinicos": {
      "Edad": 45,
      "Sexo": "M"
    },
    "Sintomas_Variables": ["Ulcera cutanea", "Fiebre leve"],
    "Requiere_Hospitalizacion": false
  },
  {
    "ID_Paciente": "PAC-1002",
    "Fecha": ISODate("2024-05-12T10:15:00Z"),
    "Enfermedad": "LEISHMANIASIS MUCOCUTANEA",
    "Ubigeo": "130101",
    "Datos_Clinicos": {
      "Edad": 32,
      "Sexo": "F"
    },
    "Sintomas_Variables": ["Lesion nasal", "Dificultad respiratoria"],
    "Examenes_Laboratorio": {
      "Frotis": "Positivo",
      "Cultivo": "Pendiente"
    }
  },
  {
    "ID_Paciente": "PAC-1003",
    "Fecha": ISODate("2024-05-15T14:20:00Z"),
    "Enfermedad": "LEISHMANIASIS CUTANEA",
    "Ubigeo": "130108",
    "Datos_Clinicos": {
      "Edad": 65,
      "Sexo": "M"
    },
    "Sintomas_Variables": ["Multiples ulceras", "Fatiga", "Perdida de peso"],
    "Comorbilidades": ["Hipertension", "Diabetes Tipo 2"],
    "Requiere_Hospitalizacion": true
  }
]);

// READ
db.Atenciones_Clinicas.find({ "Requiere_Hospitalizacion": true }).pretty();

// UPDATE
db.Atenciones_Clinicas.updateOne(
  { "ID_Paciente": "PAC-1002" },
  { $set: { "Examenes_Laboratorio.Cultivo": "Positivo - Leishmania braziliensis" } }
);

// DELETE
db.Atenciones_Clinicas.deleteOne({ "ID_Paciente": "PAC-1001" });
