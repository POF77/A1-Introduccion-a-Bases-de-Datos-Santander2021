[`Introducción a Bases de Datos`](../../README.md) > [`Sesión 06`](../Readme.md) > `Reto 1`
	
## Reto 1: Expresiones regulares

<div style="text-align: justify;">

### 1. Objetivos :dart: 

- Poner en práctica el uso de expresiones regulares.

### 2. Requisitos :clipboard:

1. MongoDB Compass instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `sample_airbnblistingsAndReviews`, realiza los siguientes filtros:

- Propiedades que no permitan fiestas.              -> {house_rules: /PETS ALLOWED/i}
- Propiedades que admitan mascotas.                 -> {house_rules: /pets allowed|pets wellcome/i}
- Propiedades que no permitan fumadores.            -> {house_rules: /NO SMOKING/i}
- Propiedades que no permitan fiestas ni fumadores. -> {house_rules: /no smoking|no parties/i}

<br/>

[`Anterior`](../Ejemplo-01/Readme.md) | [`Siguiente`](../Readme.md)

</div>
