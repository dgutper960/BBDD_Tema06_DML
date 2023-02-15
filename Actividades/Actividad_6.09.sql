-- Actividad 6.09
-- Tema 6 - DML
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 14/02/23

/*

Realizar las siguientes consultas a partir de la base de datos empresa. Usar INNER JOIN para conectar las tablas relacionadas.

1. Empleados.

Realizar una consulta multitabla que muestre todos los empleados ordenados por id. Las columnas que deberá mostrar son:
De Empleados: id, Nombre, Apellidos, Salario, departamento_id
De Departamento: Nombre del Departamento 
2. Departamentos.

Realizar una consulta multitabla que muestre los detalles de cada departamento, incluido el nombre del jefe de departamento. Esa consulta se mostrará ordenada alfabéticamente por nombre del departamento. Las columnas que mostrará serán:

Departamento: id, nombre, localizacion, componentes, jefe_departamento_id
Empleados: apellidos, nombre
3. Empleados con supervisor

Realizar una consulta multitabla que muestre los detalles de los empleados y el nombre del supervisor asignado. La consulta se mostrará ordenada por id de empleado. Las columnas que mostrará serán:

Empleados: id, nombre, apellidos, nss, salario
Empleados_supervisor: nombre, apellidos (del supervisor)
4. Beneficiarios con Empleados

Realizar una consulta multitabla que muestre los detalles de los beneficiarios junto con el nombre del empleado al que pertenecen:

Beneficiarios: id, nombre, genero, parentesco, fecha_nac, empleado_id
Empleados: nombre, apellidos (empleado)
5. Proyectos

Realizar una consulta multitabla que muestre los detalles de todos los proyectos junto con el nombre del departamento que lo está realizando:

Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
Departamento: nombre (departamento)
6. Proyectos con Jefe de Departamento

Realizar una consulta multitabla que muestre los detalles de todos los proyectos junto con el nombre del departamento que lo está realizando y el nombre del jefe del departamento.

Proyectos: id, descripcion, num_proyecto, localizacion, fecha_inicio, fecha_fin, departamento_id
Departamento: nombre (departamento)
Empleados: nombre, apellidos (jefe del departamento)
Nota: en este ejercicio conectamos Proyecto con Departamento y con Empleados.


7. Informe empleados_proyectos

Genera informe de horas trabajadas en cada proyecto a partir de la tabla empleados_proyectos, en dicho informe se deberá mostrar ordenado alfabéticamente por empleados, y mostrará las siguientes columnas:
Empleados_proyectos: Empleado_id, proyecto_id, horas
Empleados: nombre, apellidos
Proyectos: descripcion