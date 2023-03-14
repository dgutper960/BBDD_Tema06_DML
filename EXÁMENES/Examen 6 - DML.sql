-- Examen BDD
-- Tema 6 - DML
-- David Gutiérrez Pérez

use geslibros;

/*
1. Script - autores
Mostrar aquellos autores hayan conseguido el premio Cervantes y que hayan nacido antes del año 1980
Tablas: autores
Condición: nacidos antes de 1980 y hayan conseguido el premio Cervantes.
Columnas: id, nombre, nacionalidad, email, fecha_nac, Premios
Orden:  id. */

SELECT 
    id,
    nombre, 
    nacionalidad,
    email, 
    fecha_nac, 
    premios
FROM
    autores
WHERE
    YEAR(fecha_nac) < '1980'
        AND premios LIKE 'Cervantes'
ORDER BY id;


/*
2. Script - ventas clientes de Ubrique
Mostrar todas las ventas registradas a clientes de Ubrique en el 2014
Tablas: ventas, clientes
Condición: ventas del 2014 y a clientes de la población de Ubrique
Columnas: id, nombre cliente, población del cliente, fecha de la venta, importe_bruto, importe_iva e importe_total
Orden: por importe de mayor a menor.
Observaciones: se debe usar el operador IN */

SELECT 
    ventas.id AS idVenta,
    clientes.nombre AS Cliente,
    clientes.poblacion,
    ventas.fecha,
    ventas.importe_bruto,
    ventas.importe_iva,
    ventas.importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    clientes.poblacion = 'Ubrique'
ORDER BY ventas.importe_total DESC;


/*
3. Script - libros
Mostrar detalles de todos los libros de las editoriales 
Alfaguara, Anaya y MCGRAWHILL, editados entre 2010 y 2020 cuyo precio de venta sea inferior a 40 €
Tablas: libros, autores, editoriales
Condición: editorial Alfaguara, Anaya y MCGRAWHILL; editados en 2010 y 2020 y  precio de venta sea inferior a 40 €
Columnas: id, título, autor (nombre), editorial (nombre), fecha_edicion, stock, precio_coste, precio_venta
Orden: id libro  */

SELECT 
    libros.id AS idLibro,
    libros.titulo,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.fecha_edicion,
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
    editoriales.nombre IN ('Alfaguara' , 'Anaya', 'MCGRAWHILL')
        AND YEAR(libros.fecha_edicion) BETWEEN '2010' AND '2020'
        AND libros.precio_venta < 40
ORDER BY libros.id;


/*
4. Script - libros
Mostrar detalles de los libros que se encuentran en stock adecuado, es decir,
ue su nivel de stock esté comprendido entre el stock mínimo y el stock máximo.
Además de los detalles propios del libro deberá mostrar en una columna calculada el Valor_Almacen
resultante de multiplicar el stock * precio_coste
Tabla principal: libros, autores, editoriales
Condición: nivel de stock esté comprendido entre stock mínimo y stock máximo 
Columnas: id, título, autor, editorial, stock, stock_min, stock_maxi, precio_coste, precio_venta, valor_almacen 
Orden: valor almacén de mayor a menor  */

SELECT 
    libros.id AS idLibro,
    libros.titulo,
    autores.nombre AS Autor,
    editoriales.nombre AS Editorial,
    libros.fecha_edicion,
    libros.stock,
    libros.precio_coste,
    libros.precio_venta,
    (libros.stock * libros.precio_coste) AS valor_almacen
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    libros.stock BETWEEN stock_min AND stock_max
ORDER BY valor_almacen DESC;


/*
5. Estadística de libros Alfaguara
Se dese saber el número de libros, el precio medio, precio máximo, 
precio min, stock medio, stock máximo, stock min, stock acumulado de los libros de la editorial MACGRAWHILL.
Tablas: libros y editoriales
Condición: editorial MACGRAWHILL
Columnas: número de libros, el precio medio, precio máximo, precio min, stock medio, stock máximo, stock min, 
stock acumulado
Orden: número de unidades desc
Observaciones: este script no precisa agrupación de registros.  */

