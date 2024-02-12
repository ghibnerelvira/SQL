-- https://western-appeal-39b.notion.site/GenTech-Summary-Jan-29-2024-cfd161859f1a40b1874dd063f3024178

-- DDL VS CRUD
-- DDL и CRUD - два различных концепта в области управления базами данных:

-- DDL (Data Definition Language - Язык Определения Данных):
-- DDL - это подмножество SQL (Structured Query Language - Язык Структурированных Запросов), 
-- которое занимается определением и управлением структурами и схемами баз данных.
-- Он включает команды типа CREATE, ALTER, DROP и TRUNCATE, позволяющие создавать, 
-- изменять и удалять объекты баз данных, такие как таблицы, индексы, представления и схемы.
-- DDL-инструкции используются для определения структуры, которая будет содержать данные.

-- Примеры:
-- CREATE TABLE для создания новой таблицы.
-- ALTER TABLE для изменения структуры существующей таблицы.
-- DROP TABLE для удаления таблицы из базы данных.


-- CRUD (Create, Read, Update, Delete - Создание, Чтение, Обновление, Удаление):
-- CRUD - это акроним, представляющий четыре основные операции, которые могут 
-- выполняться с данными в большинстве систем управления базами данных.

-- Создание: Вставка новых записей в базу данных.
-- Чтение: Получение или запрос существующих данных из базы данных.
-- Обновление: Изменение существующих записей в базе данных.
-- Удаление: Удаление записей из базы данных.

-- Примеры:
-- Создание: INSERT INTO имя_таблицы ...
-- Чтение: SELECT * FROM имя_таблицы WHERE ...
-- Обновление: UPDATE имя_таблицы SET ... WHERE ...
-- Удаление: DELETE FROM имя_таблицы WHERE ...

-- В заключение, DDL сосредотачивается на определении и управлении структурой 
-- базы данных, в то время как операции CRUD направлены на манипулирование данными, 
-- хранящимися в этой структуре. Оба они являются основными концепциями в управлении 
-- базами данных и часто используются вместе для эффективного создания и поддержки 
-- баз данных.



-- Группировка в SQL (механизм агрегации) / оператор GROUP BY

-- Вывести максимальную стоимость для каждой категории товаров
-- проекция: название_категории, макс_цена_товара
SELECT
 Categories.CategoryName,
 MAX(Products.Price) AS max_price
FROM Categories

JOIN Products ON Products.CategoryID = Categories.CategoryID

GROUP BY Categories.CategoryID

ORDER BY max_price DESC

-- ==== 1. ====
-- Задача. Вывести ко-во товаров в категории 5
SELECT
	COUNT(*) AS total_products
FROM Products

WHERE
	CategoryID = 5

-- ==== 2. ====
-- Задача. Вывести ко-во товаров для категорий 5 и 6 (отдельно для каждой)
-- проекция: название_категории, ко-во_товаров
SELECT
 Categories.CategoryName,
 COUNT(*) AS countProducts
 
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID

WHERE
	Products.CategoryID IN (5, 6)

GROUP BY Products.CategoryID

-- ==== 3. ====
-- Задача. Вывести компанию-перевозчика, которая находится на третьем месте по ко-ву заказов
-- проекция: название_компании, ко-во_заказов
SELECT
	Shippers.ShipperName,
  COUNT(*) AS total_orders
FROM Orders

JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID

GROUP BY Shippers.ShipperID

ORDER BY total_orders DESC
LIMIT 1 OFFSET 2