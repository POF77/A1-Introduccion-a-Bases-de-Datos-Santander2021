[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 01`](../Readme.md) > `Reto 2`
	
## Reto 2: Estructura básica de una consulta

<div style="text-align: justify;">

### 1. Objetivos :dart:

- Escribir consultas que permitan responder a algunas preguntas.

### 2. Requisitos :clipboard:

1. MySQL Workbench instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

1- ¿Cuál es el nombre de los empleados con el puesto 4?
2- ¿Qué puestos tienen un salario mayor a $10,000?
3- ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100?
4- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?

<br/>
*Respuesta* <br/>
1- Norrie y Maxy <br/>
2-<br/> ![imagen](https://user-images.githubusercontent.com/60225087/117911622-ba4db400-b2a3-11eb-8812-d141a188b2ec.png)
<br/>
3-<br/> ![imagen](https://user-images.githubusercontent.com/60225087/117906973-8ec6cb80-b29b-11eb-9223-adb997e3d041.png)
<br/>
4-<br/> ![imagen](https://user-images.githubusercontent.com/60225087/117907014-9f774180-b29b-11eb-9c65-7ef21cc960f0.png)
<br/>

*Código*
SELECT *<br/>
FROM empleado<br/>
WHERE id_puesto = 4;<br/>
<br/>
SELECT *<br/>
FROM puesto<br/>
WHERE SALARIO > 10000;<br/>
<br/>
SELECT *<br/>
FROM articulo<br/>
WHERE precio > 1000 AND iva > 100;<br/>
<br/>
SELECT *<br/>
FROM venta<br/>
WHERE id_articulo IN (135,963) AND id_empleado IN (835,369)

<br/>

[`Anterior`](../Ejemplo-03/Readme.md) | [`Siguiente`](../Readme.md)

</div>
