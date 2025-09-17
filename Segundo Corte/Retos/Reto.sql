-- Crear base de datos y usarla
CREATE DATABASE ventasTienda;
USE ventasTienda;

-- Crear tabla usuario
CREATE TABLE usuario(
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(20)
);

-- Crear tabla cliente
CREATE TABLE cliente(
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    documentoCliente VARCHAR(50) NOT NULL,
    nombreCliente VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE, 
    telefono VARCHAR(50),
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    idUsuarioFK INT
);

-- Cambios con ALTER TABLE
ALTER TABLE cliente MODIFY telefono VARCHAR(15) NOT NULL;
ALTER TABLE cliente CHANGE email emailCliente VARCHAR(50) UNIQUE;

-- Agregar clave foránea cliente → usuario
ALTER TABLE cliente
ADD CONSTRAINT FKClienteUsuario
FOREIGN KEY (idUsuarioFK) REFERENCES usuario(idUsuario);

-- Crear tabla pedido (sin relación con detallePedido)
CREATE TABLE pedido(
    idPedido INT AUTO_INCREMENT PRIMARY KEY, 
    idClienteFK INT,
    fechaPedido DATE,
    total DECIMAL(10,2)
);

-- Agregar clave foránea pedido → cliente
ALTER TABLE pedido
ADD CONSTRAINT FKClientePedido
FOREIGN KEY (idClienteFK) REFERENCES cliente(idCliente);

-- Crear tabla producto
CREATE TABLE producto(
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    nombreProducto VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

-- Crear tabla detallePedido (solo con relación a producto)
CREATE TABLE detallePedido(
    idDetallePedido INT AUTO_INCREMENT PRIMARY KEY,
    idProductoFK INT,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL
);

-- Agregar clave foránea detallePedido → producto
ALTER TABLE detallePedido
ADD CONSTRAINT FKProductoDetalle
FOREIGN KEY (idProductoFK) REFERENCES producto(idProducto);
