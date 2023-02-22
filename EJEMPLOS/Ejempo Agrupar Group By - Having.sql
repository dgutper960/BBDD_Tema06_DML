use maratoon;

# mostrar num corredores por poblacion
select ciudad, count(*) from corredores group by ciudad;


# mostrar num corredores por club --> el nombre del clun esta en otra tabla
SELECT 
corredores.club_id,
clubs.nombre club,
    club_id, COUNT(*) Num_Corredores,
    avg(corredores.edad) Edad_media,
    max(corredores.edad) Edad_maxima,
    min(corredores.edad) Edad_min
FROM
    corredores
        INNER JOIN
    clubs ON corredores.club_id = clubs.id
GROUP BY club_id;

# Mostrar de cada categoría: num corredores, edad media, edad min, edad max (como el de arriba)
SELECT 
    corredores.categoria_id,
    categirias.nombre nomCorredor,
    categoria_id, count(*) Num_corredores,
    avg(corredores.edad) Edad_media,
    max(corredores.edad) Edad_maxima,
    min(corredores.edad) Edad_min
    
FROM
    categorias
        INNER JOIN
    corredores ON corredores.categoria_id = categorias.id
GROUP BY corredores.categoria_id;

# HAVING SE UTILIZA PARA ESTABLECER UNA CONDICION SOBRE LOS GRUPOS
-- EJ having Categorias like %Veteranos %

# Num de corredores de cada club mayores de 40 años

SELECT 
corredores.club_id,
clubs.nombre club,
    club_id, COUNT(*) Num_Corredores,
    avg(corredores.edad) Edad_media,
    max(corredores.edad) Edad_maxima,
    min(corredores.edad) Edad_min
FROM
    corredores
        INNER JOIN
    clubs ON corredores.club_id = clubs.id
where edad > 40 -- > Primero se cogen solo los mayores de 40
group by club_id; -- > Luego se agrupan

# Mostrar aquellos clubs que tinene más de 5 corredoes mayores de 30 años
SELECT 
    corredores.club_id,
    clubs.nombre club,
    club_id,
    COUNT(*) Num_Corredores,
    AVG(corredores.edad) Edad_media,
    MAX(corredores.edad) Edad_maxima,
    MIN(corredores.edad) Edad_min
FROM
    corredores
        INNER JOIN
    clubs ON corredores.club_id = clubs.id
WHERE
    edad > 30
GROUP BY club_id
HAVING Num_Corredores > 5; -- > Luego se agrupan





