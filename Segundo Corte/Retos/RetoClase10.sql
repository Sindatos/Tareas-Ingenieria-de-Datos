CREATE DATABASE BaseReto;
USE BaseReto;

create table empleados (
	id INT,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	edad INT,
	gender VARCHAR(50),
	salario INT,
	departamento VARCHAR(16),
	ano_contratacion INT
);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (1, 'Orin', 'Passman', 28, 'Male', 5271, 'Recursos Humanos', 2010);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (2, 'Edee', 'Poxton', 37, 'Female', 1934, 'Recursos Humanos', 2023);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (3, 'Daven', 'Eccleston', 36, 'Male', 1733, 'Finanzas', 2022);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (4, 'Otis', 'Hollindale', 58, 'Male', 4022, 'Ventas', 2020);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (5, 'Jamal', 'Bartolomucci', 28, 'Male', 1488, 'Marketing', 2010);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (6, 'Codie', 'Sambeck', 55, 'Female', 6721, 'IT', 2019);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (7, 'Sonia', 'Pittham', 47, 'Female', 3981, 'Recursos Humanos', 2019);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (8, 'Willem', 'Carren', 50, 'Male', 3261, 'Marketing', 2020);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (9, 'Brynne', 'Westwood', 24, 'Female', 5912, 'Tecnología', 2024);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (10, 'Barri', 'Perham', 49, 'Male', 6631, 'Recursos Humanos', 2024);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (11, 'Freeman', 'Dunstall', 41, 'Male', 5001, 'Ventas', 2012);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (12, 'Glori', 'Darnody', 29, 'Female', 6213, 'Ventas', 2016);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (13, 'Lynea', 'Beedham', 51, 'Female', 3726, 'Finanzas', 2012);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (14, 'Genvieve', 'Fratczak', 57, 'Female', 6092, 'Finanzas', 2012);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (15, 'Rozella', 'Thirsk', 41, 'Female', 2018, 'Ventas', 2018);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (16, 'Irma', 'Abells', 50, 'Female', 3463, 'Tecnología', 2010);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (17, 'Selma', 'Macon', 19, 'Female', 3688, 'Finanzas', 2021);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (18, 'Suzi', 'Mackinder', 25, 'Female', 4207, 'Ventas', 2015);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (19, 'Lilah', 'Shallcrass', 25, 'Female', 3175, 'Marketing', 2014);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (20, 'Jethro', 'Gasquoine', 19, 'Male', 1153, 'IT', 2015);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (21, 'Lyndsay', 'Kynd', 59, 'Female', 2266, 'Recursos Humanos', 2020);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (22, 'Carleton', 'Whyte', 52, 'Male', 5653, 'Marketing', 2022);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (23, 'Lisle', 'Camamile', 24, 'Male', 2012, 'Finanzas', 2013);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (24, 'Tiffy', 'Haville', 25, 'Female', 2839, 'Finanzas', 2015);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (25, 'Bernie', 'Kneel', 26, 'Female', 3655, 'IT', 2016);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (26, 'Ileana', 'Jenicke', 56, 'Female', 5862, 'Finanzas', 2022);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (27, 'Teddie', 'Medway', 58, 'Male', 5040, 'IT', 2010);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (28, 'Aubrey', 'Callister', 39, 'Male', 3371, 'Recursos Humanos', 2013);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (29, 'Florie', 'Biddulph', 55, 'Female', 6710, 'Finanzas', 2012);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (30, 'Winna', 'Karlsen', 46, 'Female', 2578, 'Marketing', 2016);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (31, 'Meriel', 'Fanthome', 50, 'Female', 3109, 'Finanzas', 2014);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (32, 'Gibby', 'Battson', 48, 'Male', 2954, 'Ventas', 2018);
insert into empleados (id, nombre, apellido, edad, gender, salario, departamento, ano_contratacion) values (33, 'Carmen', 'Ayrs', 45, 'Female', 6468, 'Finanzas', 2012);

#Primer Punto
select id, nombre, apellido, edad, salario from empleados;

#Segundo Punto
# select * from empleados where salario>4000;
select id, nombre, apellido, salario from empleados where salario>4000;

#Tercer Punto
select id, nombre, apellido, departamento
FROM empleados
WHERE departamento IN ('Ventas');

#Cuarto Punto
select id, nombre, apellido, edad from empleados where edad between 30 and 40;

#Quinto Punto
select id, nombre, apellido, ano_contratacion from empleados where ano_contratacion>2020;

#Sexto Punto
select departamento, count(*) as "por departamento" from empleados group by departamento;

#Septimo Punto
select avg(salario) as "promedio" from empleados;

