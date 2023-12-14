-- Конспект занятия
-- https://western-appeal-39b.notion.site/GenTech-1-Dec-6-2023-67a3b7ee27574934a879c6f51c051b2d?pvs=4
-- https://support.microsoft.com/ru-ru/office/предикаты-all-distinct-distinctrow-и-top-24f2a47d-a803-4c7c-8e81-756fe298ce57
-- повторение
-- https://western-appeal-39b.notion.site/GenTech-Summary-Dec-11-2023-b46098a7a8484e28a0c0320f4744bde9 + Git/GitHub

-- SELECT  вывод

-- SELECT 
-- 	CustomerName,
--     	Country,
--     	City
-- FROM Customers

-- WHERE
-- 	Country= 'France' 
-- 	&&
--     	City = 'Paris'


-- унарный оператор (Not != ) или (NOT)или (<>)
-- Бинарный оператор   
-- ( AND && ) или (лучше писать -> AND)
-- Вывод двух разных элементов
-- WHERE
-- 	Country= 'France' &&
--     	City= ‘Paris’

-- SELECT DISTINCT -- список уникальных стран(нет повтора)
-- 	CustomerName,
--     Country
-- FROM Customers

-- WHERE
--      NOT Country = 'UK' 
--      AND
--      NOT Country = 'USA' 



-- ( OR || ) или ( OR)
-- WHERE
-- 	Country= 'France' ||
--     	Country = 'USA'
-- Вывод двух элементов одинаковых 

-- SELECT
-- 	CustomerName,
--     Country
-- FROM Customers

-- WHERE
--      NOT (Country = 'UK' OR Country = 'USA' )


-- iPO model-> Input - Prozessing- Output
-- 2 + 2 = 4
-- I  p  I  p O
    



-- SELECT
-- 	ProductName,
--     Price
-- FROM Products

-- WHERE
-- 	Price >= 50 AND Price <= 100
--      (Или Price  BETWEEN 50 AND 100 ; )