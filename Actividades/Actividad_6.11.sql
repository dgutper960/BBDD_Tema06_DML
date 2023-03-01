-- Actividad 6.11
-- Tema 6 - DML
-- Curso 1 DAW
-- Autor David Gutiérrez Pérez
-- Fecha 21/02/23

use empresa;

# 1 Obtener el número de empleados que hay en cada departamento.
#  Mostrar las columnas: id, Departamento y el alias NumEmpleados.

SELECT 
    departamentos.id,
    departamentos.nombre departamento,
    COUNT(*) NumEmpeados
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY empleados.departamento_id;

# 2 Obtener el número de empleados que hay en cada departamento cuyo sueldo esté por encima de los 30000 anuales.
#  Mismas columnas que el ejercicio anterior.
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

# 3 Obtener el número total de empleados que hay en cada departamento
#  cuyo salario esté comprendido entre 20000 y 50000.
#  Mismas columnas que el ejercicio anterior.

SELECT 
    departamentos.id,
    departamentos.nombre as departamento,
    COUNT(*) NumEmpeados
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
WHERE
    salario between 20000 and 50000
GROUP BY empleados.departamento_id;

# 4 Obtener el número de empleados que nacieron en cada año.
#  Mostrar las columnas con el alias Año y Nempleados.
SELECT 
    year(empleados.fecha_nac) as anyo,
    COUNT(*) Nempleados
FROM
    empleados
GROUP BY empleados.fecha_nac;


# 5 Sobre la tabla Empleados_proyectos, obtener la suma total de horas trabajadas en cada proyecto.
#  Mostrar id, Proyecto y HorasAcumuladas.
SELECT 
    proyectos.id,
	proyectos.descripcion,
    SUM(empleados_proyectos.horas) HorasAcumuladas
FROM
    empleados_proyectos
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
    group by proyectos.descripcion
    order by proyectos.id;


# 6 Obtener el número de empleados que tiene a su cargo cada supervisor.
#  Mostrar id, Apellidos, Nombre, y el alias numDependientes
SELECT 
    supervisor.id as idSupervisor,
    CONCAT_WS(', ',
            supervisor.nombre,
            supervisor.apellidos) AS NomSupervisor,
    COUNT(empleados.id) AS numDependientes
FROM
    empleados
        INNER JOIN
    empleados supervisor ON empleados.supervisor_id = supervisor.id
GROUP BY supervisor.id;


# 7. Obtener para cada departamento la siguiente información estadística:
# a. Número de Departamento
# b. Nombre del Departamento
# c. Jefe del Departamento
# d. Numero de Empleados
# e. Salario Medio 
# f. Salario Máximo
# g. Salario Mínimo
# h. Suma Salarios

SELECT 
    departamentos.id,
    departamentos.nombre as nomDepartamento,
    CONCAT_WS(', ',
            jefe.nombre,
            jefe.apellidos) AS jefeDepartamento,
 count(empleados.id) numEmpleados,
 avg(empleados.salario) medSalarios,
 max(empleados.salario) SalarioMAX,
 min(empleados.salario) SalarioMIN,
 sum(empleados.salario) SumaSalarios
FROM
    departamentos
        INNER JOIN
    empleados ON empleados.departamento_id = departamentos.id
        INNER JOIN
    empleados as jefe on departamentos.jefe_departamento_id = jefe.id
    group by departamentos.id;

# 8. Obtener la siguiente información:
# a. id, NSS de la tabla empleados
# b. Nombre del empleado
# c. Número total de beneficiarios

SELECT 
empleados.id,
empleados.nss,
    CONCAT_WS(', ',
            empleados.nombre,
            empleados.apellidos) AS Empleado,
    COUNT(beneficiarios.id) AS TotalBeneficiarios
FROM
    empleados
        INNER JOIN
    beneficiarios ON beneficiarios.empleado_id = empleados.id
GROUP BY empleados.id;

# 9 Mostrar el número de beneficiarios de cada departamento
# (intervienen las tablas Empleados, Departamento y Dependientes). 
# Mostrará la siguiente información.
# a. id de Departamento 
# b. Nombre del Departamento
# c. Función de Agregación. Número de Beneficiarios
SELECT DISTINCT
    departamentos.id,
    departamentos.nombre,
    COUNT(beneficiarios.id) AS Num_Beneficiarios
FROM
    beneficiarios
        INNER JOIN
    empleados ON beneficiarios.empleado_id = empleados.id
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY departamentos.id;

/* 10 Obtener el número de horas acumuladas en cada proyecto, mostrando la siguiente información:
a. Id de Proyecto
b. nombre de Proyecto
c. Nombre de Departamento
d. Función Agregación SUM a partir de empleados_proyecto */
SELECT 
    proyectos.id,
    proyectos.descripcion as Proyecto,
    departamentos.nombre as Departamento,
    SUM(empleados_proyectos.horas) Horas_Acumuladas
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
    group by proyectos.id;
    
