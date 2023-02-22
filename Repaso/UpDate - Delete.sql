-- Repaso - Tema 6 - DML
-- Scripts TEMARIO
-- 6.3 Actualizar Registros. UPDATE
-- 6.4 Borrar Registros: DELETE

#### NO HAY BBDD EN USO ####

/* SINTAXIS UPDATE:
UPDATE [LOW_PRIORITY] [IGNORE] tbl_name
SET col_name1=expr1 [, col_name2=expr2...] 
[WHERE where_definition] --> Clausura Where actuliza registros que cumplan esa condición, de no ponerse se actualizan TODOS
[ORDER BY...][LIMIT row_cont] --> ORDER BY -> El SGBD primero ordena y luego aplica la actualización */

#### Actualizar Registros -> UPDATE ####

-- Incrementar en 1.000 € el importe de la Beca 
-- de los 4 primeros alumnos ordenados alfabéticamente.
UPDATE alumnos 
SET 
    importeBeca = importeBeca + 1000
ORDER BY apellidos , nombre LIMIT 4;

-- Incrementar en 10 € la Beca de los 
-- 10 alumnos con menor importe de beca asignado.
UPDATE Alumnos 
SET 
    importeBeca = importeBeca + 10
ORDER BY importeBeca ASC LIMIT 10; -- > Orden por defecto Descendente

-- Todos los alumnos repetidores se le aplicará un ImporteBeca = 0 
-- y se les rechazará la beca
UPDATE Alumnos 
SET 
    importeBeca = 0,
    Beca = FALSE
WHERE
    Repetidor;
    
-- Incrementar en 100 € el importe de la beca de 
-- los alumnos que no sean de Ubrique.
UPDATE Alumnos 
SET 
    importeBeca = importeBeca + 100
WHERE
    NOT poblacion = 'Ubrique';  -- > SOLO APLICA A LOS QUE NO SON DE UBRIQUE
    
# Lo mismo de arriba pero
-- Aplicar sólo a los que se le ha concedido la beca.
UPDATE Alumnos 
SET 
    importeBeca = importeBeca + 100
WHERE
    beca AND NOT poblacion = 'Ubrique';
    
#### Borrar Registros --> DELETE ####
/* SINTAXIS
DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name
[WHERE where_definition] 
[ORDER BY...] 
[LIMIT row_count] */

## EJEMPLO ##

CREATE TABLE IF NOT EXISTS Alumnos(
id INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(20),
Apellidos VARCHAR(40),
Poblacion VARCHAR(20),
FechaIngreso TIMESTAMP,
Repetidor BOOLEAN,
Beca BOOLEAN,
ImporteBeca DECIMAL(10, 2 )
);
-- Borrar todos los registros de la tabal Alumnos
DELETE FROM Alumnos;

-- Otra opción más rápida sería
TRUNCATE TABLE Alumnos;

-- Eliminar todos los alumnos repetidores
DELETE FROM Alumnos WHERE Repetidor; -- > Borra todos los registros de la columna Repetidor

-- Eliminar el primer alumno repetidor ordenado alfabéticamente
DELETE FROM Alumnos 
WHERE
    Repetidor ORDER BY Apellidos , Nombre LIMIT 1;

-- Eliminar los dos alumnos con mayor importe de beca
DELETE FROM Alumnos ORDER BY ImporteBeca DESC LIMIT 2;



 

    











