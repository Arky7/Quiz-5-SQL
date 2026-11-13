USE miautopuntocom;


SELECT v.id_vehiculo, v.marca, v.modelo, v.anio, v.color, v.tipo, v.estado, v.precio
FROM vehiculos v
LEFT JOIN ventas vt ON vt.id_vehiculo = v.id_vehiculo
WHERE vt.id_venta IS NULL
ORDER BY v.precio DESC;


SELECT CONCAT(ve.nombre, ' ', ve.apellido) AS vendedor,
       COUNT(vt.id_venta) AS cantidad_ventas
FROM vendedores ve
LEFT JOIN ventas vt ON vt.id_vendedor = ve.id_vendedor
GROUP BY ve.id_vendedor, ve.nombre, ve.apellido
ORDER BY cantidad_ventas DESC;


SELECT CONCAT(ve.nombre, ' ', ve.apellido) AS vendedor,
       COALESCE(SUM(vt.precio_final), 0) AS ingreso_total
FROM vendedores ve
LEFT JOIN ventas vt ON vt.id_vendedor = ve.id_vendedor
GROUP BY ve.id_vendedor, ve.nombre, ve.apellido
ORDER BY ingreso_total DESC;


SELECT CONCAT(c.nombre, ' ', c.apellido) AS cliente,
       c.cedula, vt.precio_final, vt.fecha_venta
FROM ventas vt
JOIN clientes c ON c.id_cliente = vt.id_cliente
WHERE vt.precio_final = (SELECT MAX(precio_final) FROM ventas);


SELECT vt.fecha_venta, v.marca, v.modelo, v.anio, vt.precio_final,
       CONCAT(c.nombre, ' ', c.apellido) AS cliente,
       c.cedula, c.telefono, c.email
FROM ventas vt
JOIN vehiculos v ON v.id_vehiculo = vt.id_vehiculo
JOIN clientes  c ON c.id_cliente  = vt.id_cliente
WHERE vt.fecha_venta >= CURDATE() - INTERVAL 1 MONTH
ORDER BY vt.fecha_venta DESC;


SELECT CONCAT(ve.nombre, ' ', ve.apellido) AS vendedor,
       ve.comision AS porcentaje,
       COALESCE(SUM(vt.precio_final), 0) AS total_vendido,
       ROUND(COALESCE(SUM(vt.precio_final), 0) * ve.comision / 100, 2) AS comision_ganada
FROM vendedores ve
LEFT JOIN ventas vt ON vt.id_vendedor = ve.id_vendedor
GROUP BY ve.id_vendedor, ve.nombre, ve.apellido, ve.comision
ORDER BY comision_ganada DESC;


SELECT v.tipo,
       COUNT(*) AS vendidos,
       ROUND(AVG(vt.precio_final), 2) AS promedio_precio_venta
FROM ventas vt
JOIN vehiculos v ON v.id_vehiculo = vt.id_vehiculo
GROUP BY v.tipo
ORDER BY promedio_precio_venta DESC;


SELECT v.marca, COUNT(*) AS veces_vendida
FROM ventas vt
JOIN vehiculos v ON v.id_vehiculo = vt.id_vehiculo
GROUP BY v.marca
HAVING COUNT(*) = (
    SELECT MAX(cantidad)
    FROM (
        SELECT COUNT(*) AS cantidad
        FROM ventas vt2
        JOIN vehiculos v2 ON v2.id_vehiculo = vt2.id_vehiculo
        GROUP BY v2.marca
    ) AS conteo
);