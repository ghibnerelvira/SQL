-- Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)
SELECT
    OrderID,
    SUM(Quantity * Price) AS OrderTotal
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    OrderID
HAVING
    SUM(Quantity * Price) >= 5000;



-- Вывести страны, в которые было отправлено 3 и более заказов
SELECT
    Country,
    COUNT(OrderID) AS NumberOfOrders
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY
    Country
HAVING
    COUNT(OrderID) >= 3;


-- Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)
SELECT
    ProductName,
    SUM(Quantity) AS TotalSold
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Products.ProductID
ORDER BY
    TotalSold DESC
LIMIT
    10;


-- Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT
    Employees.EmployeeID,
    Employees.LastName,
    Employees.FirstName,
    SUM(OrderDetails.Quantity * Products.Price) * 0.05 AS Salary
FROM
    Orders
JOIN
    Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Employees.EmployeeID,
    Employees.LastName,
    Employees.FirstName;

