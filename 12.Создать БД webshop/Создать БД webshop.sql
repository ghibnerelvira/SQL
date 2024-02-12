-- SELECT * FROM webshop.products;

-- SQL: DDL / Data Definition Language
-- раздел (часть), необходимый для создания БД
-- инструмент описания схемы БД (создание таблиц и т.д.)

-- MySQL
-- СУБД (DBMS)
-- MySQL Workbench
-- клиент для MySQL



-- Задача. Создать БД webshop 
CREATE DATABASE IF NOT EXISTS webshop;

USE webshop;

-- Создать таблицу `products`
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),
    price FLOAT,
    category VARCHAR(64)
);

-- Задача. Добавить пять товаров в таблицу `products`
INSERT INTO products (title, price, category) VALUES ('Bubble gum', 30, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Roses', 20, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Sea', 15, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Peach of love', 60, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Strawberry', 30, 'Candles');


-- Задача. Увеличить стоимость всех товаров с ценой от 50 до 5000 на 15%
UPDATE products 
SET price = price * 1.15 
WHERE 
	price BETWEEN 50 AND 5000;
-- WHERE price >= 50 AND price <= 5000;



-- Задача. Вывести среднюю стоимость всех товаров
SELECT
	AVG(price) AS avg_price
FROM products;


-- Задача. Вывести среднюю стоимость товаров для каждой категории
SELECT
	category,
	AVG(price) AS avg_price
FROM products

GROUP BY category;


-- Задача. Для товаров `1, 3, 5` уменьшить стоимость на `5%`

UPDATE products
SET price = price * .95
WHERE
	id IN (1, 3, 5);


-- Задача. Вывести данные о товарах
SELECT *,
	price * 1.07 AS price_usd
FROM products;


-- Задача. Удалить товар с `ID 1`
DELETE FROM products
WHERE
	id = 1;



