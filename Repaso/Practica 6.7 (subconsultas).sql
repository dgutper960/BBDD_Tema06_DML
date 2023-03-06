-- Practica 6.7
-- Subconsltas
-- Tema 6 - DML
-- David Gutiérrez Pérez

use empresa;

# 1 Obtener los proyectos que tengan la misma localización que el proyecto "Carretera Madrid Toledo".*/
SELECT 
    *
FROM
    proyectos
WHERE
localizacion =
    (SELECT 
           localizacion
        FROM
            proyectos
        WHERE
            descripcion like '%Carretera Madrid Toledo%');
            
# 2 Obtener todos los empleados que estén en el mismo departamento que "Jennifer Wallace" */

SELECT 
    *
FROM
    empleados
WHERE
    departamento_id = (SELECT 
            departamento_id
        FROM
            empleados
        WHERE
            nombre LIKE '%Jennifer%'
                AND apellidos like '%Wallace%');
                
# 3 Obtener los empleados que tengan menor salario que "Alicia Zelaya" */
SELECT 
    *
FROM
    empleados
WHERE
    salario < ALL (SELECT 
            salario
        FROM
            empleados
        WHERE
            nombre LIKE '%Alice%'
                AND apellidos LIKE '%Zelaya%');
                
# 4 Obtener todos los Beneficiarios que hayan nacido en el mismo año que" Alice"
SELECT 
    *
FROM
    beneficiarios
WHERE
    YEAR(fecha_nac) = ALL (SELECT 
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            nombre LIKE '%Alice%');
            
# 5 Obtener los empleados más jóvenes que "James Bord". */
SELECT 
    *
FROM
    empleados
WHERE
    fecha_nac > ALL (SELECT 
            fecha_nac
        FROM
            empleados
        WHERE
            nombre LIKE '%James%'
                AND apellidos LIKE '%Bord%');
                
# 6 Obtener aquellos empleados cuyo supervisor coincida alguno de los supervisores de los empleados del departamento 3.  */
SELECT 
    *
FROM
    empleados
WHERE
    supervisor_id in (SELECT distinct
            supervisor_id
        FROM
            empleados
        WHERE
            departamento_id = 3);

                
# 7 Obtener aquellos empleados cuyo año de nacimiento coincida con alguno de los años de nacimiento de los empleados del departamento 3 */
SELECT 
    *
FROM
    empleados
WHERE
    YEAR(fecha_nac) in (SELECT
            YEAR(fecha_nac)
        FROM
            empleados
        WHERE
            departamento_id = 3);                

# 8 Obtener aquellos empleados cuyo salario coincida con el salario de alguno de los empleados del departamento 2 */
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
            departamento_id = 2);


# 9 Añadir un departamento nuevo en la base de datos. */

# 10 Obtener los departamentos que no tengan empleados.  */
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
           departamento_id = departamentos.id);


# 11 Obtener los departamentos que tengan empleados. */
SELECT 
    *
FROM
    departamentos
WHERE
    EXISTS( SELECT 
           *
        FROM
            empleados
        WHERE
           departamento_id = departamentos.id);
           
# 12  Obtener los departamentos que no tengan asignado proyectos */
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
            departamento_id = departamentos.id);
            
# 13 Obtener los departamentos que tengan asignado algún proyecto.  */
SELECT 
    *
FROM
    departamentos
WHERE
    EXISTS (SELECT 
            *
        FROM
            proyectos
        WHERE
            departamento_id = departamentos.id);
            
# 14 Obtener los datos de los empleados cuyo salario sea igual a algún salario de los empleados del departamento 1.
#    Realizar mediante ANY
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
            departamento_id = 1); 

# 15 Realizar mediante IN el mismo ejercicio anterior.  */
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
            departamento_id = 1); 
            
            
# 16 Obtener los datos de los empleados cuyo salario sea inferior a alguno de los salarios de los empleados del departamento 2.  */
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
            departamento_id = 2);

# 17 Obtener los datos de los empleados cuyo salario sea superior a alguno de los
#    salarios de los empleados cuyo supervisor_id es 1 */ 

SELECT 
    *
FROM
    empleados
WHERE
    salario > ANY (SELECT DISTINCT
            salario
        FROM
            empleados
        WHERE
            supervisor_id = 1);
            
            
# 18  Obtener los datos de los empleados cuyo salario sea MENOR a todos los
#     salarios correspondientes a los empleados del departamento 1 */

SELECT 
    *
FROM
    empleados
WHERE
    salario < all (SELECT
            salario
        FROM
            empleados
        WHERE
            departamento_id = 1);

# 19 Obtener los datos de los empleados cuyo salario sea superior al salario de todos
#    los empleados del departamento 2. */

SELECT 
    *
FROM
    empleados
WHERE
    salario > all (SELECT
            salario
        FROM
            empleados
        WHERE
            departamento_id = 2);

