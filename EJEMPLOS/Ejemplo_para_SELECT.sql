-- EJEMPLO PARA SELECT

-- MUESTRA TODSA LAS COLUMNAS DE LA TABLA CORREDORES
select * from corredores;

-- MUESTRA LAS COLUMNAS SINTRODUCIDAS
select id, nombre, apellidos from corredores;

-- EN LA LISTA DE COLLUMNAS SE PUEDEN PONER EXPRESIONES 
select id, nombre, (edad*4)/12 as pasos_dia from corredores; -- as -> para que no salga la expreswion en la tabla

select id, CONTACT_WS (', ', apellidos, nombre) as Nombre, (edad*4)/12 from corredores;
-- La coma entre comillas es para poner lo que quiero que aparezca en la tabla para separar el nombre de apelidos

# El prefijo es el nombre de la tabla a la que pertenece esa columna -> ej
select
	corredores.id,
    corredores.nombre,
    corredores.apellidos
from
	maratoon.corredores; -- > el prefijo es obligatorio cuando la consulta es multitabla
    
# Al nombre de la tabla se le puede poner un alias -> ej
select
	c.id,
    c.nombre,
    c.apellidos
from
	maratoon.corredores as c;
    
# Para conectar la clave ajena de un nombre con el nombre de la tabla a la que se hace referencia -> ej
select
	c.id,
    c.nombre,
    c.apellidos
    categoria_id,
    ca.nombre,
    c.Club_id,
    cl.nombre
from
	maratoon.corredores as c inner join categorias as ca
    ON c.Categoria_id = ca.id
    inner join clubs as cl ON c.clubs_id = cli.id;
    -- > Con esto la tabla mostrará los nombres de la categoría y del club y no sus respectivos id
    
    
    
    