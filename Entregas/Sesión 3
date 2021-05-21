/* Sesión 3: Retos y actividades
Por: Paul O'Hea Flores
Fecha: 19/05/2021 */

-- Reto 1 ---------------------------------------------------------------------------------------------------------------------
-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
SHOW KEYS FROM empleado;
SHOW KEYS FROM venta;
DESCRIBE venta;

SELECT nombre, count(id_venta)
FROM empleado AS a
RIGHT JOIN venta As b
ON a.id_empleado = b.id_empleado
GROUP BY nombre;

SELECT clave, nombre, apellido_paterno -- Solución del prof
FROM empleado AS a
JOIN venta As b
ON a.id_empleado = b.id_empleado
ORDER BY clave;

SELECT nombre, count(id_venta)
FROM articulo AS a
RIGHT JOIN venta AS b -- Si pongo left join, aparen los cerosya que prioriza los articulos por encima de las ventas.
ON a.id_articulo = b.id_articulo
GROUP BY nombre;

-- ¿Cuál es el total de cada venta?
DESCRIBE venta;
DESCRIBE articulo;

SELECT id_venta, round(sum(precio+iva),2)
FROM venta AS a
JOIN articulo AS b
ON a.id_articulo = b.id_articulo
GROUP BY id_venta;

-- Reto 2 ---------------------------------------------------------------------------------------------------------------------
/* Usando la base de datos tienda, define las siguientes vistas que permitan obtener la siguiente información.
AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO _<tu identificador>. Por ejemplo mi_vista_hermosa_123. */
USE tienda;

-- Obtener el puesto de un empleado.
DESCRIBE puesto;
DESCRIBE empleado;

CREATE VIEW empleados_puestos_496 AS
(SELECT concat(a.nombre," ",a.apellido_paterno) empleado, b.nombre puesto
FROM empleado AS a
JOIN puesto AS b
ON a.id_puesto = b.id_puesto);

-- Saber qué artículos ha vendido cada empleado.
DESCRIBE empleado;
DESCRIBE venta;

CREATE VIEW art_empleado_496 AS
(SELECT concat(a.nombre," ",a.apellido_paterno) empleado, b.id_articulo
FROM empleado AS a
JOIN venta AS b
ON a.id_empleado = b.id_empleado
ORDER BY empleado);

-- Saber qué puesto ha tenido más ventas.
DESCRIBE venta;
DESCRIBE empleado;

SELECT a.id_puesto, count(b.clave) ventas
FROM empleado AS a
JOIN venta AS b
ON a.id_empleado = b.id_empleado
GROUP BY id_puesto
ORDER BY ventas DESC;

-- EJERCICIOS ---------------------------------------------------------------------------------------------------------------------
/* Todos los ejercicios debes hacerlos usando la base classicmodels.
Todas las consultas que realices deberás mantenerlas dentro del editor de textos de MySQL Workbench. Al finalizar,
guarda este archivo,llendo al menú File > Save script. Recuerda añadir a todos los nombres te tus vistas el sufijo con tu
identificador. */
USE classicmodels;
-- Para estas consultas usa INNER JOIN
-- 1. Obtén la cantidad de productos de cada orden.
DESCRIBE orders;
DESCRIBE orderdetails;

SELECT a.orderNumber, sum(b.quantityOrdered)
FROM orders AS a
JOIN orderdetails AS b
ON a.orderNumber = b.orderNumber
GROUP BY orderNumber;

-- 2. Obtén el número de orden, estado y costo total de cada orden.
DESCRIBE orderdetails; -- orderNumber, priceEach, quantittyOrdered
DESCRIBE orders; -- orderNumber, status

SELECT a.orderNumber, b.status, sum(a.priceEach * quantityOrdered) total
FROM orderdetails AS a
JOIN orders AS b
ON a.orderNumber = b.orderNumber
GROUP BY orderNumber, statusM;

-- 3. Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
DESCRIBE orders; -- orderNumber (Key), orderDAte, 
DESCRIBE orderdetails; -- orderNumber (Key), productCode (Key), orderLineNumbre, quantityOrdered, priceEach
DESCRIBE products; -- productCode (Key), productName

