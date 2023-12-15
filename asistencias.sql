drop database if exists escuela;
CREATE database escuela;
use escuela;


CREATE TABLE grupo(
	idGrupo int auto_increment primary key not null,
    nombreGrupo varchar(20) not null
);

CREATE TABLE usuario(
	idUsuario int auto_increment primary key not null,
    username varchar(20) not null,
    contrasenia varchar(20) not null,
    rol varchar(20) not null
);

CREATE TABLE docente(
idDocente int auto_increment PRIMARY KEY,
nombre varchar(40) not null,
apellido varchar(40) not null,
especialidad varchar(40) not null,
idUsuario int not null,
foreign key (idUsuario) references usuario(idUsuario)
);

CREATE TABLE materia(
	idMateria int auto_increment primary key not null,
    nombre varchar(20) not null
);

CREATE TABLE alumno(
idAlumno int auto_increment PRIMARY KEY,
nombre varchar(40) not null,
apellido varchar(40) not null,
fechaNacimiento date,
idGrupo int not null,
idUsuario int,
foreign key (idUsuario) references usuario(idUsuario),
foreign key (idGrupo) references grupo(idGrupo)
);

CREATE TABLE directivo(
idDirectivo int auto_increment PRIMARY KEY,
nombre varchar(40) not null,
apellido varchar(40) not null,
puesto varchar(20) not null,
idUsuario int not null,
foreign key (idUsuario) references usuario(idUsuario)
);

CREATE TABLE formatoLista(
	idFormatoLista int auto_increment primary key not null,
    idMateria int not null,
    idDocente int not null,
    idGrupo int not null,
    semanas int not null,
    periodo varchar(80) not null,
    nomenclatura bit,
    foreign key(idMateria)references materia(idMateria),
    foreign key(idDocente)references docente(idDocente),	
    foreign key(idGrupo)references grupo(idGrupo)
);

CREATE TABLE diaInhabil(
	idDiasInhabil int auto_increment primary key not null,
	fecha date,
    idFormatoLista int not null,
    foreign key(idFormatoLista)references formatoLista(idFormatoLista)
);


CREATE TABLE diaClase(
	idDiaClase int auto_increment primary key not null,
	dia varchar(20),
    idFormatoLista int not null,
    foreign key(idFormatoLista)references formatoLista(idFormatoLista)
);


CREATE TABLE horario(
	idHorario int auto_increment primary key not null,
    horario varchar(20),
    idDiaClase int not null,
    foreign key(idDiaClase)references diaClase(idDiaClase)
);

CREATE TABLE listaAsistencia(
	idListaAsistencia int auto_increment primary key not null,
    idAlumno int not null,
    idMateria int not null,
    idDocente int not null,
    dia date not null,
	hora varchar(20) not null,
    semana int not null,
    asistencia char not null,
    foreign key(idMateria)references materia(idMateria),
    foreign key(idDocente)references docente(idDocente),
    foreign key(idAlumno)references alumno(idAlumno)
);

CREATE VIEW VistaAsistenciaAlumnos AS
SELECT a.idAlumno, a.nombre AS NombreAlumno, a.apellido AS ApellidoAlumno,
       m.idMateria, m.nombre AS NombreMateria,
       d.idDocente, d.nombre AS NombreDocente, d.apellido AS ApellidoDocente,
       la.idListaAsistencia, la.dia AS FechaAsistencia, la.hora AS HoraAsistencia, la.semana AS Semana,
       la.asistencia AS Asistencia
FROM alumno a
INNER JOIN listaAsistencia la ON a.idAlumno = la.idAlumno
INNER JOIN materia m ON la.idMateria = m.idMateria
INNER JOIN docente d ON la.idDocente = d.idDocente;

Select * from VistaAsistenciaAlumnos;

CREATE VIEW VistaAsistenciaAlumnos2 AS
SELECT a.idAlumno, a.nombre AS NombreAlumno, a.apellido AS ApellidoAlumno,
       m.idMateria, m.nombre AS NombreMateria,
       d.idDocente, d.nombre AS NombreDocente, d.apellido AS ApellidoDocente,
       g.idGrupo, g.nombreGrupo AS NombreGrupo,
       la.idListaAsistencia, la.dia AS FechaAsistencia, la.hora AS HoraAsistencia, la.semana AS Semana,
       la.asistencia AS Asistencia
