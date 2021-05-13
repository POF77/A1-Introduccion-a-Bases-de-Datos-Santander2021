[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 01`](../Readme.md) > `Reto 1 - resuelto`
	
## Reto 1: Estructura de una tabla

<div style="text-align: justify;">

### 1. Objetivos :dart:

- Consultar la estructura de algunas tablas.

### 2. Requisitos :clipboard:

1. MySQL Workbench instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `tienda`, muestra la descripción de las tablas `articulo`, `puesto` y `venta`. Por cada tipo de dato que encuentres llena la siguiente tabla (a mano, puedes dibujarla en un cuaderno o dónde tú prefieras). Usa la [Documentación de MySQL](https://dev.mysql.com/doc/refman/8.0/en/data-types.html) como referencia si no recuerdas cómo se usa un comando, o por supuesto, preguntarle al experto.

| Tipo   | Descripción |
|---|---|
| int |Número entero|
| varchar |Valor de caracteres. Número indica la longitud máxima |
| double |Valor numérico con decimales  |
| timestamp |Valor que corresponde a un momento en el tiempo |

<br/>

*Códico*
<br/>
USE tienda; describe articulo;
<br/>
USE tienda; describe puesto;
<br/>
USE tienda; describe venta;

<br/>

[`Anterior`](../Ejemplo-02/Readme.md) | [`Siguiente`](../Readme.md)

</div>
