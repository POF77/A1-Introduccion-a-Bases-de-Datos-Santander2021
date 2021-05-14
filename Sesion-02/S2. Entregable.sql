/* Entregas sesion 2 
Nombre: Paul O'Hea Flores
Fecha: 13/05/2021 */

-- Reto 1 --
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE "%pasta%";
-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE "%cannelloni%";
-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT *
FROM articulo
WHERE nombre LIKE "%-%";

-- Reto 2 --
-- ¿Cuál es el promedio de salario de los puestos?
SELECT round(avg(salario),2) promedio_salarios
FROM puesto;

-- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) Arts_pasta
FROM articulo
WHERE nombre LIKE "%Pasta%";

-- ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) "salario_min", max(salario) "salario_max"
FROM puesto;

-- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT round(sum(salario),2) suma
FROM (SELECT * FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS subconjuto;

-- Reto 3 --
-- ¿Cuántos registros hay por cada uno de los puestos?
FROM puesto
GROUP BY nombre
ORDER BY cuenta DESC;

-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, round(sum(salario),2) pago_total
FROM puesto
GROUP BY nombre;

-- ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*)
FROM venta
GROUP BY id_empleado;

-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*)
FROM venta
GROUP BY id_articulo;

-- Reto 4 --
-- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SELECT nombre
FROM empleado
WHERE id_puesto IN (SELECT id_puesto
FROM puesto
WHERE salario > 10000);

-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado por clave?
SELECT * FROM venta ORDER BY id_empleado;
SELECT id_empelado, min(total_ventas), max(total_ventas)
FROM (SELECT calve, id_empleado, count(*) total_ventas FROM ventas GROUP BY clave);

-- ¿Cuál es el nombre del puesto de cada empleado?
SELECT nombre, (SELECT nombre FROM puesto WHERE id_puesto = empleado.id_puesto)
FROM empleado;

-- Ejercicios --
USE classicmodels;

-- 1. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A.
DESCRIBE employees;
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE employeeNumber LIKE "A%";

-- 2. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE lastName LIKE "%on" OR apellido_materno LIKE "%on";

-- 3. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE lastName LIKE "%on%";

-- 4. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName LIKE "G______";

-- 5. Dentro de la tabla employees, obtén el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE firstName LIKE "B%";

-- 6. Dentro de la tabla products, obtén el código de producto y nombre de los productos cuyo código incluye la cadena _20.
describe products;
SELECT productCode, productName
FROM products
WHERE productCode LIKE "_20";

-- 7. Dentro de la tabla orderdetails, obtén el total de cada orden.
describe orderdetails;
SELECT orderNumber, sum(quantityOrdered)
FROM orderdetails
GROUP BY orderNumber;

-- 8. Dentro de la tabla orders obtén el número de órdenes por año.
SELECT * FROM orders;
SELECT (SELECT count(orderDate) FROM orders WHERE orderDate LIKE "2003%") AS "2019";

-- 9. Obtén el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT * FROM offices;
SELECT * FROM employees;
SELECT firstName, lastName, (SELECT city FROM offices WHERE officeCode = employees.officeCode) AS Office
FROM employees;

-- 10 Obtén el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT * FROM customers;
SELECT * FROM payments;
SELECT customerNumber, checkNumber, amount
FROM payments
ORDER BY amount DESC
LIMIT 1;

-- 11. Obtén el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (SELECT avg(amount) FROM payments);

-- 12. Obtén el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT * FROM customers;
SELECT * FROM payments;
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM payments);

-- 13. Obtén el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT * FROM orderdetails;
SELECT orderNumber, max(quantityOrdered), min(quantityOrdered), sum(quantityOrdered)
FROM orderdetails
GROUP BY orderNumber;

-- 14. Dentro de la tabla orders, Obtén el número de órdenes que hay por cada estado.
SELECT * FROM orders;
SELECT * FROM customers;
SELECT (SELECT state FROM customers WHERE customerNumber = orders.customerNumber) States, count(*)
FROM orders
GROUP BY States;