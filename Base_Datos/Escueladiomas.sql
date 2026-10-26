DROP DATABASE IF EXISTS escuela_idiomas;

CREATE DATABASE escuela_idiomas
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE escuela_idiomas;

CREATE TABLE idioma (
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE alumno (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    correo2 VARCHAR(100) NULL
);


CREATE TABLE profesor (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    telefono2 VARCHAR(20) NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    correo2 VARCHAR(100) NULL
);


CREATE TABLE profesor_idioma (
    id_profesor INT NOT NULL,
    id_idioma INT NOT NULL,

    PRIMARY KEY (id_profesor, id_idioma),

    CONSTRAINT fk_profesor_idioma_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor)
        ON DELETE CASCADE,

    CONSTRAINT fk_profesor_idioma_idioma
        FOREIGN KEY (id_idioma)
        REFERENCES idioma(id_idioma)
        ON DELETE CASCADE
);


-- ============================================================
-- TABLA: MATRICULA
-- Registra los idiomas que estudia cada alumno.
--
-- curso:
-- 1 = Primer curso
-- 2 = Segundo curso
--
-- ha_estado_en_centro:
-- 0 = No habia estado previamente en el centro
-- 1 = Ya habia estado previamente en el centro
--
-- curso_academico:
-- Ejemplo: 2026-2027
-- ============================================================

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,

    id_alumno INT NOT NULL,
    id_idioma INT NOT NULL,

    curso TINYINT NOT NULL,

    curso_academico VARCHAR(9) NOT NULL,

    ha_estado_en_centro BOOLEAN NOT NULL DEFAULT FALSE,

    CONSTRAINT fk_matricula_alumno
        FOREIGN KEY (id_alumno)
        REFERENCES alumno(id_alumno)
        ON DELETE CASCADE,

    CONSTRAINT fk_matricula_idioma
        FOREIGN KEY (id_idioma)
        REFERENCES idioma(id_idioma),

    CONSTRAINT chk_matricula_curso
        CHECK (curso IN (1, 2)),

    CONSTRAINT uq_matricula_alumno_idioma_academico
        UNIQUE (id_alumno, id_idioma, curso_academico)
);


-- ============================================================
-- TABLA: CLASE
-- Representa los grupos de alumnos.
--
-- Cada clase tiene:
-- - Un idioma.
-- - Un curso.
-- - Un profesor.
-- - Un identificador de grupo.
-- ============================================================

CREATE TABLE clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,

    id_idioma INT NOT NULL,

    curso TINYINT NOT NULL,

    grupo VARCHAR(10) NOT NULL DEFAULT 'A',

    id_profesor INT NOT NULL,

    CONSTRAINT fk_clase_idioma
        FOREIGN KEY (id_idioma)
        REFERENCES idioma(id_idioma),

    CONSTRAINT fk_clase_profesor
        FOREIGN KEY (id_profesor)
        REFERENCES profesor(id_profesor),

    CONSTRAINT chk_clase_curso
        CHECK (curso IN (1, 2)),

    CONSTRAINT uq_clase_grupo
        UNIQUE (id_idioma, curso, grupo)
);


-- ============================================================
-- TABLA: ALUMNO_CLASE
-- Relacion N:M entre alumnos y clases.
--
-- Permite asignar alumnos a grupos concretos.
-- ============================================================

CREATE TABLE alumno_clase (
    id_alumno INT NOT NULL,

    id_clase INT NOT NULL,

    PRIMARY KEY (id_alumno, id_clase),

    CONSTRAINT fk_alumno_clase_alumno
        FOREIGN KEY (id_alumno)
        REFERENCES alumno(id_alumno)
        ON DELETE CASCADE,

    CONSTRAINT fk_alumno_clase_clase
        FOREIGN KEY (id_clase)
        REFERENCES clase(id_clase)
        ON DELETE CASCADE
);


-- ============================================================
-- INDICES ADICIONALES
-- Facilitan las consultas habituales de la aplicacion.
-- ============================================================

CREATE INDEX idx_alumno_apellido
    ON alumno(apellido);

CREATE INDEX idx_profesor_apellido
    ON profesor(apellido);

CREATE INDEX idx_matricula_curso
    ON matricula(curso);

CREATE INDEX idx_clase_idioma_curso
    ON clase(id_idioma, curso);

CREATE INDEX idx_alumno_clase_clase
    ON alumno_clase(id_clase);


-- ============================================================
-- FIN DEL SCRIPT
-- ============================================================

