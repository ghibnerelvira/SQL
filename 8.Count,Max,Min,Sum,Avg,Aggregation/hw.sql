
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
    SUM(OrderDetails.Quantity * Products.Price) AS total_cost -- SUM(Quantity(сколько товара insgesamt) * Price(Цена товара))
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    OrderID = 10248;


-- Вывести количество товаров с ценой от 10 до 250 EUR (подсчитать количество таких товаров / Scolar=одно значение)
SELECT
    COUNT(*) AS product_count
FROM
    Products
WHERE
    Price BETWEEN 10 AND 250;


-- Вывести сумму, на которую было отправлено товаров клиентам в Germany (всю суму заказов из германии сложить)

SELECT
    SUM(OrderDetails.Quantity * Products.Price) AS total_amount
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID -- клиент 
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID -- заказы
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID -- товары
WHERE
    Customers.Country = 'Germany';


-- С помощью инструмента онлайн-проектирования опишите схему БД "чат поддержки" (базовые сущности и характеристики)

-- https://dbdiagram.io/d/65b0d6e8ac844320ae9b84f8

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


-- Чат поддержки
-- Отправить сообщение  CREATE
-- Прочитать сообщение  READ
-- Отметить сообщение прочитанным   UPDATE
-- Добавить реакцию(оценку на сообщение) CREATE
-- Удалить реакцию DELETE
-- Время отправки сообщения CREATE
-- Удалить сообщения DELETE

-- ..... < 1:M
-- ...... =  1:1
-- ....... > M:1
