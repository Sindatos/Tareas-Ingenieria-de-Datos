create database BD_TechNova;
use BD_TechNova;

#Ejercicio 15

CREATE TABLE Departamento (
id_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DECIMAL(12,2) CHECK (presupuesto > 0)
);

CREATE TABLE Empleado (
id_empleado INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
cargo VARCHAR(50),
salario DECIMAL(10,2) CHECK (salario > 0),
id_departamento INT,
fecha_ingreso DATE,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Proyecto (
id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
fecha_inicio DATE,
presupuesto DECIMAL(12,2),
id_departamento INT,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Asignacion (
id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
id_empleado INT,
id_proyecto INT,
horas_trabajadas INT CHECK (horas_trabajadas >= 0),
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

insert into Departamento (nombre, presupuesto) values 
('VENTAS', 20000000),
('IT', 40000000),
('RH', 60000000);

insert into Empleado ( nombre, cargo, salario, id_departamento, fecha_ingreso)values
('Martinez', 'ASESOR VENTAS', 2000000, 1, "2002-08-15"),
('Jimenez', 'DESARROLLADOR IT', 3500000, 2,"2000-01-03"),
('Octavio', 'GERENTE RH', 8500000,3, "2014-07-06"),
('Mesa', 'GERENTE VENTAS', 10000000,1, "2022-05-14"),
('Morales', 'JEFE IT', 6000000,2, "1990-07-15");

insert into Proyecto (nombre, fecha_inicio, presupuesto, id_departamento) values
('Proyecto 1', "2018-08-15", 2000000, 1),
('Proyecto 2', "2010-01-03", 39000000, 2),
('Proyecto 3', "2015-07-06", 8000000,3);

insert into Asignacion (id_empleado, id_proyecto, horas_trabajadas) values
(1, 1, 200),
(2, 2, 700),
(3, 3, 4000),
(4, 1, 30),
(5, 2, 2900);


#FUNCION UDF
delimiter $$

Create Function TotalHorasEmpresa() 
Returns INT DETERMINISTIC
BEGIN
  DECLARE suma INT;
  SELECT SUM(horas_trabajadas) INTO suma FROM Asignacion;
  RETURN suma;
END $$
Select TotalHorasEmpresa();


Delimiter $$
Create Procedure ActualizarPresupuestos()
Begin
    Update Departamento set Departamento.presupuesto = Departamento.presupuesto + Departamento.presupuesto*0.07;
End $$

Delimiter ;
call ActualizarPresupuestos();


DELIMITER $$

CREATE TRIGGER RegistrarCambiosPresupuestales
AFTER UPDATE ON Departamento
FOR EACH ROW
BEGIN
    Declare xmensaje Varchar(20);
    Set xmensaje = "Se ha registrado el cambio de 7% en todos los departamentos";
    Select presupuesto as NuevoPresupuestoActualizado from Departamento;
END $$

DELIMITER ;