SELECT 
    COUNT(*) AS Libros,
    AVG(libros.precio_venta) AS Precio_Medio,
    MAX(libros.precio_venta) AS Precio_Max,
    MIN(libros.precio_venta) AS Precio_Min,
    AVG(libros.stock) AS Stock_Medio,
    MAX(libros.stock) AS Stock_Max,
    MIN(libros.stock) AS Stock_Min,
    SUM(libros.stock) AS Stock_Acumulado
FROM
    libros
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    editoriales.nombre = 'MCGRAWHILL';


/*
6. Script - autores
Mostrar detalles autores mas jóvenes que Oscar Wilde que hayan conseguido el premio Nobel.
Tabla principal: autores
Condición: después que Oscar Wilde y que hayan conseguido el premio Nobel.
Columnas: id, nombre, nacionalidad, email, fecha_nac, Premios
Orden: fecha de nacimiento, primero el más antiguo
Nota: se precisa el uso de una subconsulta */

SELECT 
    *
FROM
    autores
WHERE
    autores.premios LIKE '%Nobel%'
        AND fecha_nac > (SELECT 
            fecha_nac
        FROM
            autores
        WHERE
            nombre = 'Oscar Wilde');


/*
7. Ventas 2010 al 2020
Mostrar las ventas realizadas entre 2010 y 2020, cuyo importe total sea superior a 1.500 €. 
Ordenadas por importe total con criterio descendente
Tablas: ventas, clientes
Condición: entre 2010 y 2020; importe total superior a 1.500 €
Columnas: id venta, nombre cliente, fecha, importe_bruto, importe_iva, importe_total
Orden: importe total con criterio descencente  */

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
    YEAR(ventas.fecha) BETWEEN '2010' AND '2020'
        AND ventas.importe_total > 1500
ORDER BY ventas.importe_total DESC;


/*
8. Script - ventas clientes 
Mostrar todas las ventas registradas a los clientes  de la provincia de Cádiz. 
Tablas: ventas, clientes, provincias
Condición: clientes de la provincia de cádiz 
Columnas: id, cliente (nombre), población (cliente), provincia (provincias), fecha de la venta, importe_bruto,
 importe_iva e importe_total
Orden: por importe de mayor a menor.   */

SELECT 
    ventas.id AS idVenta,
    clientes.nombre AS Cliente,
    clientes.poblacion,
    provincias.provincia,
    ventas.fecha,
    ventas.importe_bruto,
    ventas.importe_iva,
    ventas.importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
        INNER JOIN
    provincias ON clientes.provincia_id = provincias.id
WHERE
    clientes.provincia_id = (SELECT 
            id
        FROM
            provincias
        WHERE
            provincia = 'Cádiz')
ORDER BY ventas.importe_total DESC;


/*
9. Script - ventas por clientes
Se desea obtener el volumen total de ventas realizadas en 2014 por cliente
Tabla principal: ventas y clientes
Condición: sólo las ventas 2014
Columnas: id de cliente, nombre del cliente, numero de ventas, suma - importe bruto, suma
- importe iva, suma - importe total 
Orden: importe total de mayor a menor
Notas: se precisa agrupación registros */

SELECT 
    clientes.id,
    clientes.nombre AS Cliente,
    COUNT(*) AS Num_Ventas,
    SUM(ventas.importe_bruto) AS Suma_Importe_Bruto,
    SUM(ventas.importe_iva) AS Suma_Importe_Iva,
    SUM(ventas.importe_total) AS Suma_Importe_Total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
WHERE
    YEAR(ventas.fecha) = '2014'
GROUP BY ventas.cliente_id
ORDER BY ventas.importe_total DESC;


