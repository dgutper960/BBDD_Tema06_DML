-- Actividad 6.04
-- Tema 6 - DML
-- Curso 1DAW
-- Fecha 31/01/23

USE geslibros;

# 1. INSERT (insertar registros)

-- Insertar en la tabla ventas el siguiente registro
insert into ventas set
id = 11,
cliente_id = 6,
fecha = now(),
importe_bruto = 289.50,
importe_iva = 60.80,
importe_total = 350.30;

-- Insertar en la tabla lineasventas los siguientes registros
-- Línea 1 de la venta 11
insert into lineasventas set
id = 38,
venta_id = 11,
numero_linea = 1,
libro_id = 11,
iva = 0.21,
cantidad = 5,
precio = 30.00,
importe = 150;

-- Línea 2 de la venta 11
insert into lineasventas set
id = 39,
venta_id = 11,
numero_linea = 2,
libro_id = 12,
iva = 0.21,
cantidad = 10,
precio = 13.00,
importe = 130;

-- Línea 3 de la venta 12
insert into lineasventas set
id = 40,
venta_id = 11,
numero_linea = 3,
libro_id = 15,
iva = 0.21,
cantidad = 1,
precio = 9.50,
importe = 9.50;

# 2. UPDATE 
-- Realizar las siguientes actualizaciones de registros
-- Actualizar la dirección del cliente cuyo NIF es 23124234G a Pollígono Ansu Fati, Calle Messi, Nave 20.
update clientes set direccion = 'Pollígono Ansu Fati, Calle Messi, Nave 20' where nif = '23124234G';

-- Al escritor Osaar Wilde hay que añadirle también el premio planeta
update autores set premios = concat_ws(', ', premios, 'planeta')  where nombre = 'Oscar Wilde';

-- Se decrementa el precio de venta de todos los libros en un 10%
update libros set precio_venta = precio * 0.90; -- precio - (precio*0.10)

-- Incrementa precio de todos los libros de las editoriales Alfaguara y Anaya en un 10%
update libros set precio_venta = precio + (precio*0.10) where editorial = 'Alfaguara' and 'Anaya';




/* 

Realizar las siguientes actualizaciones de registros. 

Se desea 
Al escritor Osaar Wilde hay que añadirle también el premio planeta
Se decrementa el precio de venta de todos los libros en un 10%
Debido a una serie de impuestos se incrementa el precio de costo de todos los libros de las editoriales Alfaguara y Anaya en un 10%
Todos los libros editados antes del año 2000 se les descuenta 2 € del precio de venta
3. DELETE (Eliminar registros)

Se desea eliminar la editorial Alfaguara, pero antes es necesario eliminar todos los libros de dicha editorial y a continuación eliminar la editorial Alfaguara 