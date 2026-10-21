-- ============================================================
--  BASE DE DATOS: ESCUELA DE IDIOMAS (MySQL)
-- ============================================================
--  Relaciones:
--   alumno   N:M idioma  -> tabla matricula
--   profesor 1:N clase   -> clase.id_profesor
--   idioma   1:N clase   -> clase.id_idioma
--   alumno   N:M clase   -> tabla alumno_clase
-- ============================================================
DROP DATABASE IF EXISTS escuela_idiomas;
CREATE DATABASE escuela_idiomas;
USE escuela_idiomas;

-- ------------------------------------------------------------
-- IDIOMAS
-- ------------------------------------------------------------
CREATE TABLE idioma (
    id_idioma INT AUTO_INCREMENT PRIMARY KEY,
    nombre    VARCHAR(50) NOT NULL UNIQUE
);

-- ------------------------------------------------------------
-- ALUMNOS (datos personales; el idioma va en la matrícula)
-- ------------------------------------------------------------
CREATE TABLE alumno (
    id_alumno  INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(50)  NOT NULL,
    apellido   VARCHAR(80)  NOT NULL,
    edad       TINYINT UNSIGNED NOT NULL,
    telefono   VARCHAR(20)  NOT NULL,
    telefono2  VARCHAR(20)  NULL,
    correo     VARCHAR(100) NOT NULL UNIQUE,
    correo2    VARCHAR(100) NULL
);

-- ------------------------------------------------------------
-- MATRÍCULA (N:M alumno - idioma)
-- ha_estado_en_centro: 0 = nuevo (primer curso), 1 = ya estuvo (segundo curso)
-- Se guarda por idioma, porque un alumno puede ser nuevo en uno y no en otro.
-- ------------------------------------------------------------
CREATE TABLE matricula (
    id_alumno            INT NOT NULL,
    id_idioma            INT NOT NULL,
    ha_estado_en_centro  BOOLEAN NOT NULL DEFAULT 0,
    curso                TINYINT GENERATED ALWAYS AS (IF(ha_estado_en_centro, 2, 1)) STORED,
    PRIMARY KEY (id_alumno, id_idioma),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno) ON DELETE CASCADE,
    FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma)
);

-- ------------------------------------------------------------
-- PROFESORES (id_idioma = idioma que imparte)
-- ------------------------------------------------------------
CREATE TABLE profesor (
    id_profesor  INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(50)  NOT NULL,
    apellido     VARCHAR(80)  NOT NULL,
    edad         TINYINT UNSIGNED NOT NULL,
    telefono     VARCHAR(20)  NOT NULL,
    telefono2    VARCHAR(20)  NULL,
    correo       VARCHAR(100) NOT NULL UNIQUE,
    correo2      VARCHAR(100) NULL,
    id_idioma    INT NOT NULL,
    FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma)
);

-- ------------------------------------------------------------
-- CLASES (1:N profesor - clase): un profesor puede dar varias clases
-- ------------------------------------------------------------
CREATE TABLE clase (
    id_clase     INT AUTO_INCREMENT PRIMARY KEY,
    id_idioma    INT NOT NULL,
    curso        TINYINT NOT NULL CHECK (curso IN (1, 2)),
    id_profesor  INT NOT NULL,
    FOREIGN KEY (id_idioma)   REFERENCES idioma(id_idioma),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

-- ------------------------------------------------------------
-- ALUMNOS EN CADA CLASE (N:M alumno - clase)
-- ------------------------------------------------------------
CREATE TABLE alumno_clase (
    id_alumno INT NOT NULL,
    id_clase  INT NOT NULL,
    PRIMARY KEY (id_alumno, id_clase),
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno) ON DELETE CASCADE,
    FOREIGN KEY (id_clase)  REFERENCES clase(id_clase)   ON DELETE CASCADE
);