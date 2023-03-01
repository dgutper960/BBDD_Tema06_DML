-- Repaso Temario
-- Tema 6 - DML
-- Subconsultas Anidadadas

#### USAMOS LA BBDD MARATOON ####
use maratoon;


/* SINTAXIS SUBCINSULTAS
SELECT Lista_Columnas FROM Lista_Tablas WHERE Columna Operador_Comparacion 
(SELECT … FROM … WHERE ..) */

-- Ejemplos Subconsultas
-- Ejemplo 57
-- Determinar los corredores que son mayores que Eva Rubiales
SELECT 
    *
FROM
    Corredores
WHERE
    Edad > (SELECT 
            YEAR(corredores.FechaNacimiento) Edad
        FROM
            Corredores
        WHERE
            Nombre = 'Eva'
                AND Apellidos LIKE 'Rubiales%');
 

-- Ejemplos Subconsultas
-- Ejemplo 58
-- Determinar el corredor más veterano
SELECT 
 *
FROM
Corredores
WHERE
Edad = (SELECT max(Edad)From Corredores);

#### Predicados Cuantificadores (ANY, SOME, ALL) ####

/*El resultado de la sentencia SELECT subordinada debe ser
  una tabla con una sola columna y cero o más filas.*/
  
## CUANTIFICADOR ALL ##
-- Ejemplos Subconsultas ALL
-- Ejemplo 59
-- Determinar los corredores que son mayores que TODOS los de Villamartín
SELECT 
    *
FROM
    Corredores
WHERE
    Edad > ALL (SELECT 
            Edad
        FROM
            Corredores
        WHERE
            Ciudad = 'Villamartín');
            
## CUANTIFICADOR ANY o SOME ##

-- Ejemplos Subconsultas ANY o SOME
-- Ejemplo 60
-- Determinar los corredores cuya edad sea inferior a 
-- la edad de ALGÚN corredor de Arcos
SELECT 
    *
FROM
    Corredores
WHERE
    Edad < ANY (SELECT 
            Edad
        FROM
            Corredores
        WHERE
            Ciudad = 'Arcos');
            
## PREDICADO IN ##

-- Ejemplo 61
-- Determinar los corredores cuya edad coincida 
-- con la edad de CUALQUIERA de los corredores de Arcos
SELECT 
    *
FROM
    Corredores
WHERE
    Edad IN (SELECT 
            Edad
        FROM
            Corredores
        WHERE
            Ciudad = 'Arcos');
            
## PREDICADO [NOT] EXISTS

-- Ejemplos Subconsultas EXISTS
-- Ejemplo 62
-- Determinar los clubs que NO TENGAN corredores
SELECT 
    *
FROM
    clubs
WHERE
    NOT EXISTS (SELECT 
            *
        FROM
            Corredores
        WHERE
            Corredores.club_id = clubs.id);