/*
10. Script - ventas por autor
Se desea obtener un estudio estadístico sobre las ventas de libros autor. 
Tablas necesarias: lineasventas, libros y autores
Condición:  todos los autores
Columnas: id autor, nombre autor, nacionalidad autor, unidades vendidas (acumulado campo unidades de lineasventas),
importe ventas totales (acumulado campo importe de lineasventas)
Orden: importe ventas totales descendente
Notas: se precisa agrupación registros  */

SELECT 
    autores.id,
    autores.nombre,
    autores.nacionalidad,
    SUM(lineasventas.cantidad) AS Unidades_Vendidas,
    SUM(lineasventas.importe) AS Importe_Ventas_Totales
FROM
    lineasventas
        INNER JOIN
    libros ON lineasventas.libro_id = libros.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
GROUP BY autores.id
ORDER BY Importe_Ventas_Totales DESC;


/*
11. View - ventas por autor.
Obtener una vista llamada ventas_por_autor a partir del script anterior.
Usando la vista creada se pide: 
11. 2 Obtener aquellas autores que hayan conseguido vender más libros que Federico García Lorca
11.3 Mostrar aquellos autores que hayan vendido un importe total superior al de Pablo Neruda */


create or replace view ventas_por_autor as 
SELECT 
    autores.id,
    autores.nombre,
    autores.nacionalidad,
    SUM(lineasventas.cantidad) AS Unidades_Vendidas,
    SUM(lineasventas.importe) AS Importe_Ventas_Totales
FROM
    lineasventas
        INNER JOIN
    libros ON lineasventas.libro_id = libros.id
        INNER JOIN
    autores ON libros.autor_id = autores.id
GROUP BY autores.id
ORDER BY Importe_Ventas_Totales DESC;
/*
select * from ventas_por_autor where Unidades_Vendidas > 
(select sum(lineasventas.cantidad) from lineasventas  ) */


/*
12. Insertar - Autor
Busca los datos en Internet y añade un autor a la tabla correspondiente con datos válidos. */

insert into autores values(
null,
'Juanelo',
'Estonia',
'juanelodeestonia@granmail.com',
'1999-02-23',
null,
'Nobel',
default,
default
);


/*
13. Insertar - Libros
Inserta dos libros con datos válidos del autor anterior. Los libros serán editados por la editorial Santillana.
El resto de datos serán establecidos a vuestro criterio. */

insert into libros values(
null,
4569632584569,
1236523696325,
'Canticas de Mosto con Moscas',
7,
7,
15.05,
35.00,
41,
1,
5000,
2022-02-24,
default,
default
);

/*
14. Insertar libros_temas
Insertar los registros adecuados en la tabla libros_temas, 
para reflejar al menos 2 temas a cada uno de los libros anteriores.  */

insert into libros_temas values(
20,
3,
default,
default
);


/*
15. Insertar - Líneas Ventas y Ventas

Insertar un registro con datos válidos en la tabla ventas.
Insertar 3 registros en la tabla lineasventas con datos válidos relacionados con la venta anterior.
Asignar la venta al cliente de id = 9.
Los importes bruto, importe iva e importe total deben coincidir con los valores asignados a los 3 registros de lineasventas.


/*
16. Update - Libros
Se desea reducir el precio de los libros en un 10%, 
pero sólo aquellos de la editorial MCGRAWHILL cuyo nivel de stock está por encima de las 10 unidades. */

# update libros set precio_venta = precio_venta - precio_venta * 10 where 


/*
17. Update - Libros
Se desea incrementar el stock en 20 unidades a todos los libros vendidos en 2014. */

UPDATE libros 
SET 
    stock = stock + 20
WHERE
    id IN (SELECT distinct
            lineasventas.libro_id
        FROM
            lineasventas
                INNER JOIN
            ventas ON lineasventas.venta_id = ventas.id
        WHERE
            YEAR(ventas.fecha) = 2014);


/*
18. Delete - Libros
Se desea eliminar definitivamente todos los libros no vendidos */

delete from libros WHERE
    id all (SELECT
            lineasventas.libro_id
        FROM
            lineasventas;