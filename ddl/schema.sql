DROP DATABASE IF EXISTS garage_elite_campus; 

CREATE DATABASE garage_elite_campus; 

USE garage_elite_campus; 

CREATE TABLE clientes( 
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    apellido VARCHAR(50) NOT NULL, 
    telefono VARCHAR(15) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    estado VARCHAR(20) NOT NULL, 
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
)ENGINE=InnoDB; 

CREATE TABLE vehiculos( 
    id_vehiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_cliente INT NOT NULL, 
    tipo_vehiculo VARCHAR(50) NOT NULL, 
    marca VARCHAR(50) NOT NULL, 
    modelo VARCHAR(50) NOT NULL, 
    placa VARCHAR(20) NOT NULL UNIQUE, 
    color VARCHAR(30) NOT NULL, 
    anio INT NOT NULL, 

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) 
)ENGINE=InnoDB; 

CREATE TABLE mecanicos( 
    id_mecanico INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL, 
    apellido VARCHAR(50) NOT NULL, 
    especialidad VARCHAR(100) NOT NULL, 
    telefono VARCHAR(15) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    estado VARCHAR(20) NOT NULL 
)ENGINE=InnoDB; 

CREATE TABLE servicios( 
    id_servicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre_servicio VARCHAR(100) NOT NULL, 
    categoria VARCHAR(50) NOT NULL, 
    duracion_min INT NOT NULL, 
    descripcion VARCHAR(255) NOT NULL, 
    precio_base DECIMAL(10, 2) NOT NULL 
)ENGINE=InnoDB; 

CREATE TABLE citas_servicio( 
    id_cita INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    id_vehiculo INT NOT NULL, 
    id_mecanico INT NOT NULL, 
    id_servicio INT NOT NULL, 
    fecha_cita DATETIME NOT NULL, 
    estado_cita VARCHAR(20) NOT NULL DEFAULT 'pendiente', 
    precio_final DECIMAL(10, 2) NOT NULL,
    notas VARCHAR(255) DEFAULT NULL, 

    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo), 
    FOREIGN KEY (id_mecanico) REFERENCES mecanicos(id_mecanico), 
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio) 
)ENGINE=InnoDB; 