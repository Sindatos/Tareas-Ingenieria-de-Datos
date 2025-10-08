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
    cedula_cliente VARCHAR(20), #FK
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
("114", "Juan", "Camila", "Torres", "Mora", "Calle 4", 4),
("115", "Sofia", "Isabel", "Ramos", "Cruz", "Calle 5", 5);

INSERT INTO telefono (numero, tipo_telefono, cedula_cliente) VALUES
("3001111111", "movil", "111"),
("3002222222", "movil", "112"),
("6013333333", "fijo", "113"),
("3004444444", "movil", "114"),
("6015555555", "fijo", "115");

-- Insertar en mascota
INSERT INTO mascota VALUES
("M1", "Firulais", "Perro", "M", "Labrador", "111"),
("M2", "Firulais", "Gato", "F", "Persa", "112"),
("M3", "Rocky", "Perro", "M", "Bulldog", "113"),
("M4", "Luna", "Gato", "F", "Siames", "114"),
("M5", "Toby", "Perro", "M", "Golden", "115");

-- Insertar en vacuna
INSERT INTO vacuna VALUES
("V1", "Antirrábica", "1 dosis", "Rabia"),
("V2", "Parvovirus", "2 dosis", "Parvovirus"),
("V3", "Moquillo", "1 dosis", "Moquillo canino"),
("V4", "Triple felina", "1 dosis", "Leucemia felina"),
("V5", "Hepatitis", "1 dosis", "Hepatitis canina");

-- Insertar en vacunamascota
INSERT INTO vacunamascota (codigo_vacuna, codigo_mascota, fecha_aplicacion, observaciones) VALUES
("V1", "M1", "2025-01-10", "Aplicada sin reacción"),
("V2", "M2", "2025-01-11", "Mascota tranquila"),
("V3", "M3", "2025-01-12", "Dosis única"),
("V4", "M4", "2025-01-13", "Revisión en 1 mes"),
("V5", "M5", "2025-01-14", "Sin observaciones");

-- Insertar en producto
INSERT INTO producto VALUES
("P1", "Concentrado perro", "DogChow", 120000),
("P2", "Concentrado gato", "Whiskas", 80000),
("P3", "Juguete perro", "Kong", 45000),
("P4", "Arena gato", "CatBest", 60000),
("P5", "Shampoo perro", "PetClean", 25000);

-- Insertar en venta
INSERT INTO venta (fecha_venta, total, cedula_cliente) VALUES
("2025-02-01", 120000, "111"),
("2025-02-02", 80000, "112"),
("2025-02-03", 45000, "113"),
("2025-02-04", 60000, "114"),
("2025-02-05", 25000, "115");

select total from venta;
-- Insertar en detalleventa
INSERT INTO detalleventa (id_venta, codigo_producto, cantidad, precio_unitario, subtotal) VALUES
(1, "P1", 1, 120000, 120000),
(2, "P2", 1, 80000, 80000),
(3, "P3", 1, 45000, 45000),
(4, "P4", 1, 60000, 60000),
(5, "P5", 1, 25000, 25000);

# insert into (nombreTable) (campos) values (valor1, valor2, valor3) 
# insert into (nombreTable) values values (valor1, valor2, valor3)
# Basicas:
# select *(todos los campos) from nombretabla;
# select idEmpleado from empleado;
# Especificas: ordenar agrupar condicionar parametros
# Avanzadas: Multitabla, Subconsultas

select * from vacuna where dosis = "1 dosis";
select * from vacuna where dosis != "1 dosis";

select * from detalleventa where subtotal>30000;

#between and
select * from producto where precio between 40000 and 80000;

# patron like patrones de texto campos de varchar char texto comodines se representa cero uno o muchos caracteres
# -> representa un solo caracter
#empiecen por cierto caracter like %xxxxx
#terminen por cierto caracter like xxxxx%
#contengan ciertos caracteres like %xxxx%
#not like
#un caracter like x-X ;

select * from producto where nombre like '%perro';

#in


#and or not select * from nombreTabla where valor=valorcomparacion and valor=valorcomparacion
/*
select * from estudiantes where semestre=5 and carrera="Veterinaria";
select * from estudiantes where semestre=5 or carrera = "Veterinaria";
select * from estudiantes where not semestre=6;
*/