FROM alumno a
INNER JOIN listaAsistencia la ON a.idAlumno = la.idAlumno
INNER JOIN materia m ON la.idMateria = m.idMateria
INNER JOIN docente d ON la.idDocente = d.idDocente
INNER JOIN grupo g ON a.idGrupo = g.idGrupo;
Select * from VistaAsistenciaAlumnos2 where idAlumno = 1;

Select * from VistaAsistenciaAlumnos2;

INSERT INTO grupo(nombreGrupo) VALUES('IDGS701'),
									  ('IDGS702'),
									  ('IDGS703');
                                               
INSERT INTO usuario(username, contrasenia, rol)
VALUES
    ('usuario1', '1234', 'directivo'),
    ('usuario2', '1234', 'docente'),
    ('usuario3', '1234', 'docente'),
    ('usuario4', '1234', 'docente'),
    ('usuario5', '1234', 'docente'),
    ('usuario6', '1234', 'docente'),
    ('usuario7', '1234', 'docente'),
    ('usuario8', '1234', 'docente'),
    ('usuario9', '1234', 'alumno'),
    ('usuario10', '1234', 'alumno'),
    ('usuario11', '1234', 'alumno'),
    ('usuario12', '1234', 'alumno'),
    ('usuario13', '1234', 'alumno'),
    ('usuario14', '1234', 'alumno'),
    ('usuario15', '1234', 'alumno'),
    ('usuario16', '1234', 'alumno'),
    ('usuario17', '1234', 'alumno'),
    ('usuario18', '1234', 'alumno'),
    ('usuario19', '1234', 'alumno'),
    ('usuario20', '1234', 'alumno'),
    ('usuario21', '1234', 'alumno'),
    ('usuario22', '1234', 'alumno'),
    ('usuario23', '1234', 'alumno'),
    ('usuario24', '1234', 'alumno'),
    ('usuario25', '1234', 'alumno'),
    ('usuario26', '1234', 'alumno'),
    ('usuario27', '1234', 'alumno'),
    ('usuario28', '1234', 'alumno'),
    ('usuario29', '1234', 'alumno'),
    ('usuario30', '1234', 'alumno'),
    ('usuario31', '1234', 'alumno'),
    ('usuario32', '1234', 'alumno'),
    ('usuario33', '1234', 'alumno'),
    ('usuario34', '1234', 'alumno'),
    ('usuario35', '1234', 'alumno'),
    ('usuario36', '1234', 'alumno'),
    ('usuario37', '1234', 'alumno'),
    ('usuario38', '1234', 'alumno');

INSERT INTO directivo(nombre, apellido, puesto, idUsuario) VALUES('Nemesio', 'Oseguera Cervantes', 'Director', 1);
                
INSERT INTO docente (nombre, apellido, especialidad, idUsuario) VALUES 
	('Rosita', 'Flores', 'Ingles', 2),
    ('Juan Pablo', 'Romero Villegas', 'UX', 3),
    ('Jorge Armando', 'Morales Vargas', 'Arquitecturas', 4),
    ('Juan', 'Reynoso Neri', 'Metodologías', 5),
    ('JUAN CARLOS', 'FLORES ALFARO', 'MatemáticasI', 6),
    ('Ana Karina', 'Leon Gonzalez', 'Administración del Tiempo', 7),
    ('Domingo', 'García Órnelas', 'Seguridad informática', 8);

-- Inserts para el idGrupo 1
INSERT INTO alumno(nombre, apellido, fechaNacimiento, idGrupo, idUsuario)
VALUES
    ('Fernando', 'Valderrama Manrique', '2002-05-08', 1, 9),
    ('Felipe', 'Castro López', '2002-10-12', 1, 10),
    ('Carlos', 'Garza Sada', '2002-12-20', 1, 11),
    ('Salvador', 'Muñoz Evangelista', '2002-04-20', 1, 12),
    ('Laura', 'Martínez Ruiz', '2002-11-25', 1, 13),
    ('Elena', 'Hernández Gómez', '2002-09-15', 1, 14),
    ('Diego', 'Pérez López', '2002-03-30', 1, 15),
    ('Luisa', 'Gutiérrez Sánchez', '2002-07-18', 1, 16),
    ('Andrea', 'Torres Martínez', '2002-06-05', 1, 17),
    ('Javier', 'Ramírez Flores', '2002-02-28', 1, 18);

