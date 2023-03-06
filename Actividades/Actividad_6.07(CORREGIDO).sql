-- Actividad 6.7
-- Tema 6 - DML
-- Curso 1DAW
-- Autor David Gutiérrez Pérez
-- Fecha 13/02/23

use Empresa;

# Obtener los proyectos que tengan la misma localización que el proyecto "Carretera Madrid Toledo".

SELECT 
    *
FROM
    proyectos
WHERE
    localizacion = (SELECT 
            localizacion
        FROM
            proyectos
        WHERE
            descripcion LIKE '%Carretera Madrid Toledo%'); -- > DEVUELVE TODOS LOS PROYECTOS DE LOCALIZACIÓN HUSTON (es lo que devuelve la subconsulta)

# Obtener todos los empleados que estén en el mismo departamento que "Jennifer Wallace"

SELECT 
    *
FROM
    empleados
WHERE  -- > Cuidado con no comparar una columna con una tabla 
    departamento_id = (SELECT 
            departamento_id
        FROM
            empleados
        WHERE
            nombre LIKE '%Jennifer%'
                AND apellidos LIKE '%Wallace%');

# Obtener los empleados que tengan menor salario que "Alicia Zelaya"

select * from empleados where salario < all (select salario from empleados where 'Alicia Zelaya');

# Obtener todos los Beneficiarios que hayan nacido en el mismo año que" Alicia"

SELECT 
    *
FROM
    empleados
WHERE
    salario <= (SELECT 
            salario
        FROM
            empleados
        WHERE
            nombre LIKE '%Alicia%'
                AND apellidos LIKE '%Zelaya%');
                
# Obtener todos los Beneficiarios que hayan nacido en el mismo año que" Alice"

SELECT 
    *
FROM
    beneficiarios
WHERE
    YEAR(fecha_nac) = all (SELECT 
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            nombre LIKE '%ALice%');
            
# Obtener los empleados más jóvenes que "James Borg"
SELECT 
    *
FROM
    empleados
WHERE
    fecha_nac > (SELECT 
            fecha_nac
        FROM
            empleados
        WHERE
            nombre LIKE '%James%'
                AND apellidos LIKE '%Borg%');
  
 # Obtener aquellos empleados cuyo supervisor coincida alguno de los
			
SELECT 
    *
FROM
    empleados
WHERE
    supervisor_id IN (SELECT DISTINCT
            supervisor_id
        FROM
            empleados
        WHERE
            departamento_id = 3);
            
-- Estos dos serían equivalentes por temas de compatibilidad
            
SELECT 
    *
FROM
    empleados
WHERE
    supervisor_id = some (SELECT DISTINCT
            supervisor_id
        FROM
            empleados
        WHERE
            departamento_id = 3);
            
SELECT 
    *
FROM
    empleados
WHERE
    supervisor_id = any (SELECT DISTINCT
            supervisor_id
        FROM
            empleados
        WHERE
            departamento_id = 3);
            
# Obtener aquellos empleados cuyo año de nacimiento coincida con alguno de los
-- años de nacimiento de los empleados del departamento 3.
SELECT 
    *
FROM
    empleados
WHERE
    YEAR(fecha_nac) IN (SELECT 
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            departamento_id = '3');
            
# Obtener aquellos empleados cuyo salario coincida con el salario de alguno de
-- los empleados del departamento 2

SELECT 
    *
FROM
    empleados
WHERE
    salario IN (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamentos_id = '2');

# Obtener los departamentos que no tengan empleados.
SELECT 
    *
FROM
    departamentos
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            empleados
        WHERE
            empleados.departamento_id = departamentos.id);
            
# Obtener los departamentos que tengan empleados
SELECT 
    *
FROM
    departamentos
WHERE
    EXISTS (SELECT 
            *
        FROM
            empleados
        WHERE
            empleados.departamento_id = departamentos.id);
            
SELECT 
    *
FROM
    departamentos
WHERE
    id in (SELECT distinct 
            departamento_id
        from
            empleados);
            
# Obtener los departamentos que no tengan asignado proyectos
SELECT 
    *
FROM
    departamentos
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            proyectos
        WHERE
            proyectos.departamento_id = departamentos.id);
            
# Obtener los departamentos que tengan asignado algún proyecto
SELECT 
    *
FROM
    departamentos
WHERE
    id IN (SELECT DISTINCT
            departamento_id
        FROM
            proyectos);

# Obtener los datos de los empleados cuyo salario sea igual a algún salario de los
-- empleados del departamento 1. Realizar mediante ANY
SELECT 
    *
FROM
    empleados
WHERE
    salario = ANY (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamento_id = '1');
            
SELECT 
    *
FROM
    empleados
WHERE
    salario = some (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamento_id = '1');

SELECT 
    *
FROM
    empleados
WHERE
    salario in (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamento_id = '1');
            
# Obtener los datos de los empleados cuyo salario sea inferior a alguno de los
-- salarios de los empleados del departamento 2.
SELECT 
    *
FROM
    empleados
WHERE
    salario < ANY (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            departamento_id = '2');
            
SELECT 
    *
FROM
    empleados
WHERE
    salario < ANY (SELECT DISTINCT
            max(salario)
        FROM
            empleados
        WHERE
            departamento_id = '2');
            
# Obtener los datos de los empleados cuyo salario sea superior a alguno de los
-- salarios de los empleados cuyo supervisor_id es 1

SELECT 
    *
FROM
    empleados
WHERE
    salario > any (SELECT 
            MIN(salario)
        FROM
            empledos
        WHERE
            supervisor_id = '1');        

# Obtener los datos de los empleados cuyo salario sea MENOR a todos los
-- salarios correspondientes a los empleados del departamento 1.
select * from empleados where salario < all (select distinct salario from empleados where departamento_id = 1); -- revisar

SELECT 
    *
FROM
    empleados
WHERE
    salario < (SELECT 
            MIN(salario)
        FROM
            empleados
        WHERE
            departamento_id = '1');

# Obtener los datos de los empleados cuyo salario sea superior al salario de todos
-- los empleados del departamento 2
SELECT 
    *
FROM
    empleados
WHERE
    salario > (SELECT 
            MAX(salario)
        FROM
            empleados
        WHERE
            departamento_id = '2');


