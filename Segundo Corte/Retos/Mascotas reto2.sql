CREATE DATABASE BaseDatosMascota;
USE BaseDatosMascota;

-- Tabla Usuario
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    clave VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);

-- Tabla Cliente
CREATE TABLE cliente (
    cedula VARCHAR(20) PRIMARY KEY,
    primer_nombre VARCHAR(20),
    segundo_nombre VARCHAR(20),
    primer_apellido VARCHAR(20),
    segundo_apellido VARCHAR(20),
    direccion VARCHAR(200),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabla Telefono
CREATE TABLE telefono (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20),
    tipo_telefono VARCHAR(20),
    cedula_cliente VARCHAR(20),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);

-- Tabla Mascota
CREATE TABLE mascota (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(20),
    genero CHAR(1),
    raza VARCHAR(20),
    cedula_cliente VARCHAR(20),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);

-- Tabla Vacuna
CREATE TABLE vacuna (
    codigo VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    dosis VARCHAR(20),
    enfermedad_que_trata VARCHAR(150)
);

-- Tabla VacunaMascota (relación N:N entre vacuna y mascota)
CREATE TABLE vacunamascota (
    id_vacuna_mascota INT AUTO_INCREMENT PRIMARY KEY,
    codigo_vacuna VARCHAR(20),
    codigo_mascota VARCHAR(10),
    fecha_aplicacion DATE,
    observaciones TEXT,
    FOREIGN KEY (codigo_vacuna) REFERENCES vacuna(codigo),
    FOREIGN KEY (codigo_mascota) REFERENCES mascota(codigo)
);

-- Tabla Producto
CREATE TABLE producto (
    codigo_barras VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    marca VARCHAR(20),
    precio FLOAT(20)
);

-- Tabla Venta
CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE,
    total FLOAT(20),
    cedula_cliente VARCHAR(20),
    FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula)
);

-- Tabla DetalleVenta (relación N:1 con venta y producto)
CREATE TABLE detalleventa (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    codigo_producto VARCHAR(20),
    cantidad INT,
    precio_unitario FLOAT(20),
    subtotal FLOAT(20),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_barras)
);
INSERT INTO usuario (nombre_usuario, clave, rol) VALUES 
("admin1", "cla11ve123", "admin"),
("user1", "clav221e456", "cliente"),
("user2", "clav4321e789", "cliente"),
("vet1", "clave1211", "veterinario"),
("cashier1", "c43242lave222", "cajero");

-- Insertar en cliente
INSERT INTO cliente VALUES 
("111", "Ana", "Maria", "Lopez", "Perez", "Calle 1", 1),
("112", "Juan", "Carlos", "Martinez", "Diaz", "Calle 2", 2),
("113", "Pedro", "Jose", "Gomez", "Ruiz", "Calle 3", 3),
("114", "Laura", "Camila", "Torres", "Mora", "Calle 4", 4),
("115", "Sofia", "Isabel", "Ramos", "Cruz", "Calle 5", 5);

select * from usuario;
select * from cliente;
# insert into (nombreTable) (campos) values (valor1, valor2, valor3) 
# insert into (nombreTable) values values (valor1, valor2, valor3)