SELECT a.orderNumber, a.orderDate, b.orderLineNumber, c.productName, b.quantityOrdered, b.priceEach
FROM orders AS a
JOIN orderdetails AS b ON a.orderNumber = b.orderNumber
JOIN products AS c ON b.productCode = c.productCode;

-- 4. Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
DESCRIBE orders; -- orderNumber (Key)
DESCRIBE orderdetails; -- orderNumber (Key), productCode (Key), priceEach
DESCRIBE products; -- productCode (Key), productName, MSRP

SELECT b.orderNumber, c.productName, c.MSRP, b.priceEach
FROM orderdetails AS b
JOIN products AS c
ON b.productCode = c.productCode;

-- Para estas consultas usa LEFT JOIN
-- 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha por cada cliente. ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?
DESCRIBE customers; -- customerNumber (Key), customerName
DESCRIBE orders; -- orderNumber (Key), status (per customer), customerNumber (Key)

SELECT a.customerNumber, a.customerName, b.orderNumber, status
FROM customers AS a
LEFT JOIN orders AS b -- Elimina customerNumber y customerName == NULL
ON a.customerNumber = b.customerNumber;

-- 6. Obtén los clientes que no tienen una orden asociada.
DESCRIBE customers; -- customerNumber (Key), customerName
DESCRIBE orders; -- orderNumber customerNumber (Key)

SELECT a.customerNumber, a.customerName, orderNumber
FROM customers a
LEFT JOIN orders b
ON a.customerNumber = b.customerNumber
WHERE orderNumber IS NULL;

-- 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
DESCRIBE employees; -- employeeNumber (key), lastName, firstName,
DESCRIBE customers; -- customerNumber (Key), salesRepEmpolyeeNumber KLey) customerName, 
DESCRIBE payments; -- customerNumber (Key), checkNumber (Key), amount

SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees a
LEFT JOIN customers b
ON a.employeeNumber = b.salesRepEmployeeNumber
LEFT JOIN payments c
ON b.customerNumber = c.customerNumber;

-- Para estas consultas usa RIGHT JOIN
-- 8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? Explica las diferencias en un comentario. Para poner comentarios usa --.
SELECT a.customerNumber, a.customerName, b.orderNumber, status
FROM customers AS a
RIGHT JOIN orders AS b
ON a.customerNumber = b.customerNumber;
/* Debido a que todos los clientes tienen asignada una orden, y todas las ordenes a un clientes,
no cambian los resultados salvo por el orden en el que se presentan.*/

SELECT lastName, firstName, customerName, checkNumber, amount
FROM employees a
RIGHT JOIN customers b ON a.employeeNumber = b.salesRepEmployeeNumber
RIGHT JOIN payments c ON b.customerNumber = c.customerNumber;
/* Con LEFT JOIN la tabla presenta observaciones nulas nombre del cliente, checkNumber y amount debido a que
hay empleados que no han vendido. Cuando hacemos RIGHT JOIN no aparecen esos registros ya que prioriza
la tabla de payments sobre customers y employees, eliminando los registros en donde no hay observaciones para
nombre del cliente, checkNumber y amount */

-- 9. Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
CREATE VIEW cantidad_orden AS (
SELECT a.orderNumber, sum(b.quantityOrdered)
FROM orders AS a
JOIN orderdetails AS b
ON a.orderNumber = b.orderNumber
GROUP BY orderNumber
);
SELECT * FROM cantidad_orden;

CREATE VIEW status_cantidad AS (
SELECT a.orderNumber, b.status, sum(a.priceEach * quantityOrdered) total
FROM orderdetails AS a
JOIN orders AS b
ON a.orderNumber = b.orderNumber
GROUP BY orderNumber, status
);
SELECT status, count(orderNumber)
FROM status_cantidad
GROUP BY status;

CREATE VIEW order_nums AS (
SELECT a.customerNumber, a.customerName, orderNumber
FROM customers a
LEFT JOIN orders b
ON a.customerNumber = b.customerNumber
WHERE orderNumber IS NULL
);
SELECT customerNumber, customerName
FROM order_nums
WHERE customerNumber > 200
ORDER BY customerNumber;
