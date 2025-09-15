/*dasdada
dadada
dadad
*/
CREATE DATABASE BaseDatosMascota;
USE BaseDatosMascota;
-- Tabla Cliente
CREATE TABLE cliente (
    cedula VARCHAR(20) PRIMARY KEY,
    primer_nombre VARCHAR(50),
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50),
    segundo_apellido VARCHAR(50),
    direccion VARCHAR(200)
);

-- Tabla Telefono
CREATE TABLE telefono (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(15),
    tipo_telefono VARCHAR(20),
    cedula_cliente VARCHAR(15)
);

-- Tabla Mascota
CREATE TABLE mascota (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    genero CHAR(1),
    raza VARCHAR(50),
    cedula_cliente VARCHAR(15)
);

-- Tabla Vacuna
CREATE TABLE vacuna (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    dosis VARCHAR(50),
    enfermedad_que_trata VARCHAR(150)
);

-- Tabla VacunaMascota
CREATE TABLE vacunamascota (
    id_vacuna_mascota INT AUTO_INCREMENT PRIMARY KEY,
    codigo_vacuna VARCHAR(10),
    codigo_mascota VARCHAR(10),
    fecha_aplicacion DATE,
    observaciones TEXT
);

-- Tabla Producto
CREATE TABLE producto (
    codigo_barras VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    marca VARCHAR(50),
    precio DECIMAL(10,2)
);

-- Tabla Venta
CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE,
    total DECIMAL(10,2),
    cedula_cliente VARCHAR(15)
);

-- Tabla DetalleVenta
CREATE TABLE detalleventa (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    codigo_producto VARCHAR(20),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2)
);