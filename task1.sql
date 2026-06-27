create table estudiantes(
 id_estudiante int primary key auto_increment,
 nombre_completo varchar(100) not null,
 correo_electronico varchar(200) unique not null,
 genero ENUM('Masculino', 'Femenino', 'Otro') not null,
 identificacion char(10) unique not null,
 carrera varchar(100) not null,
 fecha_nacimiento date not null,
 fecha_ingreso date not null
);

create table docentes(
id_docente int primary key auto_increment,
nombre_completo varchar(100) not null,
correo_institucional varchar(200) unique not null,
departamento_academico varchar(100) not null,
anios_experiencia TINYINT CHECK (anios_experiencia BETWEEN 0 AND 60)
);

create table cursos(
id_curso int primary key auto_increment,
id_docente int,
nombre varchar(100) not null,
codigo int UNIQUE not null CHECK (codigo > 0),
creditos tinyint not null CHECK (creditos BETWEEN 1 AND 6),
semestre varchar(100) not null,

foreign key (id_docente) references docentes(id_docente)
);

create table inscripciones(
 id_inscripcion int primary key auto_increment,
 id_estudiante int not null,
 id_curso int not null,
 fecha_inscripcion date not null,
 calificacion_final decimal(3,2) CHECK (calificacion_final >= 0.00 AND calificacion_final <= 5.00),
 
 foreign key (id_estudiante) references estudiantes(id_estudiante) ,
 foreign key (id_curso) references cursos(id_curso)
);