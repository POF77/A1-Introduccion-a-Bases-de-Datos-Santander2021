/* Ejercicios Sesión 4 ---------------------
Por: Paul O'Hea Flores | Fecha: 20/05/2021*/

-- Reto 1 ---------------------------------------------------------------------------------------------------------------------
-- Tabla: movies
CREATE TABLE IF NOT EXISTS movies (
id_movie INT PRIMARY KEY,
title VARCHAR(100),
gender VARCHAR(80)
);

-- Tabla: ratings
CREATE TABLE IF NOT EXISTS ratings (
id_user INT,
id_movie INT,
rating INT,
time_stamp BIGINT, -- BIGINT para números muy grandes
FOREIGN KEY (id_user) REFERENCES users(id_user),
FOREIGN KEY (id_movie) REFERENCES movies(id_movie)
);

-- Reto 2 ---------------------------------------------------------------------------------------------------------------------
-- Instar datos de movies
SELECT *
FROM movies;
DESCRIBE movies;

INSERT INTO movies(id_movie,title,gender) VALUES (1000,"Mi panda favorito","Comedia|Acción");

-- Insertar datos de raitings
SELECT *
FROM ratings;
DESCRIBE ratings;

INSERT INTO ratings(id_user,id_movie,rating,time_stamp) VALUES (10,1000,5,99965857);