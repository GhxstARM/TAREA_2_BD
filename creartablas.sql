-- CREACION DE ESQUEMA ; INICIO PRIMERA EJECUCIÓN

CREATE SCHEMA tarea2bd;

-- TERMINO PRIMERA EJECUCIÓN
-- INICIO SEGUNDA EJECUCIÓN

USE tarea2bd;

CREATE TABLE especialidades (
    especialidad_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (especialidad_id)
);

CREATE TABLE revisores (
    revisor_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(320) NOT NULL,
    PRIMARY KEY (revisor_id)
);

CREATE TABLE revisores_especialidades (
    revisor_id INT NOT NULL,
    especialidad_id INT NOT NULL,
    PRIMARY KEY (revisor_id, especialidad_id),
    FOREIGN KEY (especialidad_id) REFERENCES especialidades(especialidad_id) ON DELETE CASCADE,
    FOREIGN KEY (revisor_id) REFERENCES revisores(revisor_id) ON DELETE CASCADE
);

CREATE TABLE articulos (
    articulo_id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    fecha_envio DATE NOT NULL,
    resumen VARCHAR(150) NOT NULL,
    PRIMARY KEY (articulo_id)
);

CREATE TABLE articulos_revisores (
    articulo_id INT NOT NULL,
    revisor_id INT NOT NULL,
    PRIMARY KEY (articulo_id, revisor_id),
    FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id),
    FOREIGN KEY (revisor_id) REFERENCES revisores(revisor_id)
);

CREATE TABLE articulos_especialidades (
    articulo_id INT NOT NULL,
    especialidad_id INT NOT NULL,
    PRIMARY KEY (articulo_id, especialidad_id),
    FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id) ON DELETE CASCADE,
    FOREIGN KEY (especialidad_id) REFERENCES especialidades(especialidad_id) ON DELETE CASCADE
);

CREATE TABLE autores (
    autor_id INT NOT NULL AUTO_INCREMENT,
    rut VARCHAR(12) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(320) NOT NULL,
    PRIMARY KEY (autor_id)
);

CREATE TABLE articulos_autores (
    articulo_id INT NOT NULL,
    autor_id INT NOT NULL,
    es_contacto BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (articulo_id, autor_id),
    FOREIGN KEY (articulo_id) REFERENCES articulos(articulo_id),
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

CREATE TABLE usuarios (
    user_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(320) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    revisor_id INT,
    autor_id INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (revisor_id) REFERENCES revisores(revisor_id) ON DELETE CASCADE,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

-- FIN SEGUNDA EJECUCION
