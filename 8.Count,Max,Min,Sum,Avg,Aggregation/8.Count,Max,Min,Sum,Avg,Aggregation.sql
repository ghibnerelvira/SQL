-- Схема БД “онлайн-шахматы”

-- ** Базовые сущности **
-- `игроки`
-- `игровые_сессии`
-- `ходы`
-- `чаты`
-- `сообщения`

-- Примеры запросов
SELECT *
FROM Suppliers

SELECT
	Phone
FROM Suppliers

-- -----------------------------
WHERE
	Country = 'UK'
	OR
	Country = 'Brazil'
​-- -----------------------------

SELECT
	Phone
FROM Suppliers

WHERE
	Country IN ('UK', 'Brazil')
​-- -----------------------------
SELECT
	ProductName,
	Price
FROM Products
WHERE
	Price <= 50
	AND
	CategoryID IN (1, 3)
​-- -----------------------------

SELECT *
FROM Products

WHERE
	SupplierID = 1

ORDER BY Price ASC


-- -----------------------------
SELECT *
FROM Products

ORDER BY Price DESC
LIMIT 3
-- -----------------------------



-- ** Задача. Вывести название и стоимость одного самого дорогого товара из категории `1` **

SELECT
		ProductName,
   	Price      
FROM Products

WHERE
	CategoryID = 1 

ORDER BY Price DESC 
LIMIT 1



-- ** Пример использования `LIMIT` + `OFFSET.` Вывести товары, которые находятся на втором и третьем местах среди самых дорогих **

SELECT *
FROM Products

ORDER BY Price DESC 
LIMIT 2 OFFSET 1



-- ** Задача. Вывести товары от поставщиков `1` и `5` **
-- проекция: `название_товара`, `цена_со_скидкой_2_процента`, `цена_с_наценкой_5_процентов`

SELECT
	ProductName,
	Price * .98 AS Price_down,
	Price * 1.05 AS Price_up
FROM Products

WHERE
	SupplierID IN (1, 5)


-- Пример. Оператор JOIN
SELECT *
FROM Products

JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID



-- Задача. Вывести данные о товарах с ценой от 25 до 125 EUR
-- проекция: название_товара, цена_товара, название_компании_поставщика
SELECT
	Products.ProductName,
  Products.Price,
  Suppliers.SupplierName
FROM Products

JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE
	Products.Price BETWEEN 25 AND 125



-- Задача. Вывести данные о заказах клиентов из France
SELECT * 
FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID

WHERE
	Customers.Country = 'France'


-- Агрегация данных в SQL
-- Базовые категории запросов
-- CRUD - более простые запросы
-- Aggregation - получение вычисленных данных (итоги, статистика, аналитика)
-- Базовые операторы агрегации

-- COUNT() расчет ко-ва строк
-- AVG() расчет сред/ариф. знач.
-- MAX() расчет макс. значения
-- MIN() расчет мин. значения
-- SUM() расчет суммы




-- =============== Пример. Найти ко-во клиентов ===============

-- всего
SELECT
	COUNT(*) AS total_customers
FROM Customers

-- из Germany
SELECT
	COUNT(*) AS total_germany_customers
FROM Customers

WHERE
	Country = 'Germany'



-- =============== Пример. Товары ===============

-- вывести сред/стоимость товара
SELECT
	AVG(Price) AS avg_price
FROM Products

-- вывести статистику по товарам
SELECT
	COUNT(*) AS total_products,
    MAX(Price) AS max_price,
    MIN(Price) AS min_price,
    SUM(Price) AS total_cost,
    AVG(Price) AS avg_price
FROM Products


-- =============== Пример. Заказы ===============
SELECT
	COUNT(*) AS total_orders 
FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID

WHERE
	Customers.Country = 'France'


-- Задача. Вывести общее ко-во поставщиков не из USA и не из Spain
SELECT
	COUNT(*) AS total_not_usa_spain_suppliers
FROM Suppliers

WHERE
	NOT Country IN ('USA', 'Spain')


-- Задача. Вывести ко-во заказов, которое оформил клиент 1
SELECT
	COUNT(*) AS total_orders
FROM Orders

WHERE
	CustomerID = 1


-- Задача. Вывести, какое количество раз был заказан товар 72 (по ко-ву заказов)
SELECT
	COUNT(*) AS sold_count
FROM OrderDetails

WHERE
	ProductID = 72


-- Задача. Вывести среднюю стоимость товаров от поставщика 3
-- (проекция: название_компании_поставщика, сред/стоимость)
SELECT
	Suppliers.SupplierName,
	AVG(Products.Price) AS avg_price
FROM Products

JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID

WHERE
	Suppliers.SupplierID = 3



-- Схема БД “чат поддержки”
-- ** Базовые сущности **

-- - `юзеры` (сотрудники могут быть здесь или в отд/таблице)
-- - `сообщения`
-- - `чаты`
-- - `реакции (оценка)`
-- - `типовые_причины_обращений`