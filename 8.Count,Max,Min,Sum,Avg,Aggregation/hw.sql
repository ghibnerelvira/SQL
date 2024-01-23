
-- Вывести сред/стоимость товаров из категорий 1, 2, 5, у которых название начинается с буквы t
SELECT
    ProductName,
    CategoryID,
	AVG(Price) AS avg_price
FROM Products
WHERE 
    CategoryID IN (1,2,5)
    AND
    ProductName Like 'T%';


-- Посчитать стоимость заказа 10248
SELECT
    OrderID,
    SUM(Price * Quantity) AS total_cost
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    OrderID = 10248;


-- Вывести ко-во товаров с ценой от 10 до 250 EUR (подсчитать количество таких товаров)
SELECT
    COUNT(*) AS product_count
FROM
    Products
WHERE
    Price BETWEEN 10 AND 250;


-- Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT
    SUM(OrderDetails.Quantity * Products.Price) AS total_amount
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Customers.Country = 'Germany';


-- С помощью инструмента онлайн-проектирования опишите схему БД "чат поддержки" (базовые сущности и характеристики)

-- Таблица "Пользователи" (Users):
-- UserID (int) - id пользователя
-- UserName (varchar) - имя пользователя
-- UserEmail (varchar) - адрес эл. почты пользователя
-- StartTime (timestamp) - время входа
-- EndTime (datetime) -- время выхода

-- Таблица "Чаты" (Chats):
-- ChatID (int) - id чата
-- ChatName (varchar) - название чата
-- StartTime (timestamp) - время входа
-- EndTime (datetime) -- время выхода

-- Таблица "Сообщения" (Messages):
-- MessageID (int) - id сообщения
-- ChatID (int)
-- UserID (int)
-- Content (text) - текст сообщения
-- Timestamp (datetime) - время отправки сообщения