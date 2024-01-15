-- Конспект занятия
-- https://western-appeal-39b.notion.site/GenTech-2-Dec-13-2023-f40e1867231e4b00a33640f4032a7aa6

-- Algoritm p*..^2

-- "Программа" и "алгоритм" - это два термина, которые, хотя и связаны 
-- с программированием, имеют разные значения.

-- * Алгоритм:
--     * Определение: Алгоритм представляет собой последовательность шагов 
--      или инструкций, предназначенных для решения конкретной задачи или 
--      выполнения определенной операции.

--     * Абстракция: Алгоритм является абстрактным планом действий, который 
--      может быть реализован в виде программы, но не обязательно связан с конкретным языком программирования.

--     * Универсальность: Алгоритм может быть описан на естественном языке, в виде 
--      блок-схемы или псевдокода, а также реализован в программном коде.


-- * Программа:
--     * Определение: Программа - это конкретная реализация алгоритма с использованием 
--      конкретного языка программирования. Это исполняемый код, который может быть выполнен 
--      компьютером для решения определенной задачи.

--     * Спецификация: Программа содержит детали, такие как синтаксис, переменные, операторы, 
--      и другие элементы языка программирования.

--     * Конкретность: Программа - это уже конкретная реализация абстрактного алгоритма, 
--      предназначенная для выполнения на компьютере.

-- Таким образом, алгоритм представляет собой общий план действий, в то время 
-- как программа - это конкретное исполнение этого плана в виде кода, который может быть выполнен компьютером.



-- * Алгоритм: Абстрактный план действий для решения задачи.
-- * Программа: Конкретная реализация алгоритма на определенном языке программирования, готовая к выполнению компьютером.

-- Алгоритм: Абстрактный план, как осуществить эту проверку.
-- Программа: Конкретный код, написанный на языке программирования, который фактически выполняет эту проверку.

-- CRUD -> create, read, update, delete
-- BETWEEN -> Осуществляет проверку входа в заданный диапазон значений., является синтаксическим сахаром

-- конверктация € -> $
-- 1€ -> 1.08$      (1*1.08)
-- SELECT
-- 	ProductName,
--     Price * 1.08
-- FROM Products


-- AS -> kак

-- euro price 
-- SELECT
-- 	ProductName,
--     Price AS Price_eur,
--   Price * 1.08 AS Price_usd
-- FROM Products

-- SELECT *,
-- 	Price * 1.08 AS Price_usd
-- FROM Products; 



-- 1. 
-- ценна со скидкой в 10%
-- SELECT
-- 	ProductName,
-- 	Price * 0.9 AS DiscountedPrice
-- FROM Products;


-- 2. 
-- ценна с наценкой в 15% / ценна со скидкой в 25%
-- SELECT
-- 	ProductName,
--     Price AS price_full,
-- 	   Price * 0.75 AS price_down,
--     Price * 1.15 AS price_up
-- FROM Products;


-- потоковое вешяние для формата видео и аудио 


-- сылка на гинерацию hash (https://emn178.github.io/online-tools/sha256.html)
-- Пароль хранится(запись) в базе данных через  hash для того чтобы было sicher 
-- qwerty123
-- hash (длина не миняется)
-- 97f2c69f41e3b60cf198290f87fe917775553ca38c203f228f3830a8ba95a831

--         (...................................) сикретный ключ в разных компаниях разный
-- qwerty123_4i*jdhvbs5sjcn_3inbcd_cndcnlaö$jc_   (_SALT_)
-- hash (делается для того чтобы пороль небыл взломан)
-- 97f2c69f41e3b60cf198290f87fe917775553ca38c203f228f3830a8ba95a831


-- фильтр по убыванию и возврастанию
-- SELECT *
-- FROM Products
-- ORDER BY Price DESC
	-- DESC - по убыванию
	-- ASC - по возрастанию (по умолчанию)

    -- ORDER BY Price DESC, ProductName ASC

-- все кроме 1 постовщика
-- SELECT *
-- FROM Products

-- WHERE
--      SupplierID = 1

-- ORDER BY Price ASC





-- LIMIT 
-- строница в кноце скролла 1,2,3..
-- SELECT * FROM Products

-- ORDER BY Price DESC

-- LIMIT 3 OFFSET 0 -> страница 1
-- OFFSET начинается с index ->  0, 1, 2...

-- смешение / показать только 2 страницу -> OFFSET указывает
-- LIMIT 3 OFFSET 3 -> страница 2
-- LIMIT 3 OFFSET 6 -> страница 3
-- LIMIT 3 OFFSET 9 -> страница 4

-- на практике
-- LIMIT 3 OFFSET x -> переменая 

-- PAGE  = 1  -- страницы
-- LIMIT = 10 -- сколько товаров выводить на страницу

-- OFFSET = ?
-- OFFSET = (PAGE - 1) * LIMIT -> формула
-- OFFSET = (1 - 1) * 10 = 0 -> page 1
-- OFFSET = (2 - 1) * 10 = 10 -> page 2


-- OFFSET = LIMIT * PAGE - LIMIT


--  Вывести один товар, который находится на третьем месте среди самых дешевых
-- SELECT *
-- FROM Products

-- ORDER BY Price ASC
-- LIMIT 1 OFFSET 2  -- ограничить вывод одной строкой со смещением в две строки


-- OFFSET пропусакает


-- 3 -> 2