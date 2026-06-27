SELECT
    e.id_estudiante,
    e.nombre_completo,
    ROUND(AVG(i.calificacion_final), 2) AS promedio_estudiante
FROM estudiantes e
JOIN inscripciones i
ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante, e.nombre_completo
HAVING AVG(i.calificacion_final) > (
    SELECT AVG(calificacion_final)
    FROM inscripciones
);


SELECT DISTINCT e.carrera
FROM estudiantes e
WHERE EXISTS (
    SELECT 1
    FROM inscripciones i
    JOIN cursos c
    ON i.id_curso = c.id_curso
    WHERE i.id_estudiante = e.id_estudiante
      AND CAST(SUBSTRING_INDEX(c.semestre, '-', -1) AS UNSIGNED) >= 2
);

SELECT
    ROUND(AVG(calificacion_final), 2) AS promedio,
    SUM(calificacion_final) AS suma_calificaciones,
    MAX(calificacion_final) AS nota_maxima,
    MIN(calificacion_final) AS nota_minima,
    COUNT(*) AS total_calificaciones
FROM inscripciones;


