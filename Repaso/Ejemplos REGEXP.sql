# Ejemplos con RLIKE y expresiones regulares
# Tema 6. Lenguaje SQL - DML

# Ejemplo 1
USE maratoon;

# Muestra los corredores que contengan en el nombre Juan, Eva o Josefa
SELECT * FROM corredores WHERE nombre REGEXP 'Juan|Eva|Josefa';

# Muestra los corredores que contengan una J, 'ua' indefinidas veces y contenga una n
SELECT * FROM corredores WHERE nombre REGEXP 'J[ua]*n';

# Muestra aquellos corredores que el nombre empiece por J
SELECT * FROM corredores WHERE nombre REGEXP '^J';

# Muestra aquellos corredores que el nombre empiece por Jo
SELECT * FROM corredores WHERE nombre REGEXP '^Jo';

# Muestra aquellos corredores que el nombre empiece por J o por E
SELECT * FROM corredores WHERE nombre REGEXP '^J|^E';

# Muestra aquellos corredores que en el apellido termine en "ez"
SELECT * FROM corredores WHERE apellidos REGEXP 'ez$';

# Muestra aquellos corredores cuyo apellido empiece por F y termine por EZ
SELECT * FROM corredores WHERE apellidos REGEXP '^F.*ez$';

# Muestra aquellos apellidos que contengan García
SELECT * FROM corredores WHERE apellidos REGEXP 'García';

# Muestra aquellos corredores cuyos apellidos empiecen por García
SELECT * FROM corredores WHERE apellidos REGEXP 'García.';

# Muestra aquellos corredores cuyos nombre contengan a o u
SELECT * FROM corredores WHERE nombre REGEXP '[au]';

# Muestra aquellos corredores cuyos nombre contengan a o u, pero que empiecen por E
SELECT * FROM corredores WHERE nombre REGEXP '^E[au]*';

# Muestra aquellos corredores cuyos nombre empiecen por una letra mayuscula
SELECT * FROM corredores WHERE nombre REGEXP BINARY '^[A-Z]';

# PATRON OCHO PRIMEROS CARACTERES NUMERICOS, Y EL ULTIMO UNA LETRA MAYUSCULA (DNI)
# REGEXP '^[0-9]*[A-Z]$'
SELECT '54564539x' REGEXP BINARY '^[0-9]{7,8}[A-Za-z]$';

# Patron que valide una matrícula (Ejemplo: 1234HJR)
SELECT '1234HJR' REGEXP BINARY '^[0-9]{4}[A-Z]{3}$';

# Patron que valide una matrícula, y que no contenga vocales (Ejemplo: 1234HJR)
SELECT '1234HJR' REGEXP BINARY '^[0-9]{4}[BCDFGHJKLMNÑPQRSTVWXYZ]{3}$';

# Patron que valide una contraseña de mínimo 8 caracteres
SELECT 'Ram7rg45' REGEXP BINARY '.{8,}';

# Patron que valide una contraseña de mínimo 8 caracteres y al menos una Mayuscula
SELECT 'dijasdfdDd3' REGEXP BINARY '^(?=.*[A-Z]).{8,15}';





