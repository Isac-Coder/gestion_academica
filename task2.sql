insert into estudiantes(nombre_completo,
    correo_electronico,
    genero,
    identificacion,
    carrera,
    fecha_nacimiento,
    fecha_ingreso)
    values (
	'Juan Pérez',
    'juan.perez@correo.com',
    'Masculino',
    '1234567890',
    'Ingeniería de Sistemas',
    '2003-05-15',
    '2024-01-22'
),(
	'Miguel Ramirez',
    'miguel.ramirez@correo.com',
    'Masculino',
    '1118835689',
    'Enfermeria',
    '2000-05-15',
    '2021-01-02'
),(
    'María Gómez',
    'maria.gomez@correo.com',
    'Femenino',
    '2345678901',
    'Administración de Empresas',
    '2002-11-08',
    '2024-01-22'
),(
    'Carlos Rodríguez',
    'carlos.rodriguez@correo.com',
    'Masculino',
    '3456789012',
    'Enfermeria',
    '2001-08-19',
    '2023-07-31'
),(
    'Valentina Herrera',
    'valentina.herrera@correo.com',
    'Femenino',
    '4567890123',
    'Administración de Empresas',
    '2004-03-27',
    '2025-01-20'
);

INSERT INTO docentes (
    nombre_completo,
    correo_institucional,
    departamento_academico,
    anios_experiencia
)
VALUES
(
    'Carlos Ramírez',
    'carlos.ramirez@universidad.edu',
    'Ingeniería de Sistemas',
    12
),(
    'Tania Valdes',
    'tania.valdes@universidad.edu',
    'Enfermeria',
    12
),(
    'Sharit Mendoza',
    'sharit.mendoza@universidad.edu',
    'Administración de Empresas',
    12
);

INSERT INTO cursos (
    id_docente,
    nombre,
    codigo,
    creditos,
    semestre
)
VALUES(
    1,
    'Bases de Datos',
    1001,
    4,
    '2026-1'
),(
    1,
    'Programación Orientada a Objetos',
    1002,
    3,
    '2026-1'
),(
    2,
    'Fundamentos de Enfermería',
    2001,
    5,
    '2026-1'
),(
    3,
    'Gestión Empresarial',
    3001,
    3,
    '2026-1'
);

INSERT INTO inscripciones (
    id_estudiante,
    id_curso,
    fecha_inscripcion,
    calificacion_final
)
VALUES
(
    1,
    1,
    '2026-02-01',
    4.50
),(
    1,
    2,
    '2026-02-01',
    4.20
),(
    2,
    3,
    '2026-02-02',
    4.80
),(
    3,
    4,
    '2026-02-03',
    4.70
),(
    4,
    3,
    '2026-02-04',
    3.90
),(
    5,
    4,
    '2026-02-05',
    4.60
),(
    3,
    2,
    '2026-02-06',
    4.10
),(
    5,
    1,
    '2026-02-06',
    3.80
);