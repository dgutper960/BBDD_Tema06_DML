

use maratoon;

# Saber la edad media de los corredores de ubrique
select
avg(edad)
where
ciudad = 'Ubrique';

# Número de corredores de ubrique
select
count(*)
from corredores where Ciudad = 'Ubrique';

# Con una consulta mostrar los corredores que hay en cada club
select
count(*)
from corredores group by Club_id;


# Con una consulta mostrar los corredores que hay en cada ciudad
select
ciudad, count(*) -- > Aqui solo funciones de agregado o la columna de agregacion (ciudad)
from corredores group by Ciudad;

# La misma búsqueda pero agrupados por edad y con la edad media
select
ciudad, count(*), avg(edad) Edad_Media -- > Se ha determinado el alias Edad_Media 
from corredores group by Ciudad;

# La misma búsqueda pero mas completa aun
select
ciudad, count(*), avg(edad) Edad_Media, max(Edad) Edad_Max, min(Edad) Edad_min -- > Se pueden poner tantos campos como se quiera 
from corredores group by Ciudad;

# Saber el número de corredores de  cada categoría
SELECT 
    corredores.Categoria_id,
    categorias.Nombre,
    COUNT(*) Num_Corredores
FROM
    corredores
        INNER JOIN
    categorias ON corredores.Categoria_id = corredores.Categoria_id
GROUP BY Categoria_id;

# Lo mismo pero solo con corredores de villamartin
SELECT 
    corredores.Categoria_id,
    categorias.Nombre,
    COUNT(*) Num_Corredores
FROM
    corredores
        INNER JOIN
    categorias ON corredores.Categoria_id = corredores.Categoria_id
WHERE -- > Antes del order by, primero selecciona los de villamartin y luego agrupa
    ciudad = 'Villamartin'
GROUP BY Categoria_id;


# Saber el num de corredores de cada ciudad, mayor de 50 años
select
ciudad, count(*)
from corredores
where edad > 50
order by edad;

# Num de corredores por sexo
select
sexo, count(*)
from corredores
where Sexo = 'M'
group by sexo;

select
sexo, count(*)
from corredores
where Sexo = 'H'
group by sexo;

# Num de hombres de cada ciudad
SELECT 
    ciudad, COUNT(*) num_corredores -- > Alias
FROM
    corredores
WHERE  -- > Primero buscar solo los hombre
    sexo = 'H'
GROUP BY ciudad -- > Después se agrupa por Ciudad
having num_corredores > 3; -- > Se establece una condición después de hacer la agrupación