-- Inserts para el idGrupo 2
INSERT INTO alumno(nombre, apellido, fechaNacimiento, idGrupo, idUsuario)
VALUES
    ('Hector', 'Villa Cortez', '2002-10-12', 2, 19),
    ('José', 'Portillo Marquez', '2002-07-22', 2, 20),
    ('Ángel', 'García Dominguez', '2002-01-05', 2, 21),
    ('Tadeo', 'Gómez Godinez', '2002-02-14', 2, 22),
    ('Roberto', 'Dominguez Perez', '2002-08-18', 2, 23),
    ('Rosa', 'López Gómez', '2002-06-30', 2, 24),
    ('Alejandro', 'González Pérez', '2002-04-12', 2, 25),
    ('Paula', 'Sánchez García', '2002-12-10', 2, 26),
    ('Víctor', 'Martínez Rodríguez', '2002-10-01', 2, 27),
    ('Mariana', 'Hernández López', '2002-05-04', 2, 28);

-- Inserts para el idGrupo 3
INSERT INTO alumno(nombre, apellido, fechaNacimiento, idGrupo, idUsuario)
VALUES
    ('Daniel', 'Díaz Canel', '2002-10-01', 3, 29),
    ('Sofía', 'Neri Jaramillo', '2002-04-08', 3, 30),
    ('Eduardo', 'Guzmán Pérez', '2002-11-20', 3, 31),
    ('Valeria', 'Ramírez González', '2002-09-09', 3, 32),
    ('Juan', 'Martínez Sánchez', '2002-07-14', 3, 33),
    ('María', 'López Rodríguez', '2002-03-22', 3, 34),
    ('Gabriel', 'Gómez Martínez', '2002-06-27', 3, 35),
    ('Lucía', 'Hernández Flores', '2002-01-31', 3, 36),
    ('Adrián', 'Torres Ruiz', '2002-08-05', 3, 37),
    ('Marcelo', 'García Hernández', '2002-12-28', 3, 38);

INSERT INTO materia (nombre) VALUES 
    ('Inglés'),
    ('UX'),
    ('Arquitecturas'),
    ('Metodologías'),
    ('Matemáticas'),
    ('ADTI'),
    ('Seguridad Info');
									
                                                 
INSERT INTO formatoLista (idMateria, idDocente, idGrupo, semanas, periodo, nomenclatura)
VALUES (1, 1, 1, 14, "septiembre-diciembre", 0),
	   (2, 2, 1, 14, "septiembre-diciembre", 0),
       (3, 3, 1, 14, "septiembre-diciembre", 0),
       (4, 4, 1, 14, "septiembre-diciembre", 0),
       (5, 5, 1, 14, "septiembre-diciembre", 0),
       (6, 7, 1, 14, "septiembre-diciembre", 0),
       (7, 7, 1, 14, "septiembre-diciembre", 0),
       
       (1, 1, 2, 14, "septiembre-diciembre", 0),
	   (2, 2, 2, 14, "septiembre-diciembre", 0),
       (3, 3, 2, 14, "septiembre-diciembre", 0),
       (4, 4, 2, 14, "septiembre-diciembre", 0),
       (5, 5, 2, 14, "septiembre-diciembre", 0),
       (6, 7, 2, 14, "septiembre-diciembre", 0),
       (7, 7, 2, 14, "septiembre-diciembre", 0),
       
       (1, 1, 3, 14, "septiembre-diciembre", 0),
	   (2, 2, 3, 14, "septiembre-diciembre", 0),
       (3, 3, 3, 14, "septiembre-diciembre", 0),
       (4, 4, 3, 14, "septiembre-diciembre", 0),
       (5, 5, 3, 14, "septiembre-diciembre", 0),
       (6, 7, 3, 14, "septiembre-diciembre", 0),
       (7, 7, 3, 14, "septiembre-diciembre", 0),
       (7, 7, 3, 14, "septiembre-diciembre", 0);

