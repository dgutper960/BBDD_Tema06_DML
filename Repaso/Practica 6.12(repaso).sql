-- Repaso Practica 6.12
-- Tema 6 - DML
-- David Gutiérrez Pérez

use geslibros;


/*
1. Script - clientes
Mostrar aquellos clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org",
es decir que en email contengan el nombre del servidor.
        Tablas: clientes
        Condición: clientes de la población de Ubrique que tiene como servidor email "ieslosremedios.org". 
        Columnas: id, nombre, dirección, nif, telefono y email.
        Orden:  nombre. */
        
SELECT 
    clientes.id,
    clientes.nombre AS cliente,
    clientes.direccion,
    clientes.nif,
    clientes.telefono,
    clientes.email
FROM
    clientes
WHERE
    poblacion like 'Ubrique'
        AND email LIKE '%ieslosremedios.org'
ORDER BY nombre;
        

/*
2. Script - ventas
Mostrar las 3 mejores ventas realizadas en el año 2014.
        Tablas: ventas, clientes
        Condición: sólo las del año 2014
        Columnas: id, nombre cliente, fecha de la venta, importe_bruto, importe_iva e importe_total
        Orden: por importe de mayor a menor. */
        
SELECT 
    clientes.id,
    clientes.nombre AS cliente,
    ventas.fecha,
    ventas.importe_bruto,
    ventas.importe_iva,
    ventas.importe_total
FROM
    clientes
        INNER JOIN
    ventas ON ventas.cliente_id = clientes.id
    where year(ventas.fecha) = 2014
ORDER BY ventas.importe_total DESC
LIMIT 3;

/*
3. Script - libros
Mostrar detalles de todos los libros editados en 2011 cuyo stock esté entre 10 y 20 unidades.
        Tablas: libros, autores, editoriales
        Condición: Stock entre 10 y 20, sólo del año 2011.
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
        Orden: id libro */

SELECT 
    libros.id,
    libros.titulo AS Titulo_Libro,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
WHERE
    YEAR(libros.fecha_edicion) = '2011'
        AND libros.stock BETWEEN '10' AND '20'
ORDER BY libros.id;


/*
4. Script - libros
Mostrar detalles de los libros relacionadas con la temática PHP y Bases de Datos,
además el precio de venta sea inferior a 30 €
        Tabla principal: libros, autores, editoria
        Condición: título esté relacionados con el lenguaje de programación PHP y que además el precio de venta sea inferior 30 €. 
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta
        Orden: id de libro  */

SELECT 
    libros.id,
    libros.titulo AS Titulo_Libro,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
WHERE
    libros.titulo LIKE '%PHP%'
        AND libros.precio_venta < 30
ORDER BY libros.id;
	
        
/*
5. Script - libros
Mostrar detalles de los libros junto con el margen de beneficios, es decir,
la diferencia entre el precio_venta y el precio_coste.
        Tabla principal: libros, autores, editoriales
        Condición: los libros de la editorial Anaya y Alfaguara
        Columnas: id, título, autor, editorial, stock, precio_coste, precio_venta, margen_beneficio (campo calculado)
        Orden: margen_beneficio de mayor a menor.  */
        
SELECT 
    libros.id,
    libros.titulo AS Titulo_Libro,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta,
    (libros.precio_venta - libros.precio_coste) AS margen_beneficio
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
WHERE
    editoriales.nombre IN ('Anaya' , 'Alfaguara') -- > OJO NO VALE CON LIKE
ORDER BY margen_beneficio DESC;

/*
6. Script - libros
Mostrar detalles de los libros cuyo precio_coste sea igual al precio_coste del libro titulado 'Camboya'.
        Tabla principal: libros, autores, editoriales
        Condición: los libros de la editorial Anaya y Alfaguara
        Columnas: id, título, autor, editorial, stock, precio_costo, precio_venta
        Orden: id libro
        Notas: se precisa subconsulta  */

select
libros.id,
    libros.titulo AS Titulo_Libro,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
WHERE
    editoriales.nombre IN ('Anaya' , 'Alfaguara') and
    libros.precio_coste in 
    (select libros.precio_coste from libros where libros.titulo like '%Camboya%')
    order by libros.id;


/*
7. Script - ventas

Se desea obtener el volumen total de ventas realizadas a cada cliente en 2014.

        Tabla principal: ventas y clientes
        Condición: sólo las ventas 2014
        Columnas: id del cliente, nombre cliente, número de ventas, venta máxima, venta mínima y suma.
        La función de agregado de estos tres últimos campos se aplicarán sobre importe_total de cada venta.
        Orden: suma de ventas totales
        Notas: se precisa agrupación registros */

SELECT 
    clientes.id,
    clientes.nombre AS Cliente,
    COUNT(*) AS Núm_Ventas,
    MAX(ventas.importe_total) AS Venta_max,
    MIN(ventas.importe_total) AS Venta_Min,
    SUM(ventas.importe_total) AS Suma_TotalVentas
FROM
    clientes
        INNER JOIN
    ventas ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = 2014
GROUP BY ventas.cliente_id
ORDER BY Suma_TotalVentas;




/*
8. Script - ventas de editoriales
Se desea obtener el volumen total de ventas por Editorial
        Tabla principal: ventas, lineasventas, libros y editoriales
        Condición:  todas las editoriales
        Columnas: id de la editorial, nombre de la editorial,
        Número de libros vendidos y importe total vendido de libros de esa editorial
        Orden: suma de ventas totales descendente
        Notas: se precisa agrupación registros  */
        

        


        
/*        


9. View - ventas editoriales

Obtener una vista llamada ventas_editoriales a partir del script anterior.
Usando la vista creada se pide: 

        Obtener aquellas editoriales que hayan conseguido vender más de 50 libros.

10. Insertar - Libros

Insertar un libro con datos válidos en la tabla libros a partir de los siguientes requisitos:

        El autor del libro es Gabriel García Márquez
        La editorial es Alfaguara
        El ISBN es '9788448180833'
        El EAN es '9788888199586'
        Inventar resto de datos

11. Insertar - Libros_Temas

Insertar los registros adecuados en la tabla Libros_temas, teniendo en cuenta que el libro anterior es novela, ciencia y astronomía

12. Insertar - Líneas Ventas y Ventas

        Insertar un registro con datos válidos en la tabla ventas.
        Insertar 3 registros en la tabla lineasventas con datos válidos relacionados con la venta anterior.

13. Update - Libros

Debido al incremento de costes y nuevas tasas impositivas se desea subir el precio de los libros de la editorial Anaya en un 10%.

14. Update - Libros

Se desea reducir el precio de los libros que no se vendieron en 2014 en un 30%.

15. Delete - Libros

Se desea eliminar definitivamente todos los libros que contengan la temática belleza, ya que se han quedado obsoletos