#ordenar  asc desc select campo1 campo2 form nombretabla order by campoOrdenaras asc/desc

select * from mascota order by nombre asc;

#agrupar normalmente se acompana de funciones calculadas o de agregacion
#count contar, sum sumar, avg promedio, max maximo, min minimo,

# select * from funcionagregacion() from tabla, group by campo;

#Funciones Agregadas 

/* Count()-> contar registros(filas)
sum()-> sumar valores numericos
avg() -> calcular promedios
min() -> obtiene el valor minimo
max() -> obtiene el valor maximo

siempre van a devolver un univo valor agrupado
*/
#select departamento, count(*) as "por departamento" from empleados group by departamento;

# max y min select max(campo) as NombreAlias from tabla

select max(precio) as "precio maximo" from producto;
select min(precio) as "precio minimo" from producto;

#sum select(campo) as referencia from tabla  

select avg(precio) as "promedio" from producto;

#select campo1, avg(campo) as "nombrealias" from tabla group by campoagrupar having avg(campo)>xx;

#where antes de agrupar
#having despues de agrupar
#modificaciones Update

#select * from cliente;
#update cliente set primer_nombre="Juan" where id_usuario = 3 or id_usuario = 1 or id_usuario = 2 or id_usuario = 4 or id_usuario = 5;
#select * from cliente;
#UPDATE cliente 
#SET primer_nombre= "Juan", segundo_nombre = "Andres", primer_apellido = "Obando", segundo_apellido = "Sata", direccion = "Cra44" WHERE id_usuario = 1;


#cliente asociada con mascota
create view vistadueno as select cliente.primer_nombre as "nombre cliente",
mascota.nombre as "Mascota asociada" from cliente join mascota on cliente.cedula = mascota.cedula_cliente;
select * from vistadueno;


/* sintaxis
delimiter $$ 
create procedure nombreprocedimiento(parametros)
begin
--sentencias logica 
end $$
delimiter;
INVOCAR PROCEDIMIENTO
CALL nombreProcedimiento(argumentos)

*/ 


DELIMITER $$

CREATE PROCEDURE VacunasPorMascota(IN codigoMascota VARCHAR(10))
BEGIN
    SELECT m.codigo AS "Código Mascota", m.nombre AS "Nombre Mascota", v.codigo AS "Código Vacuna", v.nombre AS "Nombre Vacuna",  vacunamascota.fecha_aplicacion AS "Fecha de Aplicación"
    FROM mascota m
    INNER JOIN vacunamascota ON m.codigo = vacunamascota.codigo_mascota
    INNER JOIN vacuna v ON vacunamascota.codigo_vacuna = v.codigo
    WHERE m.codigo = codigoMascota;
END $$

DELIMITER ;

CALL VacunasPorMascota("M1")

DELIMITER $$

CREATE PROCEDURE ConsultarRegistrarMascotaPorCliente(
    IN codigo_mascota VARCHAR(10),
    IN nombre VARCHAR(100),
    IN tipo VARCHAR(20),
    IN genero CHAR(1),
    IN raza VARCHAR(20),
    IN cedula_cliente VARCHAR(20)
)
BEGIN
    DECLARE cliente_existe VARCHAR(20);
    DECLARE mascota_existe VARCHAR(10);

    SELECT cedula INTO cliente_existe
    FROM cliente
    WHERE cedula = cedula_cliente
    LIMIT 1;

    SELECT codigo INTO mascota_existe
    FROM mascota
    WHERE codigo = codigo_mascota
    LIMIT 1;

    IF cliente_existe IS NULL THEN
        SELECT 'No se puede registrar ' AS mensaje;

    ELSEIF mascota_existe IS NOT NULL THEN
        SELECT 'La mascota ya existe' AS mensaje;

    ELSE
        INSERT INTO mascota (codigo, nombre, tipo, genero, raza, cedula_cliente)
        VALUES (codigo_mascota, nombre, tipo, genero, raza, cedula_cliente);

        SELECT 'Mascota registrada' AS mensaje;
    END IF;
END $$

DELIMITER ;

/* Funciones UDF


*/