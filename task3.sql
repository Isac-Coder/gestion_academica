select * from estudiantes join inscripciones on estudiantes.id_estudiante = inscripciones.id_estudiante;

select * from cursos join docentes on docentes.anios_experiencia > 5;

SELECT
c.id_curso,c.nombre,
round( AVG(i.calificacion_final),2) AS promedio_calificacion
FROM inscripciones i JOIN cursos c
ON i.id_curso = c.id_curso
group by c.id_curso, c.nombre;

SELECT
    e.id_estudiante,
    e.nombre_completo,
    COUNT(*) AS cantidad_cursos
FROM estudiantes e
JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante, e.nombre_completo
HAVING COUNT(*) > 1;

ALTER TABLE estudiantes
ADD COLUMN estado_academico ENUM('Activo', 'Inactivo', 'Graduado', 'Suspendido') NOT NULL DEFAULT 'Activo';

DELETE FROM docentes
WHERE id_docente = 1;

SELECT
    c.id_curso,
    c.nombre,
    COUNT(i.id_estudiante) AS cantidad_estudiantes
FROM cursos c
JOIN inscripciones i
ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre
HAVING COUNT(i.id_estudiante) >= 2;