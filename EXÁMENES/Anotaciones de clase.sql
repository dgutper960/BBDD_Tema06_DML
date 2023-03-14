-- APUNTES
-- CREACIÓN DE USUARIOS
-- GESTIÓN PERMISOS USUARIOS

# CREAMOS UN USUARIO
create user david@localhost; -- este usuario no tendrá nungún privilegio
-- HABRÁ QUE CREAR UNA ENTRADA AL USUARIO DESDE EL INICIO DE MYSQL con la pestaña de +


# BORRAMOS UN USUARIO
DROP USER david@localhost;

# CREAMOS UN USUARIO CON CONTRASEÑA LITERAL
CREATE USER david@localhost IDENTIFIED BY '123456'; -- > esta contraseña aparece en la tabla encriptada
-- NUNCA DE DEBERÁ HACER DE ESTA MANERA POR TEMAS DE SEGURIDAD

# ESTE USUARIO SE BORRA IGUALMENTE
DROP USER david@localhost;

# CREAMOS UN USUARIO CON LA CONTRAQSEÑA ENCRIPTADA
-- Entramos en otra pestaña y ponemos --> select password(PasswordLiteral);
CREATE USER david@localhost IDENTIFIED BY password '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
-- copiamos y pegamos el hash
-- Aunque de fallo funciona
-- Luego entramos poniendo la contraseña literal

# ESTE USUARIO SE BORRA IGUALMENTE
DROP USER david@localhost;


# creamos un usuario con todos los privilegios a nivel de todas las base de datos
GRANT USAGE ON *.* TO david@localhost IDENTIFIED BY PASSWORD 
'*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9';
-- este error es porque estamos asignando privilegios a un usuario que no existe 
-- y le estamos poniendo contraseña

# Eliminamos 
DROP USER david@localhost;


# creamos un usuario con todos los privilegios a nivel de una base de datos
GRANT all privileges on futbol to david@localhost;


# Damos privilegios a un ususario a nivel tabla
grant all privileges on gesbank.clientes to david@localhost;
-- Asigna privilegios todos los privilegios en tabla clientes de gesbank

grant select, update on gesbank.clientes to david@localhost;
-- Asigna privilegios para select y editar en tabla clientes de gesbank


# Privilegios a nivel columna
grant select(id, nombre) on gesbank.clientes to david@localhost;

## PARA ASIGNAR PERMISOS A DIFERENTES TABLAS HAY QUE HACERLO POR SEPARADO
GRANT SELECT ON ventas.cliente_id TO david;
GRANT SELECT ON clientes.id TO david;