INSERT INTO diaInhabil (fecha, idFormatoLista)
VALUES ('2023-01-01', 1), -- Año Nuevo
	   ('2023-01-20', 1), -- 20 de enero
       ('2023-02-05', 1), -- Día de la Constitución
       ('2023-03-21', 1), -- Natalicio de Benito Juárez
       ('2023-03-25', 1), -- Semana santa
       ('2023-03-26', 1), -- Semana santa
       ('2023-03-27', 1), -- Semana santa
       ('2023-03-28', 1), -- Semana santa
       ('2023-03-29', 1), -- Semana santa
       ('2023-03-30', 1), -- Semana santa
       ('2023-05-01', 1), -- Día del Trabajo
       ('2023-07-22', 1), -- Vacaciones de julio
       ('2023-07-23', 1), -- Vacaciones de julio
       ('2023-07-24', 1), -- Vacaciones de julio
       ('2023-07-25', 1), -- Vacaciones de julio
       ('2023-07-26', 1), -- Vacaciones de julio
       ('2023-07-29', 1), -- Vacaciones de julio
       ('2023-07-30', 1), -- Vacaciones de julio
       ('2023-07-31', 1), -- Vacaciones de julio
       ('2023-08-01', 1), -- Vacaciones de a
       ('2023-08-02', 1), -- Vacaciones de julio
       ('2023-09-16', 1), -- Día de la Independencia
       ('2023-09-26', 1), -- Dia de la UTL
       ('2023-11-02', 1), -- Dia de muertos
       ('2023-11-20', 1), -- Día de la Revolución
       ('2023-12-25', 1), -- Navidad
       ('2023-01-01', 2), -- Año Nuevo
       ('2023-02-05', 2), -- Día de la Constitución
       ('2023-03-21', 2), -- Natalicio de Benito Juárez
       ('2023-05-01', 2), -- Día del Trabajo
       ('2023-09-16', 2), -- Día de la Independencia
       ('2023-09-26', 2), -- Dia de la UTL
       ('2023-11-02', 2), -- Dia de muertos
       ('2023-11-20', 2), -- Día de la Revolución
       ('2023-12-25', 2); -- Navidad

