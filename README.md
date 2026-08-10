# Garage Elite Campus — CRUD con Procedimientos Almacenados

## Descripción
Sistema de gestión de citas de mantenimiento para un taller especializado en motos de alto cilindraje, autos de lujo e hiperdeportivos. Permite registrar clientes, vehículos, mecánicos, servicios y citas, con operaciones CRUD implementadas mediante procedimientos almacenados en MySQL.

## Cómo ejecutar
Ejecutar en este orden desde MySQL Workbench o cliente MySQL:

1. `ddl/schema.sql` — crea la base de datos y las 5 tablas
2. `dml/inserts.sql` — carga datos de prueba (5 clientes, 10 vehículos, 4 mecánicos, 5 servicios, 20 citas)
3. `procedures/crud_citas.sql` — crea los 5 procedimientos almacenados
4. `dql/consultas.sql` — consultas de reporte (ejecutar individualmente según necesidad)

Las pruebas ejecutadas con `CALL` y sus resultados están documentadas en `evidencias/resultados.md`.

## Estructura de tablas
- `clientes` — personas que solicitan servicios
- `vehiculos` — motos, autos de lujo o hiperdeportivos (FK a clientes)
- `mecanicos` — personal técnico del taller
- `servicios` — catálogo de servicios ofrecidos
- `citas_servicio` — reservas y estado del trabajo (FK a vehiculos, mecanicos, servicios)

## Procedimientos almacenados
| Procedimiento | Función |
|---|---|
| `sp_crear_cita_servicio` | Crea una cita nueva en estado `pendiente`, valida existencia de vehículo/mecánico/servicio, mecánico activo y precio no negativo |
| `sp_listar_citas_servicio` | Lista citas con filtro opcional por estado (NULL = todas) |
| `sp_actualizar_cita_servicio` | Actualiza mecánico, fecha, estado, precio y notas; bloquea citas canceladas |
| `sp_cancelar_cita_servicio` | Cambia estado a `cancelada` (borrado lógico), agrega motivo a notas |
| `sp_eliminar_cita_borrador` | Borra físicamente solo citas en estado `pendiente` |

## Decisiones y supuestos
- Un cliente puede tener 0 vehículos registrados.
- Un mecánico inactivo no puede ser asignado a nuevas citas.
- Dos citas para el mismo mecánico en la misma fecha no se validan (no hay control de solapamiento de horario).
- `sp_eliminar_cita_borrador` rechaza cualquier estado distinto a `pendiente`, incluyendo `cancelada` — confirmado en pruebas de evidencia.
- Estados permitidos: `pendiente`, `en_proceso`, `completada`, `cancelada`.