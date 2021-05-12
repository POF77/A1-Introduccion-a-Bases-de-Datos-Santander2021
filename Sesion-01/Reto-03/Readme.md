[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 01`](../Readme.md) > `Reto 3`
	
## Reto 3: Ordenamientos y Límites

<div style="text-align: justify;">

### 1. Objetivos :dart:

- Escribir consultas que permitan responder algunas preguntas mediante ordenamientos y límites.

### 2. Requisitos :clipboard:

1. MySQL Workbench instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `tienda`, escribe una consulta que permita obtener el top 5 de puestos por salarios.

*Código*<br/>
SELECT *<br/>
FROM puesto<br/>
ORDER BY salario DESC<br/>
LIMIT 5;<br/>

![imagen](https://user-images.githubusercontent.com/60225087/117907749-ed407980-b29c-11eb-8b16-fb0f954f1f9e.png)

<br/>
### Resultados Reto 2
<br/>
1. Norrie y Maxy
<br/>
![imagen](https://user-images.githubusercontent.com/60225087/117911622-ba4db400-b2a3-11eb-8812-d141a188b2ec.png)
<br/>

<br/>

[`Anterior`](../Ejemplo-04/Readme.md) | [`Siguiente`](../Readme.md)

</div>
