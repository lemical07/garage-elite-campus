USE garage_elite_campus; 

INSERT INTO clientes (nombre, apellido, telefono, email, estado) 
VALUES 
    ('Carlos', 'Mendoza', '999111222', 'carlos.mendoza@email.com', 'activo'), 
    ('Ana', 'Rojas', '999222333', 'ana.rojas@email.com', 'activo'), 
    ('Luis', 'Pérez', '999333444', 'luis.perez@email.com', 'activo'), 
    ('María', 'García', '999444555', 'maria.garcia@email.com', 'inactivo'), 
    ('Jorge', 'López', '999555666', 'jorge.lopez@email.com', 'activo'); 

INSERT INTO vehiculos (id_cliente, tipo_vehiculo, marca, modelo, placa, color, anio) 
VALUES 
    (1, 'Sedán', 'Toyota', 'Corolla', 'ABC123', 'Blanco', 2020), 
    (1, 'SUV', 'Honda', 'CR-V', 'ABC124', 'Negro', 2021), 
    (2, 'Pickup', 'Ford', 'Ranger', 'ABC125', 'Azul', 2019), 
    (2, 'Sedán', 'Nissan', 'Sentra', 'ABC126', 'Gris', 2018), 
    (3, 'Moto', 'Yamaha', 'FZ', 'ABC127', 'Rojo', 2022), 
    (3, 'SUV', 'Chevrolet', 'Trailblazer', 'ABC128', 'Blanco', 2020), 
    (4, 'Sedán', 'Kia', 'Cerato', 'ABC129', 'Plata', 2017), 
    (4, 'Pickup', 'Toyota', 'Hilux', 'ABC130', 'Verde', 2021), 
    (5, 'Hatchback', 'Mazda', '2', 'ABC131', 'Negro', 2016), 
    (5, 'Sedán', 'Hyundai', 'Elantra', 'ABC132', 'Azul', 2023); 

INSERT INTO mecanicos (nombre, apellido, especialidad, telefono, email, estado) 
VALUES 
    ('Pedro', 'Sánchez', 'Mecánica general', '988111222', 'pedro.sanchez@email.com', 'activo'), 
    ('Rosa', 'Díaz', 'Electricidad automotriz', '988222333', 'rosa.diaz@email.com', 'activo'), 
    ('Miguel', 'Torres', 'Diagnóstico computarizado', '988333444', 'miguel.torres@email.com', 'activo'), 
    ('Elena', 'Castro', 'Alineación y suspensión', '988444555', 'elena.castro@email.com', 'inactivo'); 

INSERT INTO servicios (nombre_servicio, categoria, duracion_min, descripcion, precio_base) 
VALUES 
    ('Cambio de aceite', 'Mantenimiento', 45, 'Cambio de aceite y filtro', 80.00), 
    ('Revisión de frenos', 'Seguridad', 60, 'Inspección y cambio de pastillas', 120.00), 
    ('Alineación y balanceo', 'Suspensión', 50, 'Alineación de ruedas y balanceo', 90.00), 
    ('Diagnóstico electrónico', 'Diagnóstico', 40, 'Revisión de fallas del sistema', 100.00),
    ('Cambio de batería', 'Eléctrico', 30, 'Instalación de batería nueva', 150.00); 

INSERT INTO citas_servicio (id_vehiculo, id_mecanico, id_servicio, fecha_cita, estado_cita, precio_final, notas) 
VALUES 
    (1, 1, 1, '2026-08-10 09:00:00', 'cancelada', 80.00, 'Cliente solicita revisión rápida'), 
    (2, 2, 2, '2026-08-10 10:30:00', 'en_proceso', 140.00, 'Frenos delanteros'),
    (3, 3, 4, '2026-08-11 11:00:00', 'pendiente', 100.00, 'Error en motor'),
    (4, 1, 3, '2026-08-11 13:00:00', 'completada', 90.00, 'Alineación realizada'),
    (5, 4, 5, '2026-08-12 08:30:00', 'completada', 150.00, 'Batería nueva'),
    (6, 2, 2, '2026-08-12 14:00:00', 'pendiente', 130.00, 'Cambio de pastillas'),
    (7, 3, 1, '2026-08-13 09:30:00', 'en_proceso', 80.00, 'Aceite cambiado'),
    (8, 1, 4, '2026-08-13 15:00:00', 'pendiente', 110.00, 'Diagnóstico general'),
    (9, 4, 3, '2026-08-14 10:00:00', 'cancelada', 95.00, 'Alineación previa'),
    (10, 2, 5, '2026-08-14 16:30:00', 'completada', 160.00, 'Batería instalada'),
    (1, 3, 2, '2026-08-15 09:00:00', 'pendiente', 120.00, 'Revisión de frenos traseros'),
    (2, 1, 1, '2026-08-15 11:00:00', 'completada', 80.00, 'Mantenimiento programado'),
    (3, 4, 5, '2026-08-16 08:30:00', 'pendiente', 155.00, 'Batería agotada'),
    (4, 2, 4, '2026-08-16 10:00:00', 'en_proceso', 105.00, 'Falla intermitente'),
    (5, 1, 2, '2026-08-17 09:30:00', 'completada', 125.00, 'Frenos revisados post carrera'),
    (6, 3, 3, '2026-08-17 13:00:00', 'pendiente', 90.00, 'Vibración en volante'),
    (7, 4, 4, '2026-08-18 10:30:00', 'cancelada', 100.00, 'Cliente reprogramará'),
    (8, 2, 1, '2026-08-18 15:00:00', 'completada', 80.00, 'Cambio de aceite sintético'),
    (9, 1, 5, '2026-08-19 08:00:00', 'en_proceso', 150.00, 'Batería en instalación'),
    (10, 3, 2, '2026-08-19 14:30:00', 'pendiente', 130.00, 'Pastillas delanteras y traseras');