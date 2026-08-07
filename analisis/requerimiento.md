# Análisis de Requerimiento — Garage Elite Campus 

 

## Entidades detectadas 

```` 

- entidad: vehiculos 

depende de: clientes 

 

```` 

--- 

 

```` 

- entidad: citas_servicio 

depende de: vehiculo, servicio, mecanico 

 

```` 

--- 

```` 

- entidad: clientes 

Sin dependencias 

 

```` 

--- 

```` 

- entidad: mecánicos 

Sin dependencias 

 

```` 

--- 

```` 

- entidad: servicios 

Sin dependencias 

 

```` 

--- 

 

## Relaciones 

- clientes 1:n vehículos 

- vehículos 1:n citas_servicio 

- mecánicos 1:n citas_servicio 

- servicios 1:n citas_servicio 

 

 

## Reglas de negocio 

- Registrar clientes, sus vehiculos y las citas de servicio.  

- Cada cita debe indicar el tipo de servicio, mecanico asignado, precio estimado, fecha programada y estado.  

- Crear citas, consultar citas, actualizar datos de una cita y cancelar una cita sin borrar el historial importante. 

 

## Supuestos 

 

- Un cliente puede tener 0 vehículos registrados — el enunciado no obliga a asociar vehículo al crear cliente. 

 

- Un mecánico inactivo no se le puede asignar una cita antigua. 

 

- El precio final debe de ser distinto al precio_base del catálogo si se registran cambios o adiciones al servicios, en caso contrario no es necesario. 

 

- Dos citas programadas para la misma fecha y para el mismo mecánico no se valida. 