/* 11 Mostrar el número de horas acumuladas por cada trabajador:
a. empleado_id de empleado_proyecto
b. Función de Agregación correspondiente  */
SELECT 
    empleados_proyectos.empleado_id as idEmpleado,
    SUM(empleados_proyectos.horas) horas_acumuladas
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
GROUP BY empleados.id;


/* 12 Mostrar el número de horas acumuladas por cada trabajador en cada proyecto. Mostrar 
a. id de empleado_proyecto
b. IdProyecto de trabaja_en
c. Función de agregación correspondiente */

SELECT 
    empleados_proyectos.empleado_id AS idEmpleado,
    proyectos.id AS IdProyecto,
    proyectos.descripcion AS trabaja_en,
    SUM(empleados_proyectos.horas) horas_acumuladas
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
GROUP BY empleados_proyectos.empleado_id, empleados_proyectos.proyecto_id;

/* 13 Mostrar el número de horas acumuladas por cada trabajador en cada proyecto pero mostrando:
a. empleado_id de empleado_proyecto
b. Nombre de Empleado
c. Apellidos de Empleado
d. proyecto_id de empleado_proyecto
e. Función de agregación correspondiente .  */
SELECT 
    empleados_proyectos.empleado_id AS idEmpleado,
    CONCAT_WS(', ',
            empleados.nombre,
            empleados.apellidos) AS Empleado,
    empleados_proyectos.proyecto_id,
    SUM(empleados_proyectos.horas) horas_acumuladas
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
GROUP BY empleados_proyectos.empleado_id , empleados_proyectos.proyecto_id;

# 14 Misma consulta anterior pero mostrando la columna Descripción del Proyecto

SELECT 
    empleados_proyectos.empleado_id AS idEmpleado,
    proyectos.descripcion as nombreProyecto,
    CONCAT_WS(', ',
            empleados.nombre,
            empleados.apellidos) AS Empleado,
    empleados_proyectos.proyecto_id,
    SUM(empleados_proyectos.horas) horas_acumuladas
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    proyectos ON empleados_proyectos.proyecto_id = proyectos.id
GROUP BY empleados_proyectos.empleado_id , empleados_proyectos.proyecto_id;

/* 15 Obtener el sueldo medio de los empleados del departamento 3, Realizar este ejercicio usando la cláusula WHERE. */
SELECT 
    AVG(empleados.salario)
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
WHERE departamentos.id = 3;

/* 16 Obtener el mismo ejercicio anterior pero usando la cláusula HAVING con GROUP BY */
SELECT 
    AVG(empleados.salario)
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
group by  departamentos.id having departamentos.id = 3;

/* 17 Obtener el sueldo medio, sueldo máximo y sueldo mínimo de los empleados del departamento 1 y 2. 
Mostrar las columnas id del departamento y las correspondientes funciones de agregación. */
SELECT 
    departamentos.id,
    AVG(empleados.salario) AS salario_Medio,
    MAX(empleados.salario) AS salario_Max,
    MIN(empleados.salario) AS salario_Min
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
group by departamentos.id having departamentos.id in (1, 2);

/* 18  Mostrar el id de departamento en los que el número total de horas trabajadas sea superior o igual a 50. */
SELECT 
    departamentos.id,
    SUM(empleados_proyectos.horas) as HorasTotales
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY departamentos.id having (sum(empleados_proyectos.horas) > 50);

/* 19 Obtener aquellos departamentos en los que el salario medio de sus empleados sea superior a 40000.
Mostrar número de departamento y salario medio. */
SELECT 
    departamentos.id,
    avg(empleados.salario) as SalarioMedio
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY departamentos.id having (avg(empleados.salario) > 40000);


/* 20 Obtener el salario medio por año de nacimiento, pero mostrar sólo aquellos en los que el salario medio sea superior a 45000.
Columnas Año, Salario Medio y Número de Empleados. */

SELECT 
    year(empleados.fecha_nac) as AñoNacimiento,
    avg(empleados.salario) as SalarioMedio,
    count(empleados.id) as NumEmpleados
FROM
    empleados_proyectos
        INNER JOIN
    empleados ON empleados_proyectos.empleado_id = empleados.id
        INNER JOIN
    departamentos ON empleados.departamento_id = departamentos.id
GROUP BY year(empleados.fecha_nac) having (avg(empleados.salario) > 45000);



# 21 Número de beneficiarios por sexo.
SELECT 
    beneficiarios.genero, COUNT(beneficiarios.id)
FROM
    beneficiarios
GROUP BY beneficiarios.genero;


