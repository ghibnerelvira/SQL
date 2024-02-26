-- Вывести среднюю стоимость товара в категории 1 (проекция: название_категории, сред/стоимость)
SELECT Categories.CategoryName, AVG(Products.Price) AS average_cost
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryID = 1;

-- Вывести телефоны поставщиков (suppliers) и перевозчиков (shippers)
SELECT Phone, SupplierName AS Supplier_Shipper FROM Suppliers
UNION
SELECT Phone, ShipperName AS Supplie_Shipper FROM Shippers

-- Вывести все заказы, добавив поле is_premium, если его доставит перевозчик 3 (ShipperID)

SELECT Orders.*, 
       CASE 
           WHEN Orders.ShipperID = 3 THEN 'Yes' 
           ELSE 'No' 
       END AS is_premium
FROM Orders
WHERE Orders.ShipperID = 3;

-- Вывести все товары, причем для товаров от поставщиков 1 и 3 и ценой до 250 EUR добавить 
-- скидку в 5.5% (проекция: все поля + поле Price_down)
SELECT Products.*,
       CASE 
           WHEN (Products.SupplierID = 1 OR Products.SupplierID = 3) AND Products.Price <= 250 THEN Products.Price * 0.945 -- 100% - 5.5%
           ELSE Products.Price
       END AS Price_down
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;