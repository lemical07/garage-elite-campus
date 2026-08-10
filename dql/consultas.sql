-- citas pendientes ordenadas por fecha más cercana
SELECT
    cs.id_cita,
    c.nombre AS nombre_cliente,
    m.nombre AS nombre_mecanico,
    ns.nombre_servicio AS servicio,
    cs.fecha_cita,
    cs.precio_final
FROM citas_servicio cs
JOIN vehiculos tv ON cs.id_vehiculo = tv.id_vehiculo
JOIN clientes c ON tv.id_cliente = c.id_cliente
JOIN mecanicos m ON cs.id_mecanico = m.id_mecanico
JOIN servicios ns ON cs.id_servicio = ns.id_servicio
WHERE cs.estado_cita = 'pendiente'
ORDER BY cs.fecha_cita ASC;
