-- Ejemplo Subconsulta


# Corredores cuya edad supere la edad de TODOS los corredores de Villamartin
select * from corredores where edad > all  -- > debemos poner all porque la subconsulta devuelve más de un valor
(select edad from corredores where ciudad= 'Villamartin');


# Tambien podemos quitar el all añadiendo un max a la subconsulta por lo que se devolvera sólo un valor
select * from corredores where edad > (select max(edad) from corredores where ciudad= 'Villamartin');

# Corredores cuya edad sea mayor a la de un solo corredor de villamartin
select * from corredores where edad > any  -- > Corredores que superen en edad a tan solo uno de Villamartin
(select edad from corredores where ciudad= 'Villamartin');

select * from corredores where edad > any  -- > Corredores que superen en edad a tan solo uno de Villamartin
(select edad from corredores where ciudad= 'Villamartin');

-- IN
# Para que devuelva corredores que coincidan en edad con corredores de Arcos (operador IN)
select * from corredores where edad in  -- > Corredores que superen en edad a tan solo uno de Villamartin
(select edad from corredores where ciudad= 'Arcos');


# OPERADOR IN
# Empleados que han trabajado en algun proyecto
select * from empleados where id in (select empleado_id from empleados_proyectos);

# OPERADOR NOT EXISTS
select * from clubs where not exists (select * from corredores where clubs.id=corredores.clubs_id);

# El ejemplo anterior pero con empleados que no hayan trabajado en  ningun proyecto
select * from empleados where not exists (select * from empleados_proyectos where proyectos.id=empleados_proyectos.proyecto_id);


