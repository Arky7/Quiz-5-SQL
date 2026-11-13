USE miautopuntocom;


INSERT INTO vehiculos (marca, modelo, anio, color, precio, vin, tipo, estado) VALUES
('Toyota',  'Corolla',  2026, 'Blanco',  24500.00, 'JTDBR32E260123451', 'Sedan',     'Nuevo'),
('Toyota',  'RAV4',     2025, 'Gris',    34900.00, '2T3W1RFV5SC012346', 'SUV',       'Nuevo'),
('Toyota',  'Hilux',    2021, 'Negro',   31000.00, 'MR0HA3CD7M0123457', 'Pickup',    'Usado'),
('Hyundai', 'Tucson',   2024, 'Azul',    29800.00, 'KM8J33A49RU123458', 'SUV',       'Nuevo'),
('Hyundai', 'Accent',   2019, 'Rojo',    11500.00, 'KMHCT4AE3KU123459', 'Sedan',     'Usado'),
('Nissan',  'Frontier', 2022, 'Plata',   27500.00, '1N6ED1EK0NN123460', 'Pickup',    'Usado'),
('Nissan',  'Kicks',    2026, 'Naranja', 22300.00, '3N1CP5DV1TL123461', 'SUV',       'Nuevo'),
('Mazda',   'CX-5',     2023, 'Rojo',    28900.00, 'JM3KFBDM5P0123462', 'SUV',       'Usado'),
('Mazda',   '3',        2026, 'Gris',    23800.00, '3MZBPABL2TM123463', 'Hatchback', 'Nuevo'),
('Honda',   'Civic',    2020, 'Negro',   18700.00, '2HGFC2F59LH123464', 'Sedan',     'Usado'),
('Kia',     'Sportage', 2026, 'Blanco',  30500.00, 'KNDPU3DF6T7123465', 'SUV',       'Nuevo'),
('Ford',    'Ranger',   2018, 'Azul',    21000.00, 'MPBUMFF60JX123466', 'Pickup',    'Usado');


INSERT INTO clientes (nombre, apellido, cedula, telefono, email, direccion) VALUES
('Sofía',    'Ramírez Chaves',  '1-1023-0456', '8811-2233', 'sofia.ramirez@correo.com',    'San José, Curridabat'),
('Diego',    'Alvarado Mora',   '2-0789-0123', '8722-3344', 'diego.alvarado@correo.com',   'Alajuela, Centro'),
('Valeria',  'Navarro Quesada', '3-0456-0789', '8633-4455', 'valeria.navarro@correo.com',  'Cartago, Oriental'),
('José',     'Cordero Brenes',  '4-0234-0567', '8544-5566', 'jose.cordero@correo.com',     'Heredia, San Pablo'),
('Camila',   'Herrera Solano',  '1-1456-0890', '8455-6677', 'camila.herrera@correo.com',   'San José, Escazú'),
('Fernando', 'Calderón Ulate',  '6-0345-0678', '8366-7788', 'fernando.calderon@correo.com','Puntarenas, Centro');


INSERT INTO vendedores (nombre, apellido, cedula, fecha_nacimiento, fecha_contratacion, comision) VALUES
('Carlos', 'Mora Jiménez',      '1-1234-0567', '1985-03-12', '2018-02-01', 5.00),
('Laura',  'Solís Vargas',      '2-0456-0789', '1990-07-25', '2020-06-15', 4.50),
('Andrés', 'Rojas Castro',      '3-0345-0912', '1995-11-03', '2022-01-10', 6.00),
('María',  'Fernández Quesada', '1-1567-0234', '2000-04-18', '2024-03-01', 3.50);


INSERT INTO ventas (id_vehiculo, id_cliente, id_vendedor, fecha_venta, precio_final, metodo_pago) VALUES
(1,  1, 1, '2026-08-05', 24000.00, 'Financiamiento'),
(5,  2, 2, '2026-08-20', 11000.00, 'Efectivo'),
(3,  3, 1, '2026-09-10', 30000.00, 'Tarjeta'),
(8,  4, 3, '2026-09-28', 28000.00, 'Financiamiento'),
(10, 5, 2, '2026-10-15', 18200.00, 'Efectivo'),
(2,  6, 1, '2026-10-30', 34500.00, 'Financiamiento'),
(4,  1, 3, '2026-11-05', 29500.00, 'Tarjeta'),
(6,  2, 4, '2026-11-10', 27000.00, 'Financiamiento');


SELECT 'vehiculos' AS tabla, COUNT(*) AS filas FROM vehiculos
UNION ALL SELECT 'clientes',   COUNT(*) FROM clientes
UNION ALL SELECT 'vendedores', COUNT(*) FROM vendedores
UNION ALL SELECT 'ventas',     COUNT(*) FROM ventas;


