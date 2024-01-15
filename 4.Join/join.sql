-- https://western-appeal-39b.notion.site/GenTech-3-Dec-20-2023-19a36afcea9b4545846b95cf19d12218
-- https://western-appeal-39b.notion.site/GenTech-Summary-Jan-8-2024-ee932365d1914930998c881fcda39aaf

-- =============================== Ключевые поля ===============================

-- - первичный ключ (`PRIMARY KEY`)
-- - внешний ключ (`FOREIGN KEY`)

-- =============================== Горизонтальное объединение таблиц / Оператор `JOIN` ===============================

-- - синтаксис `JOIN`

-- SELECT <проекция>
-- FROM <таблица_1>
-- JOIN <таблица_2> ON <таблица_1.внешний_ключ>=<таблица_2.первичный_ключ>



--  ===============================  Базовые термины =============================== 
-- **рефакторинг** - перевыпуск (переработка) кода

-- ===============================  Проекция полей (БД) =============================== 
--  инструмент оптимизации запросов (на чтение)



-- ===============================  Оператор `AS` =============================== 
-- SELECT
-- 	ProductName,
--   Price * 1.08 AS Price_usd
-- FROM Products


-- ====== Пример запросов ======
-- -- Вывести три самых дорогих товара
-- SELECT *
-- FROM Products

-- ORDER BY Price DESC
-- LIMIT 3




--  ===============================  Поиск по шаблону / Оператор `LIKE` =============================
--  поиск по нестрогому соответствию

-- ====== Базовые подстановочные символы (знаки) ======
-- - `%` нулевой, один или несколько символов
-- - `_` один символ


-- Вывести названия и стоимость в USD товаров из категорий 1 и 4
SELECT 
    ProductName,
    Price * 1.09 AS USD
FROM Products
WHERE CategoryID IN (1, 4);



--  Вывести один напиток (категория 1), который находится на втором месте среди самых дорогих
SELECT 
    *
FROM Products
WHERE 
    CategoryID = 1
    ORDER BY Price DESC
   LIMIT 1 OFFSET 1 -- второе место
    -- LIMIT 2 OFFSET 1 -- LIMIT 2, 1 -- второе и третье место




-- **Вывести заказы менеджеров `2` и `4`**
-- (проекция: `имя_клиента`, `номер_заказа`)

SELECT
	Orders.OrderID,
	Customers.CustomerName
FROM Orders

JOIN Customers ON Customers.CustomerID = Orders.CustomerID

WHERE
	Orders.EmployeeID IN (2, 4)




-- **Вывести проданные товары**
-- (проекция: `название_товара`, `номер_заказа`)
SELECT 
    Products.ProductName, 
    OrderDetails.OrderID

FROM OrderDetails

JOIN Products ON Products.ProductID = OrderDetails.ProductID;
