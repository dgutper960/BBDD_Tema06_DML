-- Actividad 6.10
-- Tema 6 - DML
-- Curso 1 DAW
-- Autor David Gutiérrez Pérez
-- Fecha 20/02/23

use empresa;

/*Actividad 1.
Mostrar los detalles sobre empleados y departamentos.
Detalles:
empleados.id
empleados.nombre
empleados.apellidos
empleados.nss
edad (calculado mediante empleados.fecha_nac)
empleados.salario
departamentos.nombre
Ordenar por id de empleados. 
Este listado deberá mostrar también aquellos empleados que no tienen asignado ningún departamento.*/

SELECT 
    empleados.id,
    empleados.nombre,
    empleados.apellidos,
    empleados.nss,
    TIMESTAMPDIFF(YEAR, fecha_nac, NOW()) AS edad, -- > Operador timestampdiff() para calcular edad por fecha_nac
    empleados.salario,
    departamentos.nombre
FROM
    empleados
        left JOIN
    departamentos ON empleados.departamento_id = departamentos.id;

# Actividad 2.
/* Mostrar detalles a cerca de los departamentos.
Detalles:
departamentos.id
departamentos.nombre
departamentos.jefe_departamenento_id
(nombre del jefe departamento que se extrae de la tabla empleados)
empleados.id
empleados.nombre
empleados.apellidos
Ordenar por id de departamento. 
Deberá mostrar también aquellos departamentos que no tengan asignado ningún empleado. */
SELECT
departamentos.id,
departamentos.nombre,
departamentos.jefe_departamento_id,
CONCAT_WS(', ',
            empleados.apellidos,
            empleados.nombre) AS Jefe_departamento

FROM
    departamentos
        left JOIN
    empleados ON empleados.departamento_id = departamentos.id
    order by departamentos.id;

# Actividad 3.
/*Mostrar los detalles sobre los empleados que hayan trabajado en algún proyecto.
Los detalles que se mostrarán son.
empleados.id
empleados.nombre
empleados.apellidos
departamento.nombre
proyectos.nombre
empleados_proyectos.horas
Ordenar por horas trabajadas con criterio descendente. Usar alias en las columnas que lo precisen.
Mostrará también aquellos empleados que no hayan trabajado en ningún proyecto.*/

SELECT 

empleados.id,
empleados.nombre as nombreEmpleado,
empleados.apellidos,
departamentos.nombre as nombreDepartamento,
empleados_proyectos.horas,
proyectos.descripcion
    
FROM
    empleados_proyectos
        left JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
        right JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        left JOIN
    departamentos ON empleados.departamento_id = empleados.id
    order by empleados_proyectos.horas desc;
    
    
# Actividad 4. 

/*Mostrar los siguientes detalles sobre proyectos
Detalles:
        proyectos.id
        proyectos.nombre
        proyectos.num_proyecto
        proyectos.fecha_inicio
        departamentos.nombre
        empleados.nombre
        empleados.apellidos
        empleados_proyectos.horas
Ordenar por horas trabajadas con criterio descendente. Mostrar también aquellos proyectos que no tienen ninguna hora trabajada*/

SELECT 
    proyectos.id,
    proyectos.descripcion,
    proyectos.num_proyecto,
    proyectos.fecha_inicio,
    departamentos.nombre AS nomDepartamento,
    empleados.nombre AS nomEmpleado,
    empleados.apellidos,
    empleados_proyectos.horas
FROM
    departamentos
        RIGHT JOIN
    empleados ON empleados.departamento_id = departamentos.id
        RIGHT JOIN
    empleados_proyectos ON empleados_proyectos.empleado_id = empleados.id
        RIGHT JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
ORDER BY empleados_proyectos.horas DESC;