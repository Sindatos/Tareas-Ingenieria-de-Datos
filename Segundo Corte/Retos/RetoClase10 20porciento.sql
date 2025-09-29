CREATE DATABASE BASeReto;
USE BASeReto;

-- Primero departamentos
CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,
    departamento VARCHAR(50)
);

INSERT INTO departamentos (id_departamento, departamento) VALUES 
(1, 'Recursos Humanos'),
(2, 'VentAS'),
(3, 'VentAS'),
(4, 'IT'),
(5, 'Recursos Humanos');

-- Ahora empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    gender VARCHAR(50),
    salario INT,
    ano_contratacion INT,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

INSERT INTO empleados (id, nombre, apellido, fecha_nacimiento, gender, salario, ano_contratacion, id_departamento) VALUES
(1, 'Orin', 'PASsman', '1998-08-13', 'Male', 5271, 2010, 1),
(2, 'Edee', 'Poxton', '2003-12-28', 'Female', 1934, 2023, 2),
(3, 'Daven', 'Eccleston', '1975-04-16', 'Male', 1733, 2022, 3),
(4, 'Otis', 'Hollindale', '2000-09-05', 'Male', 4022, 2020, 4),
(5, 'Jamal', 'Bartolomucci', '1993-07-09', 'Male', 1488, 2010, 5);
/*Subconsulta y consultAS multitabla
se ejecuta la subconsulta y luego la consulta principal
escalares devuelven un solo valor
de fila devuelven un registro(fila)
de tabla varios registros(variAS filAS)
*/

/*SELECT 
    nombre,
    apellido,
    fecha_nacimiento,
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM empleados;
*/

#Primer Punto
SELECT id, nombre, apellido, salario FROM empleados;

#Segundo Punto
# SELECT * FROM empleados WHERE salario>4000;
SELECT id, nombre, apellido, salario FROM empleados WHERE salario>4000;

#Tercer Punto
SELECT id, nombre, apellido, departamento
FROM empleados
WHERE departamento IN ('VentAS');

#Cuarto Punto
SELECT 
    nombre,
    apellido,
    fecha_nacimiento,
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad 
FROM empleados
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) between 30 and 40;
#Quinto Punto
SELECT id, nombre, apellido, ano_contratacion FROM empleados WHERE ano_contratacion>2020;

#Sexto Punto
SELECT departamento, COUNT(id_departamento) AS por_departamento
FROM departamentos
GROUP BY departamento;


#Septimo Punto
SELECT avg(salario) AS "promedio" FROM empleados;

#Octavo Punto
SELECT * FROM empleados WHERE nombre like 'A%'or nombre like 'C%';

#Noveno Punto
SELECT id, nombre, apellido, departamento
FROM empleados
JOIN departamentos ON empleados.id_departamento = departamentos.id_departamento
WHERE departamento != 'IT';

#Decimo Punto
SELECT nombre, apellido, salario
FROM empleados
WHERE salario = (SELECT MAX(salario) FROM empleados);

#Punto Quiz
SELECT *
FROM empleados 
WHERE id_departamento IN (SELECT id_departamento FROM departamentos WHERE departamento = 'VentAS');

/* consultas multitabla
inner join
left join
right join
full outer join union jpin
*/

#consultar los empleados cuyo salario sea mayor al salario promedio de la empresa
SELECT nombre,apellido,salario,fecha_nacimiento FROM empleados 
WHERE salario > (SELECT AVG(salario) FROM empleados);

#Encuentre el nombre del empleado con el segundo salario mas alto
SELECT nombre, apellido, salario from empleados where (
select max(salario) from empleados WHERE salario < (SELECT MAX(salario) FROM empleados ));

#utilizando left join muestre los departamentos que no tienen empleados asignados
SELECT d.id_departamento, d.departamento
FROM departamentos d
LEFT JOIN empleados e ON d.id_departamento = e.id_departamento
WHERE e.id IS NULL;

#muestre el total de empleados por cada departamento
SELECT e.nombre AS empleado, d.departamento AS departamento
FROM empleados e               #FK V
INNER JOIN departamentos d ON e.id_departamento = d.id_departamento;