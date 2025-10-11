create database basequiz;
use basequiz;

create table usuario (
    id_usuario int auto_increment primary key,
    nombre_usuario varchar(50) not null,
    clave varchar(100) not null,
    rol varchar(20) not null
);

create table cliente (
    cedula varchar(20) primary key,
    primer_nombre varchar(20),
    segundo_nombre varchar(20),
    primer_apellido varchar(20),
    segundo_apellido varchar(20),
    direccion varchar(200),
	fecha_actualizacion timestamp default current_timestamp,
    id_usuario int,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table mascota (
    codigo varchar(10) primary key,
    nombre varchar(100),
    tipo varchar(20),
    genero char(1),
    raza varchar(20),
    cedula_cliente varchar(20),
    foreign key (cedula_cliente) references cliente(cedula)
);

create table vacuna (
	codigo varchar(50),
	nombre varchar(17),
	dosis int,
	enfermedad_que_trata varchar(9),
	fecha_vigencia date
);

# tabla para el trigger
create table auditoria (
    id_auditoria int auto_increment primary key,
    tabla_afectada varchar(50),
    accion varchar(20),
    descripcion varchar(255),
    fecha timestamp default current_timestamp
);

insert into vacuna (codigo, nombre, dosis, enfermedad_que_trata, fecha_vigencia) values 
('IAA-21-KX', 'Pfizer', 2, 'Sarampión', '2026-05-15'),
('FKN-33-QD', 'Sinovac', 1, 'Hepatitis', '2024-10-01'),
('AIK-31-ZC', 'Sinovac', 3, 'Varicela', '2023-06-10'),
('VBS-21-TN', 'Sinopharm', 3, 'COVID-19', '2027-03-20'),
('IRB-84-BC', 'Pfizer', 2, 'Hepatitis', '2023-06-10'),
('WRX-08-OQ', 'Pfizer', 4, 'Hepatitis', '2030-11-30');

insert into usuario (nombre_usuario, clave, rol) values
('admin01', 'clave123', 'administrador'),
('cliente01', 'pass123', 'cliente'),
('cliente02', 'claveabc', 'cliente'),
('cliente03', 'userpass', 'cliente');

insert into cliente (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion, id_usuario) values
('1001', 'Jaime', 'Antonio', 'Pérez', 'Lopez', 'Calle 10 #5-20', 2),
('1002', 'Tomas', 'Andres', 'Gómez', 'Ríos', 'Carrera 8 #12-45', 3),
('1003', 'Juan', 'Felipe', 'Ramírez', 'Torres', 'Av. Central 33-11', 4);

insert into mascota (codigo, nombre, tipo, genero, raza, cedula_cliente) values
('MSC-01', 'Firulais', 'Perro', 'M', 'Labrador', '1001'),
('MSC-02', 'Michi', 'Gato', 'F', 'Persa', '1002'),
('MSC-03', 'Rocky', 'Perro', 'M', 'Bulldog', '1003'),
('MSC-04', 'Luna', 'Gato', 'F', 'Siamés', '1001');

delimiter $$

create function clasificacionvigencia(fecha_vigencia date)
returns varchar(20)
deterministic
begin
    declare estado varchar(20);
    if fecha_vigencia >= curdate() then
        set estado = 'Vigente';
    else
        set estado = 'Vencida';
    end if;
    return estado;
end $$

delimiter ;
select codigo, nombre, fecha_vigencia,
    clasificacionvigencia(fecha_vigencia) as estado_vacuna
from vacuna;

delimiter $$

create function informacionmascotadueno(cod_mascota varchar(10))
returns varchar(150)
deterministic
begin
    declare info varchar(150);
    declare nom_mascota varchar(100);
    declare raza_mascota varchar(20);
    declare propietario varchar(50);
    select m.nombre, m.raza, concat(c.primer_nombre, ' ', c.primer_apellido)
    into nom_mascota, raza_mascota, propietario
    from mascota m
    inner join cliente c on m.cedula_cliente = c.cedula
    where m.codigo = cod_mascota;
    set info = concat(nom_mascota, ' (', raza_mascota, ') - Propietario: ', propietario);
    return info;
end $$

delimiter ;

select codigo, informacionmascotadueno(codigo) as informacion
from mascota;

delimiter $$

create trigger auditoria_mascota after insert on mascota
for each row begin
insert into auditoria (tabla_afectada, accion, descripcion)
values ('mascota','insert', concat('Se registró la mascota ',new.nombre,' (',new.raza,') del cliente con cédula ',new.cedula_cliente));
end $$

delimiter ;

# ejemplo trigger
insert into mascota (codigo, nombre, tipo, genero, raza, cedula_cliente)
values ('MSC-05', 'Toby', 'Perro', 'M', 'Beagle', '1002');

select * from auditoria;

delimiter $$

create trigger no_eliminar_cliente_con_mascotas
before delete on cliente
for each row
begin
    if exists (select 1 from mascota where cedula_cliente = old.cedula) then
        signal sqlstate '45000'
        set message_text = 'No se puede eliminar el cliente porque tiene mascotas registradas';
    end if;
end $$

delimiter ;

create table clientes_eliminados (
    cedula varchar(20),
    nombre_completo varchar(100),
    direccion varchar(200),
    fecha_eliminacion timestamp default current_timestamp
);

delimiter $$

create trigger registrar_cliente_eliminado
after delete on cliente
for each row
begin
    insert into clientes_eliminados (cedula, nombre_completo, direccion)
    values (old.cedula, concat(old.primer_nombre,' ',old.primer_apellido), old.direccion);
end $$

delimiter ;

delimiter $$

create trigger actualizar_fecha_cliente
before update on cliente
for each row
begin
    set new.fecha_actualizacion = current_timestamp;
end $$

delimiter ;


#PRUEBAS PARA TRIGGER

delete from cliente where cedula = '1001';
delete from mascota where cedula_cliente = '1003';
delete from cliente where cedula = '1003';
select * from clientes_eliminados;

select cedula, primer_nombre, fecha_actualizacion from cliente where cedula='1002';

update cliente set direccion='Carrera 9 #15-33' where cedula='1002';

select cedula, primer_nombre, fecha_actualizacion from cliente where cedula='1002';
