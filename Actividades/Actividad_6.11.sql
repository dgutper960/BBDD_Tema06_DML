-- Actividad 6.11
-- Tema 6 - DML
-- Curso 1 DAW
-- Autor David Gutiérrez Pérez
-- Fecha 21/02/23

use empresa;

# Obtener el número de empleados que hay en cada departamento.
# Mostrar las columnas: id, Departamento y el alias NumEmpleados.

SELECT 
    departamentos.id,
    departamentos.nombre departamento,
    COUNT(*) NumEmpeados
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY empleados.departamento_id;

# Obtener el número de empleados que hay en cada departamento cuyo sueldo esté por encima de los 30000 anuales.
# Mismas columnas que el ejercicio anterior.
SELECT 
    departamentos.id,
    departamentos.nombre departamento,
    COUNT(*) NumEmpeados
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
WHERE
    salario > 30000
GROUP BY empleados.departamento_id;

# Obtener el número total de empleados que hay en cada departamento
# cuyo salario esté comprendido entre 20000 y 50000.
# Mismas columnas que el ejercicio anterior.

SELECT 
    departamentos.id,
    departamentos.nombre departamento,
    COUNT(*) NumEmpeados
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
WHERE
    salario between 20000 and 50000
GROUP BY empleados.departamento_id;

# Obtener el número de empleados que nacieron en cada año.
# Mostrar las columnas con el alias Año y Nempleados.
select 
empleados.nombre,
count(*) Nempleados 



/*
Sobre la tabla Empleados_proyectos, obtener la suma total de horas trabajadas en cada proyecto. Mostrar id, Proyecto y HorasAcumuladas. 
Obtener el número de empleados que tiene a su cargo cada supervisor. Mostrar id, Apellidos, Nombre, y el alias numDependientes
Obtener para cada departamento la siguiente información estadística:
a. Número de Departamento
b. Nombre del Departamento
c. Jefe del Departamento
d. Numero de Empleados
e. Salario Medio f. Salario Máximo
g. Salario Mínimo
h. Suma Salarios
Obtener la siguiente información:
a. id, NSS de la tabla empleados
b. Nombre del empleado
c. Número total de beneficiarios
Mostrar el número de beneficiarios de cada departamento (intervienen las tablas Empleados, Departamento y Dependientes). Mostrará la siguiente
información.
a. id de Departamento 
b. Nombre del Departamento
c. Función de Agregación. Número de Beneficiarios
Obtener el número de horas acumuladas en cada proyecto, mostrando la siguiente información:
a. Id de Proyecto
b. nombre de Proyecto
c. Nombre de Departamento
d. Función Agregación SUM a partir de empleados_proyecto
Mostrar el número de horas acumuladas por cada trabajador:
a. empleado_id de empleado_proyecto
b. Función de Agregación correspondiente
Mostrar el número de horas acumuladas por cada trabajador en cada proyecto. Mostrar a. id de empleado_proyecto
b. IdProyecto de trabaja_en
c. Función de agregación correspondiente
Mostrar el número de horas acumuladas por cada trabajador en cada proyecto pero mostrando:
a. empleado_id de empleado_proyecto
b. Nombre de Empleado
c. Apellidos de Empleado
d. proyecto_id de empleado_proyecto
e. Función de agregación correspondiente .
Misma consulta anterior pero mostrando la columna Descripción del Proyecto
Obtener el sueldo medio de los empleados del departamento  3. Realizar este ejercicio sin cláusula WHERE. 
Obtener el mismo ejercicio anterior pero usando la cláusula HAVING con GROUP BY
Obtener el sueldo medio, sueldo máximo y sueldo mínimo de los empleados del departamento 1 y 2. Mostrar las columnas id del departamento y las correspondientes funciones de agregación.
Mostrar el id de departamento en los que el número total de horas trabajadas sea superior o igual a 50.
Obtener aquellos departamentos en los que el salario medio de sus empleados sea superior a 40000. Mostrar número de departamento y salario medio. 
Obtener el salario medio por año de nacimiento, pero mostrar sólo aquellos en los que el salario medio sea superior a 45000. Columnas Año, Salario Medio y Número de Empleados. 
Número de beneficiarios por sexo.