-- Actividad 6.09
-- Tema 6 - DML
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 14/02/23

use empresa;

# Realizar las siguientes consultas a partir de la base de datos empresa. Usar INNER JOIN para conectar las tablas relacionadas.

# 1. Empleados.
/*Realizar una consulta multitabla que muestre todos los empleados ordenados por id. 
Las columnas que deberá mostrar son:
De Empleados: id, Nombre, Apellidos, Salario, departamento_id
De Departamento: Nombre del Departamento */
SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.salario,
    empleados.departamento_id,
    departamentos.nombre departamento
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id;


# 2. Departamentos.
/*Realizar una consulta multitabla que muestre los detalles de cada departamento,
incluido el nombre del jefe de departamento.
Esa consulta se mostrará ordenada alfabéticamente por nombre del departamento.
Las columnas que mostrará serán:
Departamento: id, nombre, localizacion, componentes, jefe_departamento_id
Empleados: apellidos, nombre */
SELECT 
    departamentos.id,
    departamentos.nombre,
    departamentos.localizacion,
    departamentos.componentes,
    departamentos.jefe_departamento_id,
    CONCAT_WS(', ', -- > Concatena nombre y apellido de empleados
            empleados.apellidos,
            empleados.nombre) AS Jefe_departamento
FROM
    departamentos
        INNER JOIN
    empleados ON departamentos.jefe_departamento_id = empleados.id
ORDER BY departamentos.nombre;


# 3. Empleados con supervisor
/* Realizar una consulta multitabla que muestre los detalles de los empleados y 
el nombre del supervisor asignado. La consulta se mostrará ordenada por id de empleado. 
Las columnas que mostrará serán:
Empleados: id, nombre, apellidos, nss, salario
Empleados_supervisor: nombre, apellidos (del supervisor) */

SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.nss,
    empleados.salario,
    empleados.supervisor_id supervisores,
    concat_ws(', ', supervisores.apellidos, supervisores.nombre) Supervisor
FROM
    empleados inner join 
    empleados supervisores on emplados.supervisor_id = supervisores.id 
    order by empleados.supervisor_id = empleados.id; -- > Sale en blanco


# 4. Beneficiarios con Empleados

/* Realizar una consulta multitabla que muestre los detalles de los beneficiarios junto con el nombre del empleado al que pertenecen:

Beneficiarios: id, nombre, genero, parentesco, fecha_nac, empleado_id
Empleados: nombre, apellidos (empleado) */

SELECT 
    beneficiarios.id,
    beneficiarios.nombre,
    beneficiarios.genero,
    beneficiarios.parentesco,
    beneficiarios.fecha_nac,
    beneficiarios.empleado_id,
    empleados.nombre,
    empleados.apellidos
FROM
    beneficiarios
        INNER JOIN
    empleados ON beneficiarios.empleado_id = empleados.id;


# 5. Proyectos

/*Realizar una consulta multitabla que muestre los detalles de todos los proyectos junto con el nombre del departamento que lo está realizando:
Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
Departamento: nombre (departamento)*/

SELECT 
    *  -- > falta poner las tablas de busqueda
FROM
    proyectos
        INNER JOIN
    departamentos ON proyectos.departamento_id = departamentos.id;



# 6. Proyectos con Jefe de Departamento

/*Realizar una consulta multitabla que muestre los detalles de todos los proyectos junto con 
el nombre del departamento que lo está realizando y el nombre del jefe del departamento.
Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
Departamento: nombre (departamento)
Empleados: nombre, apellidos (jefe del departamento)
Nota: en este ejercicio conectamos Proyecto con Departamento y con Empleados. */

SELECT 
proyectos.id,
proyectos.descripcion,
proyectos.num_proyecto,
proyectos.localizacion,
proyectos.fecha_inicio,
proyectos.fecha_fin,
proyectos.departamento_id,
departamentos.nombre nombreDepartamento,
empleados.nombre nombreEmpleado,
empleados.apellidos -- > Falta concat() 
FROM
    proyectos
        INNER JOIN
    departamentos ON proyectos.departamento_id = departamentos.id
        INNER JOIN
    empleados ON departamentos.jefe_departamento_id = empleados.id;




# 7. Informe empleados_proyectos
/* Genera informe de horas trabajadas en cada proyecto a partir de la tabla empleados_proyectos,
en dicho informe se deberá mostrar ordenado alfabéticamente por empleados, y mostrará las siguientes columnas:
Empleados_proyectos: Empleado_id, proyecto_id, horas
Empleados: nombre, apellidos
Proyectos: descripcion */

SELECT 
    empleados_proyectos.empleado_id,
    empleados_proyectos.proyecto_id,
    empleados_proyectos.horas,
    empleados.nombre,
    empleados.apellidos,
    proyectos.descripcion
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id order by empleados.nombre;