USE garage_elite_campus;

DELIMITER //
CREATE PROCEDURE sp_crear_cita_servicio(
IN p_id_vehiculo INT,
IN p_id_mecanico INT,
IN p_id_servicio INT,
IN p_fecha_cita DATETIME,
IN p_precio_final DECIMAL(10,2),
IN p_notas VARCHAR(255),
OUT p_cita_id INT
)

BEGIN
    DECLARE vehiculo_existe INT;
    DECLARE mecanico_existe INT;
    DECLARE servicio_existe INT;
    DECLARE estado_mecanico VARCHAR(20);

    SELECT COUNT(*) INTO vehiculo_existe FROM vehiculos WHERE id_vehiculo = p_id_vehiculo;
    SELECT COUNT(*) INTO mecanico_existe FROM mecanicos WHERE id_mecanico = p_id_mecanico;
    SELECT COUNT(*) INTO servicio_existe FROM servicios WHERE id_servicio = p_id_servicio;
    SELECT estado INTO estado_mecanico FROM mecanicos WHERE id_mecanico = p_id_mecanico;

    IF vehiculo_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El vehículo especificado no existe';
    END IF;
    
    IF mecanico_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El mecánico especificado no existe';
    END IF;

    IF servicio_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio especificado no existe';
    END IF;
    IF p_precio_final < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'El precio final no puede ser negativo';
    END IF;
    IF estado_mecanico != 'activo' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El mecánico especificado no está activo';
    END IF;

    INSERT INTO citas_servicio (id_vehiculo, id_mecanico, id_servicio, fecha_cita, estado_cita, precio_final, notas)
    VALUES 
    (p_id_vehiculo, p_id_mecanico, p_id_servicio, p_fecha_cita, 'pendiente', p_precio_final, p_notas);

    SET p_cita_id = LAST_INSERT_ID();
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE sp_listar_citas_servicio(
    IN p_estado VARCHAR(20)
)
BEGIN
    SELECT
        cs.id_cita,
        c.nombre AS nombre_cliente,
        m.nombre AS nombre_mecanico,
        tv.tipo_vehiculo AS categoria,
        ns.nombre_servicio AS operacion,
        cs.fecha_cita AS fecha,
        cs.estado_cita AS etapa_cita,
        cs.precio_final AS pago_total,
        cs.notas AS detalles


    FROM citas_servicio cs
    JOIN vehiculos tv ON cs.id_vehiculo = tv.id_vehiculo
    JOIN clientes c ON tv.id_cliente = c.id_cliente
    JOIN mecanicos m ON cs.id_mecanico = m.id_mecanico
    JOIN servicios ns ON cs.id_servicio = ns.id_servicio

    WHERE (cs.estado_cita = p_estado OR p_estado IS NULL);
END //
DELIMITER ;
