-- Actividad 6.12
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David Gutiérrez Pérez
-- Fecha 28/02/23

# Sobre la base de datos _geslibros.sql_
use geslibros;

/* 1. Script - clientes
Mostrar aquellos clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org",
es decir que en email contengan el nombre del servidor.
        Tablas: clientes
        Condición: clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org". 
        Columnas: id, nombre, dirección, nif, telefono y email.
        Orden:  nombre.  */
SELECT 
    clientes.id,
    clientes.nombre,
    clientes.direccion,
    clientes.nif,
    clientes.telefono,
    clientes.email
FROM
    clientes
WHERE
    poblacion = 'Ubrique'
        AND email LIKE '%ieslosremedios.org'
ORDER BY clientes.nombre;
        
/* 2. Script - ventas
Mostrar las 3 mejores ventas realizadas en el año 2014.
        Tablas: ventas, clientes
        Condición: sólo las del año 2014
        Columnas: id, nombre cliente, fecha de la venta, importe_bruto, importe_iva e importe_total
        Orden: por importe de mayor a menor. */
        
	SELECT 
    ventas.id,
    clientes.nombre AS nombre_cliente,
    ventas.fecha,
    ventas.importe_bruto,
    ventas.importe_iva,
    ventas.importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = 2014
ORDER BY importe_total desc  -- > TENER EN CUENTA ORDEN POR DEFECTO
LIMIT 3;
    
    
/* 3. Script - libros
Mostrar detalles de todos los libros editados en 2011 cuyo stock esté entre 10 y 20 unidades.
        Tablas: libros, autores, editoriales
        Condición: Stock entre 10 y 20, sólo del año 2011.
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
        Orden: id libro */

SELECT 
    libros.id,
    libros.titulo,
    autores.nombre AS autor,
    editoriales.nombre AS editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    YEAR(libros.fecha_edicion) = 2011
        AND libros.stock BETWEEN 10 AND 20
ORDER BY libros.id; 

/* 4. Script - libros
Mostrar detalles de los libros relacionadas con la temática PHP y Bases de Datos, 
además el precio de venta sea inferior a 30 €
        Tabla principal: libros, autores, editoria
        Condición: título esté relacionados con el lenguaje de programación PHP y que además el precio de venta sea inferior 30 €. 
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
        Orden: id de libro   */
        
	SELECT 
    libros.id,
    libros.titulo,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    (libros.titulo LIKE '%PHP%'
        OR '%Bases de Datos%')
        AND libros.precio_venta < 30
ORDER BY libros.id;
        
/* 5. Script - libros
Mostrar detalles de los libros junto con el margen de beneficios, es decir, la diferencia entre el precio_venta y el precio_coste.
        Tabla principal: libros, autores, editoriales
        Condición: los libros de la editorial Anaya y Alfaguara
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta, margen_beneficio (campo calculado)
        Orden: margen_beneficio de mayor a menor. */
        
select
libros.id,
libros.titulo,
autores.nombre as Autor,
editoriales.nombre as Editorial,
libros.stock,
libros.precio_coste,
libros.precio_venta,
(libros.precio_venta - libros.precio_coste) as margen_beneficio
        FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
    where editoriales.nombre like 'Anaya' or 'Alfaguara'  -- > Se puede poner IN ('Anaya', 'Alfaguara') Así no ExpReg y SIEMPRE ES OR
    order by margen_beneficio desc;
        
        
/* 6. Script - libros
Mostrar detalles de los libros cuyo precio_coste sea igual al precio_coste del libro titulado 'Camboya'.
        Tabla principal: libros, autores, editoriales
        Condición: los libros de la editorial Anaya y Alfaguara
        Columnas: id, título, autor, editorial, stock, precio_costo, precio_venta
        Orden: id libro
        Notas: se precisa subconsulta */    
 
 SELECT 
    libros.id,
    libros.titulo,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    editoriales.nombre LIKE 'Anaya'
        OR 'Alfaguara'
        AND libros.precio_coste IN (SELECT 
            libros.precio_coste
        FROM
            libros
        WHERE
            libros.titulo = 'Camboya')
ORDER BY libros.id;

/* 7. Script - ventas
Se desea obtener el volumen total de ventas realizadas a cada cliente en 2014.
        Tabla principal: ventas y clientes
        Condición: sólo las ventas 2014
        Columnas: id del cliente, nombre cliente, número de ventas, venta máxima, venta mínima y suma. 
        La función de agregado de estos tres últimos campos se aplicarán sobre importe_total de cada venta.
        Orden: suma de ventas totales
        Notas: se precisa agrupación registros  */

