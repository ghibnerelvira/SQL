-- https://western-appeal-39b.notion.site/GenTech-6-Jan-24-2024-d74f0f9f05624bba8dd5fc72c7a7a1c2

-- Группировка в SQL (механизм агрегации) / оператор GROUP BY

-- Категории запросов:

-- CRUD - простые запросы
-- Aggregation - получение вычисленных данных
-- Группировка - объединение записей на основе общего признака с целью получения обобщенных данных

-- ==================================================================== Пример. ======================================================================
-- Вывести количественное распределение покупателей по странам
-- (сколько клиентов в каждой стране)
SELECT DISTINCT
	Country
FROM Customers
----------------------------------------

SELECT
	COUNT(*) AS total_customers
FROM Customers

WHERE
	Country = 'UK'
-----------------------------------------

SELECT
	Country,
	COUNT(*) AS total_customers
FROM Customers

GROUP BY Country

ORDER BY total_customers DESC


-- ======================================================================== GROUP BY ============================================================
-- Вывести кол/распределение товаров по категориям
SELECT
	CategoryID,
  COUNT(*) AS total
FROM Products

GROUP BY CategoryID


-- Вывести кол/распределение заказов по перевозчикам
SELECT
	ShipperID,
  COUNT(*) AS total_orders
FROM Orders

GROUP BY ShipperID

--------------------------------------------------------

SELECT
	Shippers.ShipperName,
  COUNT(*) AS total_orders
FROM Orders

JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

GROUP BY Orders.ShipperID


--  Вывести ТОП-3 менеджеров по ко-ву заказов (фамилия_менеджера, ко-во_заказов)
SELECT
	Employees.LastName AS managerLastName,
	COUNT(*) AS total_orders
FROM Orders

JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID

GROUP BY Employees.EmployeeID

ORDER BY total_orders DESC
LIMIT 3


-- Вывести сред/стоимость товара для каждого поставщика (название_компании, сред_стоимость)
SELECT
	Suppliers.SupplierName,
	AVG(Products.Price) AS avg_price
FROM Suppliers

JOIN Products ON Products.SupplierID = Suppliers.SupplierID

GROUP BY Products.SupplierID


-- ======================================================================== HAVING ============================================================
-- Фильтрация агрегированных данных / оператор HAVING
-- аналог WHERE, который позволяет отфильтровать агрегированные данные

SELECT
	Employees.LastName AS managerLastName,
	COUNT(*) AS total_orders
FROM Orders

JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID

GROUP BY Employees.EmployeeID
HAVING
	total_orders >= 80

ORDER BY total_orders DESC


----------------------------------------------------------

SELECT
	Country,
	COUNT(*) AS total_customers
FROM Customers

GROUP BY Country
HAVING
	total_customers >= 9

ORDER BY total_customers DESC