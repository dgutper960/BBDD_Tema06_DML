-- Actividad 6.13
-- Tema 6 - DML
-- Curso 1DAW
-- Autor: David gutiérrez Pérez
-- Fecha 05/03/23


use geslibros;

/*
1. Script - libros 
Mostrar todos los libros ordenados por id donde se muestre entre otros detalles el nombre del autor.
        Tabla principal: libros
        Condición: todos los libros
        Columnas: id, titulo, nombre del autor, fechaedicion, unidades (stock), precio_coste, precio_venta
        Orden: id  */
        
SELECT 
    libros.id,
    libros.titulo,
    autores.nombre AS Autor,
    libros.fecha_edicion,
    libros.stock AS Unidades,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
ORDER BY libros.id;
        

        
/*
2. Script - libros 
Mostrar todos los libros ordenados por id donde se muestre entre otros detalles el nombre del autor y el nombre de la editorial.
        Tabla principal: libros
        Condición: todos los libros
        Columnas: id, titulo, nombre del autor, nombre de la editorial, fechaedicion, unidades (stock), precio_coste, precio_venta
        Orden: id */

SELECT 
    libros.id,
    libros.titulo,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.fecha_edicion,
    libros.stock AS Unidades,
    libros.precio_coste,
    libros.precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
ORDER BY libros.id;
        
/*
3. Script - ventas
Mostrar los detalles de la ventas en las que el importe total sea superior 500 €.
Las ventas han de mostrar el nombre del cliente.
        Tabla principal: ventas
        Condición: importe total superior a 500 €
        Columnas: id, nombre cliente, fecha, importe_bruto, importe_iva, importe_total
        Orden: id */
        
SELECT 
    ventas.id,
    clientes.nombre AS Cliente,
    ventas.fecha,
    ventas.importe_bruto,
    ventas.importe_iva,
    ventas.importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    ventas.importe_total > 500
ORDER BY ventas.id;
        
        
/*
4. Script - ventas
Mostrar de cada cliente el importe total de ventas.
        Tabla principal: ventas y clientes
        Condición: todas las ventas
        Columnas: id (cliente), nombre_cliente, importe total de las ventas realizadas
        Orden: suma importe total */
        
SELECT 
    ventas.id,
    clientes.nombre AS Cliente,
    ventas.importe_total,
    SUM(ventas.importe_total) SumaTotalImportes
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
GROUP BY ventas.cliente_id
ORDER BY SumaTotalImportes;