SELECT 
    clientes.id AS idCliente,
    clientes.nombre AS Cliente,
    COUNT(ventas.id) AS NumVentas,
    MAX(ventas.importe_total) AS VentaMAx,
    MIN(ventas.importe_total) AS VentaMin,
    SUM(ventas.importe_total) AS SumaVentas
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = 2014
GROUP BY ventas.cliente_id
ORDER BY SumaVentas DESC;  -- > OJO CON EL ORDEN POR DEFECTO


/* 
8. Script - ventas de editoriales
Se desea obtener el volumen total de ventas por Editorial
        Tabla principal: ventas, lineasventas, libros y editoriales
        Condición:  todas las editoriales
        Columnas: id de la editorial, nombre de la editorial, Número de libros vendidos y importe total vendido de libros de esa editorial
        Orden: suma de ventas totales descendente
        Notas: se precisa agrupación registros */

SELECT 
    editoriales.id,
    editoriales.nombre AS editorial,
    SUM(lineasventas.cantidad) AS LibrosVendidos,
    SUM(lineasventas.importe) AS ImporteVentas
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    lineasventas ON lineasventas.libro_id = libros.id
        INNER JOIN
    ventas ON lineasventas.venta_id = ventas.id
GROUP BY libros.editorial_id
ORDER BY LibrosVendidos DESC;


/* 9. View - ventas editoriales
Obtener una vista llamada ventas_editoriales a partir del script anterior.
Usando la vista creada se pide: 
        Obtener aquellas editoriales que hayan conseguido vender más de 50 libros. */
CREATE VIEW ventas_editoriales AS
    SELECT 
        editoriales.id,
        editoriales.nombre AS editorial,
        SUM(lineasventas.cantidad) AS LibrosVendidos,
        SUM(ventas.importe_total) AS ImporteTotal
    FROM
        libros
            INNER JOIN
        editoriales ON libros.editorial_id = editoriales.id
            INNER JOIN
        lineasventas ON lineasventas.libro_id = libros.id
            INNER JOIN
        ventas ON lineasventas.venta_id = ventas.id
    GROUP BY libros.editorial_id
    ORDER BY LibrosVendidos DESC;
    
    select * from ventas_editoriales where LibrosVendidos > 50;

/* 10. Insertar - Libros
Insertar un libro con datos válidos en la tabla libros a partir de los siguientes requisitos:
        El autor del libro es Gabriel García Márquez
        La editorial es Alfaguara
        El ISBN es '9788448180833'
        El EAN es '9788888199586'
        Inventar resto de datos */
        
insert into libros set
id = NULL,
isbn = 9788448180833,
ean = 9788888199586,
titulo = 'Vivir para contarla de nuevo',
autor_id = 1,
editorial_id = 5,
precio_coste = 17.50,
precio_venta = 27.50,
stock = 15700,
stock_min=0,
stock_max=20000,
fecha_edicion='2022-11-21';


/* 11. Insertar - Libros_Temas
Insertar los registros adecuados en la tabla Libros_temas, teniendo en cuenta que el libro anterior es novela, ciencia y astronomía */

INSERT INTO libros_temas SET
libro_id=20,
tema_id=3;

INSERT INTO libros_temas SET
libro_id=20,
tema_id=7;

INSERT INTO libros_temas SET
libro_id=20,
tema_id=9;

/* 12. Insertar - Líneas Ventas y Ventas
        Insertar un registro con datos válidos en la tabla ventas.
        Insertar 3 registros en la tabla lineasventas con datos válidos relacionados con la venta anterior.*/

insert into lineasventas set
id = null,
venta_id = 11,
numero_linea = 3,
libro_id = 20,
iva = 0.04,
cantidad = 2,
precio = 27.50,
importe = 55.22;

insert into ventas set -- > EJECUTAR PRIMERO ESTE SCRIPT
id = null,
cliente_id = 6,
fecha = default,
importe_bruto = 27.61,
importe_iva = 0.11,
importe_total = 55.5;


/* 13. Update - Libros
Debido al incremento de costes y nuevas tasas impositivas se desea subir el precio de los libros de la editorial Anaya en un 10%. */

UPDATE libros set libros.precio_venta = libros.precio_venta*1.10 where editorial_id = 6; 


/* 14. Update - Libros
Se desea reducir el precio de los libros que no se vendieron en 2014 en un 30%.  */

UPDATE libros 
SET 
    libros.precio_venta = libros.precio_venta * 0.70
WHERE
    lineasventas.venta_id NOT IN (SELECT DISTINCT
            lineasventas.libros_id
        FROM
            ventas
                INNER JOIN
            lineasventas ON lineasventas.venta_id = ventas.id where YEAR(ventas.fecha) = '2014'); 



/* 15. Delete - Libros
Se desea eliminar definitivamente todos los libros que contengan la temática belleza, ya que se han quedado obsoletos */
DELETE FROM libros WHERE libros.id IN (SELECT libro_id FROM libros_temas WHERE tema_id='5');



