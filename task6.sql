create role revisor_academico;

GRANT SELECT
ON vista_historial_academico
TO revisor_academico;

REVOKE INSERT, UPDATE, DELETE
ON gestion_academica_universidad.inscripciones
FROM revisor_academico;

START TRANSACTION;

UPDATE inscripciones
SET calificacion_final = 4.80
WHERE id_inscripcion = 1;

SAVEPOINT punto1;

ROLLBACK TO SAVEPOINT punto1;

COMMIT;