-- A, F, R, J
-- Semana 1
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-09-04', '17:10', 1, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-09-04', '18:00', 1, 'A'),
    (1, 1, 1, '2023-09-04', '18:50', 1, 'A'),
    
    (1, 2, 2, '2023-09-04', '17:10', 1, 'A'), -- MATERIA 2
    (1, 2, 2, '2023-09-04', '18:00', 1, 'A'),
    (1, 2, 2, '2023-09-04', '18:50', 1, 'A'),
    
	(1, 3, 3, '2023-09-04', '17:10', 1, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 1, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 1, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 1, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 1, 'A'),
    
    (11, 1, 1, '2023-09-05', '17:10', 1, 'A'), -- ALUMNO 11 GRUPO 2
    (11, 1, 1, '2023-09-05', '18:00', 1, 'A'),
    (11, 1, 1, '2023-09-05', '18:50', 1, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 1, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 1, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 1, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 1, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 1, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 1, 'A'),
    
    (21, 1, 1, '2023-09-06', '17:10', 1, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-09-06', '18:00', 1, 'A'),
    (21, 1, 1, '2023-09-06', '18:50', 1, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 1, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 1, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 1, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 1, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 1, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 1, 'A');

-- Semana 2
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-09-11', '17:10', 2, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-09-11', '18:00', 2, 'A'),
    (1, 1, 1, '2023-09-11', '18:50', 2, 'A'),

    (1, 2, 2, '2023-09-04', '18:50', 2, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 2, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 2, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 2, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 2, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 2, 'A'),
    
    (11, 1, 1, '2023-09-12', '17:10', 2, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-09-12', '18:00', 2, 'A'),
    (11, 1, 1, '2023-09-12', '18:50', 2, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 2, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 2, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 2, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 2, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 2, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 2, 'A'),
	
    (21, 1, 1, '2023-09-13', '17:10', 2, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-09-13', '18:00', 2, 'A'),
    (21, 1, 1, '2023-09-13', '18:50', 2, 'A'),
    (21, 2, 2, '2023-09-06', '18:00', 2, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 2, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 2, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 2, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 2, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 2, 'A');


-- Semana 3
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-09-18', '17:10', 3, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-09-18', '18:00', 3, 'A'),
    (1, 1, 1, '2023-09-18', '18:50', 3, 'A'),
    
    (1, 2, 2, '2023-09-04', '18:50', 3, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 3, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 3, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 3, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 3, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 3, 'A'),
    
    (11, 1, 1, '2023-09-19', '17:10', 3, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-09-19', '18:00', 3, 'A'),
    (11, 1, 1, '2023-09-19', '18:50', 3, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 3, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 3, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 3, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 3, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 3, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 3, 'A'),
    
    (21, 1, 1, '2023-09-20', '17:10', 3, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-09-20', '18:00', 3, 'A'),
    (21, 1, 1, '2023-09-20', '18:50', 3, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 3, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 3, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 3, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 3, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 3, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 3, 'A');

-- Semana 4
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-09-25', '17:10', 4, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-09-25', '18:00', 4, 'A'),
    (1, 1, 1, '2023-09-25', '18:50', 4, 'A'),
    
    (1, 2, 2, '2023-09-04', '18:50', 4, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 4, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 4, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 4, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 4, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 4, 'A'),
    
    (11, 1, 1, '2023-09-26', '17:10', 4, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-09-26', '18:00', 4, 'A'),
    (11, 1, 1, '2023-09-26', '18:50', 4, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 4, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 4, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 4, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 4, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 4, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 4, 'A'),

    (21, 1, 1, '2023-09-27', '17:10', 4, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-09-27', '18:00', 4, 'A'),
    (21, 1, 1, '2023-09-27', '18:50', 4, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 4, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 4, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 4, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 4, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 4, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 4, 'A');
    
-- Semana 5
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
        (1, 1, 1, '2023-10-02', '17:10', 5, 'A'), -- ALUMNO 1
        (1, 1, 1, '2023-10-02', '18:00', 5, 'A'),
        (1, 1, 1, '2023-10-02', '18:50', 5, 'A'),
        
        (1, 2, 2, '2023-09-04', '18:50', 5, 'A'),
		(1, 3, 3, '2023-09-04', '17:10', 5, 'A'), 
		(1, 4, 4, '2023-09-04', '18:00', 5, 'A'),
		(1, 5, 5, '2023-09-04', '18:50', 5, 'A'),
		(1, 6, 6, '2023-09-04', '17:10', 5, 'A'),
		(1, 7, 7, '2023-09-04', '18:00', 5, 'A'),
        
        (11, 1, 1, '2023-10-03', '17:10', 5, 'A'), -- ALUMNO 2
        (11, 1, 1, '2023-10-03', '18:00', 5, 'A'),
        (11, 1, 1, '2023-10-03', '18:50', 5, 'A'),
        
        (11, 2, 2, '2023-09-05', '17:10', 5, 'A'), 
		(11, 3, 3, '2023-09-05', '18:00', 5, 'A'),
		(11, 4, 4, '2023-09-05', '18:50', 5, 'A'),
		(11, 5, 5, '2023-09-05', '18:50', 5, 'A'),
		(11, 6, 6, '2023-09-05', '18:50', 5, 'A'),
		(11, 7, 7, '2023-09-05', '18:50', 5, 'A'),
        
        (21, 1, 1, '2023-10-04', '17:10', 5, 'A'), -- ALUMNO 21 GRUPO 3
		(21, 1, 1, '2023-10-04', '18:00', 5, 'A'),
		(21, 1, 1, '2023-10-04', '18:50', 35, 'A'),
        
        (21, 2, 2, '2023-09-06', '18:00', 5, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 5, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 5, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 5, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 5, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 5, 'A');
        
-- Semana 6
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-10-09', '17:10', 6, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-10-09', '18:00', 6, 'A'),
    (1, 1, 1, '2023-10-09', '18:50', 6, 'A'),
    
    (1, 2, 2, '2023-09-04', '18:50', 6, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 6, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 6, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 6, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 6, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 6, 'A'),

    (11, 1, 1, '2023-10-10', '17:10', 6, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-10-10', '18:00', 6, 'A'),
    (11, 1, 1, '2023-10-10', '18:50', 6, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 6, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 6, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 6, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 6, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 6, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 6, 'A'),
    
    (21, 1, 1, '2023-10-11', '17:10', 6, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-10-11', '18:00', 6, 'A'),
    (21, 1, 1, '2023-10-11', '18:50', 6, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 6, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 6, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 6, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 6, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 6, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 6, 'A');

-- Semana 7
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-10-16', '17:10', 7, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-10-16', '18:00', 7, 'A'),
    (1, 1, 1, '2023-10-16', '18:50', 7, 'A'),

	(1, 2, 2, '2023-09-04', '18:50', 7, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 7, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 7, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 7, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 7, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 7, 'A'),
    
    (11, 1, 1, '2023-10-17', '17:10', 7, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-10-17', '18:00', 7, 'A'),
    (11, 1, 1, '2023-10-17', '18:50', 7, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 7, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 7, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 7, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 7, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 7, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 7, 'A'),
    
    (21, 1, 1, '2023-10-17', '17:10', 7, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-10-17', '18:00', 7, 'A'),
    (21, 1, 1, '2023-10-17', '18:50', 7, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 7, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 7, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 7, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 7, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 7, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 7, 'A');
-- Semana 8
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-10-23', '17:10', 8, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-10-23', '18:00', 8, 'A'),
    (1, 1, 1, '2023-10-23', '18:50', 8, 'A'),
    
    (1, 2, 2, '2023-09-04', '18:50', 9, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 9, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 9, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 9, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 9, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 9, 'A'),
    
    (11, 1, 1, '2023-10-24', '17:10', 8, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-10-24', '18:00', 8, 'A'),
    (11, 1, 1, '2023-10-24', '18:50', 8, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 8, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 8, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 8, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 8, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 8, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 8, 'A'),

    (21, 1, 1, '2023-10-24', '17:10', 8, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-10-24', '18:00', 8, 'A'),
    (21, 1, 1, '2023-10-24', '18:50', 8, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 8, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 8, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 8, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 8, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 8, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 8, 'A');


-- Semana 9
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-10-30', '17:10', 9, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-10-30', '18:00', 9, 'A'),
    (1, 1, 1, '2023-10-30', '18:50', 9, 'A'),

	(1, 2, 2, '2023-09-04', '18:50', 9, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 9, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 9, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 9, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 9, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 9, 'A'),

    (11, 1, 1, '2023-10-31', '17:10', 9, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-10-31', '18:00', 9, 'A'),
    (11, 1, 1, '2023-10-31', '18:50', 9, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 9, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 9, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 9, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 9, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 9, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 9, 'A'),
    
    (21, 1, 1, '2023-10-11', '17:10', 9, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-10-11', '18:00', 9, 'A'),
    (21, 1, 1, '2023-10-11', '18:50', 9, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 9, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 9, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 9, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 9, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 9, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 9, 'A');
    
-- Semana 10
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-11-06', '17:10', 10, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-11-06', '18:00', 10, 'A'),
    (1, 1, 1, '2023-11-06', '18:50', 10, 'A'),
    
    (1, 2, 2, '2023-09-04', '18:50', 10, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 10, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 10, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 10, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 10, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 10, 'A'),
    
    (11, 1, 1, '2023-11-07', '17:10', 10, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-11-07', '18:00', 10, 'A'),
    (11, 1, 1, '2023-11-07', '18:50', 10, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 10, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 10, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 10, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 10, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 10, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 10, 'A'),
    
    
    (21, 1, 1, '2023-11-08', '17:10', 10, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-11-08', '18:00', 10, 'A'),
    (21, 1, 1, '2023-11-08', '18:50', 10, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 10, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 10, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 10, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 10, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 10, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 10, 'A');

-- Semana 11
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-11-13', '17:10', 11, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-11-13', '18:00', 11, 'A'),
    (1, 1, 1, '2023-11-13', '18:50', 11, 'A'),
    
     (1, 2, 2, '2023-09-04', '18:50', 11, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 11, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 11, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 11, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 11, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 11, 'A'),
    
    (11, 1, 1, '2023-11-14', '17:10', 11, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-11-14', '18:00', 11, 'A'),
    (11, 1, 1, '2023-11-14', '18:50', 11, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 11, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 11, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 11, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 11, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 11, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 11, 'A'),
    
    (21, 1, 1, '2023-11-14', '17:10', 11, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-11-14', '18:00', 11, 'A'),
    (21, 1, 1, '2023-11-14', '18:50', 11, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 11, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 11, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 11, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 11, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 11, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 11, 'A');
    

-- Semana 12
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-11-20', '17:10', 12, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-11-20', '18:00', 12, 'A'),
    (1, 1, 1, '2023-11-20', '18:50', 12, 'A'),
    
     (1, 2, 2, '2023-09-04', '18:50', 12, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 12, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 12, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 12, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 12, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 12, 'A'),

    (11, 1, 1, '2023-11-21', '17:10', 12, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-11-21', '18:00', 12, 'A'),
    (11, 1, 1, '2023-11-21', '18:50', 12, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 12, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 12, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 12, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 12, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 12, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 12, 'A'),
    
    (21, 1, 1, '2023-11-22', '17:10', 12, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-11-22', '18:00', 12, 'A'),
    (21, 1, 1, '2023-11-22', '18:50', 12, 'A'),
    
     (21, 2, 2, '2023-09-06', '18:00', 12, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 12, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 12, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 12, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 12, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 12, 'A');
    
    
-- Semana 13
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-11-27', '17:10', 13, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-11-27', '18:00', 13, 'A'),
    (1, 1, 1, '2023-11-27', '18:50', 13, 'A'),
    
     (1, 2, 2, '2023-09-04', '18:50', 13, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 13, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 13, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 13, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 13, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 13, 'A'),
    
    (11, 1, 1, '2023-11-28', '17:10', 13, 'A'), -- ALUMNO 1
    (11, 1, 1, '2023-11-28', '18:00', 13, 'A'),
    (11, 1, 1, '2023-11-28', '18:50', 13, 'A'),
    
    (11, 2, 2, '2023-09-05', '17:10', 13, 'A'), 
    (11, 3, 3, '2023-09-05', '18:00', 13, 'A'),
    (11, 4, 4, '2023-09-05', '18:50', 13, 'A'),
    (11, 5, 5, '2023-09-05', '18:50', 13, 'A'),
    (11, 6, 6, '2023-09-05', '18:50', 13, 'A'),
    (11, 7, 7, '2023-09-05', '18:50', 13, 'A'),
		
	(21, 1, 1, '2023-11-28', '17:10', 13, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-11-28', '18:00', 13, 'A'),
    (21, 1, 1, '2023-11-28', '18:50', 13, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 13, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 13, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 13, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 13, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 13, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 13, 'A');
    

-- Semana 14
INSERT INTO listaAsistencia (idAlumno, idMateria, idDocente, dia, hora, semana, asistencia)
VALUES 
    (1, 1, 1, '2023-12-04', '17:10', 14, 'A'), -- ALUMNO 1
    (1, 1, 1, '2023-12-04', '18:00', 14, 'A'),
    (1, 1, 1, '2023-12-04', '18:50', 14, 'A'),
    
     (1, 2, 2, '2023-09-04', '18:50', 14, 'A'),
	(1, 3, 3, '2023-09-04', '17:10', 14, 'A'), 
    (1, 4, 4, '2023-09-04', '18:00', 14, 'A'),
    (1, 5, 5, '2023-09-04', '18:50', 14, 'A'),
    (1, 6, 6, '2023-09-04', '17:10', 14, 'A'),
    (1, 7, 7, '2023-09-04', '18:00', 14, 'A'),
    
    (11, 1, 1, '2023-12-05', '17:10', 14, 'A'), -- ALUMNO 2
    (11, 1, 1, '2023-12-05', '18:00', 14, 'A'),
    (11, 1, 1, '2023-12-05', '18:50', 14, 'A'),
    
    (21, 1, 1, '2023-12-06', '17:10', 14, 'A'), -- ALUMNO 21 GRUPO 3
    (21, 1, 1, '2023-12-06', '18:00', 14, 'A'),
    (21, 1, 1, '2023-12-06', '18:50', 14, 'A'),
    
    (21, 2, 2, '2023-09-06', '18:00', 14, 'A'),
    (21, 3, 3, '2023-09-06', '18:50', 14, 'A'),
    (21, 4, 4, '2023-09-06', '18:00', 14, 'A'),
    (21, 5, 5, '2023-09-06', '18:50', 14, 'A'),
    (21, 6, 6, '2023-09-06', '18:00', 14, 'A'),
    (21, 7, 7, '2023-09-06', '18:50', 14, 'A');
    
    
    
INSERT INTO diaClase (dia, idFormatoLista)
VALUES 
    ('Lunes', 1),    
    ('Martes', 2), 
    ('Miercoles', 3),
    ('Jueves', 4),
    ('Viernes', 5),
    ('Sábado', 6),
    ('Sábado', 7),
    
    ('Lunes', 9),    
    ('Martes', 8), 
    ('Miercoles', 11),
    ('Jueves', 10),
    ('Viernes', 12),
    ('Sábado', 13),
    ('Sábado', 14),
    
    ('Lunes', 15),    
    ('Martes', 16), 
    ('Miercoles', 17),
    ('Jueves', 18),
    ('Viernes', 19),
    ('Sábado', 20),
    ('Sábado', 21);


INSERT INTO horario (horario, idDiaClase) VALUES ('17:00', 1), -- LUNES
												 ('18:00', 1),
												 ('19:00', 1),
                                                 
                                                 ('17:00', 2), -- MARTES
												 ('18:00', 2),
												 ('19:00', 2),
                                                 
                                                 ('17:00', 3), -- MIERCOLES
												 ('18:00', 3),
												 ('19:00', 3),
                                                 
                                                 ('17:00', 4), -- JUEVES
												 ('18:00', 4),
												 ('19:00', 4),
                                                 
                                                 ('17:00', 5), -- VIERNES
												 ('18:00', 5),
												 ('19:00', 5),
                                                 
                                                 ('17:00', 6), -- SABADO
												 ('18:00', 6),
												 ('19:00', 6),
                                                 
                                                 ('20:00', 7), 
												 ('21:00', 7),
                                                 
                                                 ('17:00', 8), -- LUNES
												 ('18:00', 8),
												 ('19:00', 8),
                                                 
                                                 ('17:00', 9), -- MARTES
												 ('18:00', 9),
												 ('19:00', 9),
                                                 
                                                 ('17:00', 10), -- MIERCOLES
												 ('18:00', 10),
												 ('19:00', 10),
                                                 
                                                 ('17:00', 11), -- JUEVES
												 ('18:00', 11),
												 ('19:00', 11),
                                                 
                                                 ('17:00', 12), -- VIERNES
												 ('18:00', 12),
												 ('19:00', 12),
                                                 
                                                 ('17:00', 13), -- SABADO
												 ('18:00', 13),
												 ('19:00', 13),
                                                 
                                                 ('20:00', 14), 
												 ('21:00', 14),
                                                 
                                                 ('17:00', 15), -- LUNES
												 ('18:00', 15),
												 ('19:00', 15),
                                                 
                                                 ('17:00', 16), -- MARTES
												 ('18:00', 16),
												 ('19:00', 16),
                                                 
                                                 ('17:00', 17), -- MIERCOLES
												 ('18:00', 17),
												 ('19:00', 17),
                                                 
                                                 ('17:00', 18), -- JUEVES
												 ('18:00', 18),
												 ('19:00', 18),
                                                 
                                                 ('17:00', 19), -- VIERNES
												 ('18:00', 19),
												 ('19:00', 19),
                                                 
                                                 ('17:00', 20), -- SABADO
												 ('18:00', 20),
												 ('19:00', 20),
                                                 
                                                 ('20:00', 21), -- MARTES
												 ('21:00', 21);
											
                                                 
                                                 
                                                 
                                                 
                                                 
												 
