-- Actividad_6.6
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David gutiérrez Pérez
-- Fecha 09/02/23

# Usaremos la base de datos empresa.sql
USE Empresa;

# 1. ORDER BY, LIMIT, ALL, DISTINCT
# Obtener los 3 empleados con mayor salario
SELECT * FROM Empleados ORDER BY salario DESC LIMIT 3;

# Obtener los 5 empleados con menor salario
SELECT * FROM Empleados ORDER BY salario LIMIT 5;

# Obtener los empleados ordenados alfabéticamente
SELECT * FROM Empleados ORDER BY nombre;

# Obtener los 3 primeros departamentos
SELECT * FROM Departamentos LIMIT 3;

# Obtener los 3 empleados con mayores salarios del departamento 3
SELECT * FROM Empleados WHERE departamento_id=3 ORDER BY salario DESC;

# 2. Función COUNT()
# Obtener el número total de departamentos
SELECT COUNT(*) AS num_departamentos FROM Departamentos;

# Obtener el número total de beneficiarios de sexo ‘M’ mujer
SELECT COUNT(*) AS num_beneficiarios_mujeres FROM Beneficiarios WHERE genero='M';

# Obtener el número total de empleados cuyo salario esté comprendido entre 20000 y 50000.
SELECT COUNT(*) AS num_total FROM Empleados WHERE salario BETWEEN 20000 AND 50000;

# Obtener el número total de empleados nacidos después del 1970, no inclusive.
SELECT COUNT(*) AS num_total FROM Empleados WHERE YEAR(fecha_nac)>1970;

# Obtener el número total de proyectos asignados al departamento 3.
SELECT COUNT(*) AS num_total FROM Proyectos WHERE departamento_id=3;

# Obtener le número de departamentos que están realizando un proyecto.
SELECT COUNT(*) AS num_departamentos FROM Proyectos WHERE departamento_id IN (SELECT DISTINCT COUNT(departamento_id)  FROM Proyectos);

# Obtener el número de empleados que están trabajando en algún proyecto.
SELECT COUNT(*) AS num_empleados_proyecto FROM Empleados WHERE departamento_id IN (1,2,3,4,5);

# 3. Función SUM()
# Obtener el total de horas trabajadas en los distintos proyectos.
SELECT SUM(horas) AS horas_totales FROM empleados_proyectos;

# Obtener el total de horas trabajadas en el proyecto 2.
SELECT SUM(horas) AS horas_totales FROM empleados_proyectos WHERE proyecto_id=2;

# Obtener la suma total de los salarios de los empleados.
SELECT SUM(salario) AS suma_total FROM empleados;

# Obtener la suma total de los salarios de los empleados del departamento 5
SELECT SUM(salario) AS suma_total FROM empleados WHERE departamento_id=5;

# Obtener la suma total de los salarios de los empleados cuyo número de supervisor es 3
SELECT SUM(salario) AS suma_total FROM empleados WHERE supervisor_id=3;

# Obtener el número de empleados y la suma total de sus salarios del departamento 4
SELECT COUNT(salario) AS num_empleados, SUM(salario) AS suma_total FROM empleados WHERE departamento_id=4;


# 4. Función AVG()
# Obtener la media total de horas trabajadas en los proyectos
SELECT AVG(horas) AS media_total FROM empleados_proyectos;

# Obtener número total de jornadas trabajadas, suma total y media de horas trabajadas en los proyectos.


# Obtener número de empleados, suma total de sus salarios, media de sus salarios de los empleados del departamento 3.
SELECT COUNT(id) AS num_empleados, SUM(salario) AS total_salarios, AVG(salario) AS salario_medio FROM Empleados WHERE departamento_id=3;

# Obtener el salario medio de todos los empleados.
SELECT AVG(salario) AS media_salario FROM Empleados;

# Obtener el número total de empleados, salario medio y suma total de salarios de los empleados.
SELECT COUNT(id) AS num_empleados, AVG(salario) AS salario_medio, SUM(salario) AS total_salarios FROM Empleados;

# Obtener el número de empleados y salario medio de los nacidos entre 1960 y 1980.


# Obtener aquellos empleados cuyo salario este por encima del salario medio.
select * from Empleados where salario > (SELECT AVG(salario) FROM Empleados);

# Obtener aquellos empleados cuyo salario esté por debajo del salario medio de los empleados del departamento 3.

# Obtener el NSS, Nombre, Apellido de los empleados que hayan trabajado en algún proyecto por encima de la media de horas trabajadas.
select nss, nombre, apelliods from empleados where id in(select distinct empleados avg )

# 5. Función MIN() y MAX()
# Obtener el salario maximo
SELECT MAX(salario) AS max_salario FROM Empleados;

# Obtener el salario mínimo
SELECT MIN(salario) AS min_salario FROM Empleados;

# Obtener máximo de horas trabajadas en un proyecto
SELECT MAX(horas) AS max_horas_trabajadas FROM empleados_proyectos;

# Obtener los datos de los empleados con el salario máximo
SELECT * FROM Empleados WHERE salario IN (SELECT MAX(salario) FROM Empleados);

# Obtener los datos del o de los empleados con el salario mínimo
SELECT * FROM Empleados WHERE salario IN (SELECT MIN(salario) FROM Empleados);

# Obtener el NSSE del empleado con máximo de horas trabajadas en un proyecto.
SELECT nss FROM Empleados WHERE id IN (SELECT empleado_id FROM empleados_proyectos);

# Obtener el NSS, Nombre, Apellido y Horas de los empleados que hayan trabajado en las horas máximas en un proyecto.
# Obtener el NSS de los empleados con horas mínimas trabajadas.
# Obtener el NSS, Nombre, Apellidos y Horas de los empleados que han trabajado en los proyectos en tiempo de horas mínimos.
