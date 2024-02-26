-- https://western-appeal-39b.notion.site/GenTech-10-Feb-21-2024-c24a9eb969ae4e99a2afd689862d2f78?pvs=25


------------ Соц/сеть --------------
-- Регистрация юзера
INSERT INTO
-- Поиск публикации
SELECT
-- Создать публикацию
INSERT INTO
-- Добавить реакцию на публикацию
INSERT INTO
-- Добавить юзера в друзья
INSERT INTO
-- Блокировка юзера
UPDATE
INSERT INTO


-------------------------------------------------------- CASE / THEN / ELSE / AEND AS --------------------------------------------------------
-- Условная конструкция в SQL / Оператор CASE
-- Пример. Вывести товары (со всеми полями), добавив новое is_premium
--		° цена от 50 EUR - true
-- 		° остальные - false
SELECT *,
	CASE
    	WHEN Price >= 50 THEN true
      ELSE false
  END AS is_premium
FROM Products

--------------
SELECT *,
	Price >= 50 AS is_premium
FROM Products



-----------------------------------------------------------------

-- Задача. При чтении таблицы Customers добавить поле is_europe
-- все поля + is_europe
-- для Germany и France - true
SELECT *,

	CASE
    	WHEN Country IN ('Germany', 'France') THEN true
      ELSE false
  END AS is_europe

FROM Customers

----------------
SELECT *,
	Country IN ('Germany', 'France') AS is_europe
FROM Customers



--------------------------------------------------------------

-- Задача. Вывести товары, добавив поле цена со скидкой Price_down в случае, если
-- 		° цена от 100 EUR — скидка 10%
-- 		° цена от 50 EUR — скидка 15%
SELECT *,

	CASE
	    	WHEN Price >= 100 THEN Price * .9
				WHEN Price >= 50 THEN Price * .85
        ELSE Price
	END AS Price_down

FROM Products


--------------------------------------------------------

-- Задача. Вывести все товары, причем для товаров из категорий 3 и 5 и ценой от 20 EUR добавить наценку в 12.5%
-- проекция: все поля + поле Price_up
SELECT *,

	CASE
			WHEN
	    	CategoryID IN (3, 5)
        AND
        Price >= 20
        THEN Price * 1.125
      ELSE Price

	END AS Price_up

FROM Products




-------------------------------------------------------

-- Задача. Вывести данные о компаниях-поставщиках, 
-- причем скрыть номера телефонов тех компаний, 
-- которые из USA (проекция: название_компании, номер_телефона)
SELECT
		SupplierName,

    CASE
	    	WHEN Country = 'USA' THEN ''
        ELSE Phone
    END AS Phone

FROM Suppliers



------------------------------------------------------------------ UNION ----------------------------------------------------------------------
-- Вертикальное объединение таблиц
-- Операторы
UNION только уникальные значения
UNION ALL все значения

---------- Примеры запросов --------------
SELECT Country FROM Customers
UNION
SELECT Country FROM Suppliers

--------------
SELECT City FROM Customers
WHERE Country = 'Germany'

UNION

SELECT City FROM Suppliers
WHERE Country = 'Germany'


--------------------------------------------------------------------
-- Задача. Вывести названия и цены трех самых дешевых товаров

SELECT ProductName, Price
FROM Products

ORDER BY Price ASC
LIMIT 3



-- Пример. Вывести названия и цены трех самых дорогих и самых дешевых товаров
(SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 3)

UNION

(SELECT ProductName, Price
FROM Products
ORDER BY Price ASC
LIMIT 3)




-- Работа с Git/GitHub
-- Просмотр состояния рабочего каталога
git status -s
-- PR - запрос на проверку кода (также запрос слияние)