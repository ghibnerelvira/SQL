-- SELECT <проекция>
-- FROM <таблица_1>
-- JOIN <таблица_2> ON <таблица_1.внешний_ключ>=<таблица_2.первичный_ключ>


--- (1) Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)
SELECT
    Products.ProductName,
    Products.Price,
    Categories.CategoryName,
    Suppliers.SupplierName
FROM Products

JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;


-- (2) Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
    Suppliers.Country,
    Products.ProductName
FROM Suppliers
JOIN Products ON Suppliers.SupplierID = Products.SupplierID
WHERE Products.CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'seafood');


-- (3) Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2;


-- (4) Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT 
    ProductName,
    Price * 0.91 AS USD
FROM Products
ORDER BY Price DESC
LIMIT 1;

-- (5) Дайте короткий ответ на вопрос: в чем отличие БД от СУБД

-- БД (база данных) - это место, где хранятся данные. 
-- СУБД (система управления базами данных) - это инструмент для удобного управления, 
-- доступа и работе с этими данными. 
-- Таким образом, БД - это место хранения, а СУБД - инструмент для работы с этим местом.(СУБД управляет базой данных.)

