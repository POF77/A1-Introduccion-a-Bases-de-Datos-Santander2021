[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 02`](../Readme.md) > `Reto 2`
	
## Reto 2: Funciones de agrupamiento

<div style="text-align: justify;">

### 1. Objetivos :dart:

- Escribir consultas que permitan responder a algunas preguntas.

### 2. Requisitos :clipboard:

1. MySQL Workbench instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `tienda`, escribe consultas que permitan responder las siguientes preguntas.

- ¿Cuál es el promedio de salario de los puestos?
- ![imagen](https://user-images.githubusercontent.com/60225087/118206730-bac38780-b428-11eb-9eaf-7545f9df30e2.png)
- ¿Cuántos artículos incluyen la palabra `Pasta` en su nombre?
- ![imagen](https://user-images.githubusercontent.com/60225087/118206758-cadb6700-b428-11eb-870f-bd6b98d5c961.png)
- ¿Cuál es el salario mínimo y máximo?
- ![imagen](https://user-images.githubusercontent.com/60225087/118206782-d7f85600-b428-11eb-9d33-23ad249a01c0.png)
- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
- ![imagen](https://user-images.githubusercontent.com/60225087/118206832-f3636100-b428-11eb-9ec3-90daaf81029a.png)
- 	SELECT round(sum(salario),2) suma
- 	FROM (SELECT * FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS subconjuto;


<br/>

[`Anterior`](../Ejemplo-02/Readme.md) | [`Siguiente`](../Readme.md)      

</div> 
