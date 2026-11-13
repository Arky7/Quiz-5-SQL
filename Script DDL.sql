CREATE DATABASE IF NOT EXISTS MiAutoPuntoCom;

USE miautopuntocom;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS vehiculos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS vendedores;

CREATE TABLE vehiculos (
    id_vehiculo  INT            NOT NULL AUTO_INCREMENT,
    marca        VARCHAR(50)    NOT NULL,
    modelo       VARCHAR(50)    NOT NULL,
    anio         SMALLINT       NOT NULL,  
    color        VARCHAR(30)    NOT NULL,
    precio       DECIMAL(12,2)  NOT NULL,
    vin          CHAR(17)       NOT NULL,
    tipo         VARCHAR(20)    NOT NULL,
    estado       VARCHAR(10)    NOT NULL,
    PRIMARY KEY (id_vehiculo),

    UNIQUE (vin),

    CHECK (precio > 0),
    CHECK (estado IN ('Nuevo', 'Usado')),
    CHECK (anio >= 1900)
);

CREATE TABLE clientes (
    id_cliente   INT            NOT NULL AUTO_INCREMENT,
    nombre       VARCHAR(50)    NOT NULL,
    apellido     VARCHAR(50)    NOT NULL,
    cedula       VARCHAR(20)    NOT NULL,
    telefono     VARCHAR(20)    NOT NULL,
    email        VARCHAR(100)   NOT NULL,
    direccion    VARCHAR(200)   NOT NULL,
    PRIMARY KEY (id_cliente),

    UNIQUE(cedula),
    UNIQUE(email),
    UNIQUE(telefono)
);

CREATE TABLE vendedores (
    id_vendedor         INT           NOT NULL AUTO_INCREMENT,
    nombre              VARCHAR(50)   NOT NULL,
    apellido            VARCHAR(50)   NOT NULL,
    cedula              VARCHAR(20)   NOT NULL,
    fecha_nacimiento    DATE          NOT NULL,
    fecha_contratacion  DATE          NOT NULL,
    comision            DECIMAL(5,2)  NOT NULL,  
    PRIMARY KEY (id_vendedor),

    UNIQUE(cedula),
    CHECK (comision BETWEEN 0 AND 20),
    CHECK (fecha_contratacion >= fecha_nacimiento + INTERVAL 21 YEAR)

);

CREATE TABLE ventas (
    id_venta      INT            NOT NULL AUTO_INCREMENT,
    id_vehiculo   INT            NOT NULL,
    id_cliente    INT            NOT NULL,
    id_vendedor   INT            NOT NULL,
    fecha_venta   DATE           NOT NULL,
    precio_final  DECIMAL(12,2)  NOT NULL,
    metodo_pago   VARCHAR(20)    NOT NULL,
    PRIMARY KEY (id_venta),
    
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos (id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores (id_vendedor),

    UNIQUE (id_vehiculo),
    CHECK (precio_final > 0)

);

SHOW TABLES;
DESCRIBE vehiculos;
DESCRIBE clientes;
DESCRIBE vendedores;


