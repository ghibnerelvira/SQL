-- https://western-appeal-39b.notion.site/GenTech-4-Jan-10-2024-d3a7ccb89c984a839ab33c006bfed7c0


--------- Проектирование баз данных

-- - один из этапов (подэтап) проектирования программного продукта
-- - сводится к определению схемы БД, включая связи между сущностями (таблицами, коллекциями)

--------- Ключевые поля

-- - **первичный ключ** - идентификатор каждой сущности (объекта)
-- - **внешний ключ** - необходим для связи между таблицами

---------- Первичный ключ

-- **Свойства**
-- - уникальный
-- - не пустой
-- - неизменяемый

-- **Стандартные подходы к определению значения**
-- 1. Авто-инкремент
-- 2. `UUID`, `GUID`, `ULID` - случайные значения

-- UUID
-- https://www.uuidgenerator.net/version4
-- занемает больше места, дольше времени на генирацию
-- недает данные конкурентам 
-- GUID -> от microsoft

----------- Общие вопросы эксплуатации БД и СУБД

-- 1. На одном сервере могут находиться несколько **СУБД** (**DBMS**)
--     1. **Сетевой порт** - сетевой идентификатор процесса (программы)
-- 2. В одной **СУБД** может находиться **БД**
-- 3. В одной **БД** может храниться несколько типов сущностей

-- 1. **Стандартный поход: ОДНА СУЩНОСТЬ == ОДНА ЗАПИСЬ**
-- 2. **Стандартный поход: ОДНА БД == ОДИН ПРОЕКТ**

------------- Общие этапы проектирования БД

-- 1. Анализ предметной области (бизнес-процессов)
-- 2. Выделение сущностей и их характеристик
-- 3. Связывание сущностей между собой (установление связей)
--     - с помощью ключей (ключевых полей)
--     - как правило, применяются для связи ключ `первичный` и `внешний`
-- 4. Проверка решения

-------------- Базовые типы связей между сущностями

-- `1:1` (один к одному)
-- `1:M` (один ко многим) - самый распространенный
-- `M:M` (многие ко многим)

--------------  Пример определения связей в БД “онлайн-магазин: песочница”

-- 1. Orders.CustomerID ( M:1 ) Customers.CustomerID   // Customers.CustomerID ( 1:M )Orders.CustomerID
-- 2. Orders.EmployeeID ( M:1 ) Employees.EmployeeID
-- 3. Orders.ShipperID ( M:1 ) Shippers.ShipperID
-- 4. Products.SupplierID ( M:1 ) Suppliers.SupplierID
-- 5. Products.CategoryID ( M:1 ) Categories.CategoryID
-- 6. OrderDetails.ProductID ( M:1 ) Products.ProductID
-- 7. OrderDetails.OrderID ( M:1 ) Orders.OrderID



--------- Основные типы данных в MySQL

-- каждый столбец (поле) таблицы должен иметь указание на тип данных


-- ### Числовые
-- int / integer
-- float


-- ### Строковые
-- varchar(x)
--     `x` - макс. ко-во символов
-- text(x)
--     `x` - макс. ко-во символов


-- ### Логические
-- bool

-- ### Дата / время
-- datetime
-- timestamp
-- date
-- time



------- Diagramm
-- ## Обязательные поля (почти) для любой сущности

-- - `первичный ключ`
-- - `дата/время` добавления записи в БД

-- https://dbdiagram.io/d/online_school_jan_10_2024-659e6a99ac844320ae9e360f
-- Produnct
-- Table students{
--     student_id int
--     fullname varchar(128)
--     group_id int
-- }

-- Order
-- Table groups{
--     group_id int
--     title varchar(64)
-- }

-- OrderDitails
-- Table student_attachments {
--     id int
--     student_id int
--     student_id int
--     start date
--     finish date
-- }

-- ## Видео-хостинг

-- **Базовые сущности**

-- - `юзеры`
-- - `видео-ролики`
-- - `комментарии (на видео)`
-- - `реакции (на видео)`
-- - `плейлист`

-- https://dbdiagram.io/d/659e779aac844320ae9f72f6

-- // Use DBML to define your database structure
-- // Docs: https://dbml.dbdiagram.io/docs

-- Table users {
--   user_id int
--   username varchar
--   email VARCHAR(255)
--   password VARCHAR(255)
--   create_at TIMESTAMP
-- }

-- Table videos {
--   video_id INT 
--   user_id INT
--   reaction_id INT
--   playlist_id INT
--   duration_sec INT
--   title VARCHAR(255)
--   url VARCHAR(255)
--   create_at TIMESTAMP 
-- }

-- Table comments {
--   comment_id INT
--   video_id INT
--   user_id INT
--   content TEXT
--   create_at TIMESTAMP
-- }

-- Table reactions {
--   reaction_id INT
--   video_id INT
--   user_id INT
--   reaction_type VARCHAR(50)
--   create_at TIMESTAMP
-- }

-- Table playlists {
--   playlist_id INT
--   user_id INT
--   video_id INT
--   title VARCHAR(255)
--   description TEXT
--   created_at TIMESTAMP
-- }

-- Table playlist_videos {
--   id INT
--   create_at TIMESTAMP
--   video_id INT
--   playlist_id INT
-- }


-- Ref: "playlists"."user_id" < "users"."user_id"

-- Ref: "reactions"."user_id" < "users"."user_id"

-- Ref: "reactions"."video_id" < "videos"."video_id"

-- Ref: "comments"."video_id" < "videos"."video_id"

-- Ref: "videos"."user_id" < "users"."user_id"

-- Ref: "comments"."user_id" < "users"."user_id"

-- Ref: "reactions"."reaction_id" < "videos"."reaction_id"

-- Ref: "playlists"."playlist_id" < "videos"."playlist_id"



-- Ref: "playlists"."title" < "videos"."title"

-- Ref: "users"."create_at" < "playlists"."created_at"

-- Ref: "playlists"."video_id" < "videos"."video_id"

-- Ref: "reactions"."create_at" < "users"."create_at"

-- Ref: "videos"."create_at" < "users"."create_at"

-- Ref: "comments"."create_at" < "users"."create_at"

-- Ref: "playlist_videos"."playlist_id" < "playlists"."playlist_id"

-- Ref: "playlist_videos"."video_id" < "videos"."video_id"

-- Ref: "playlist_videos"."create_at" < "users"."create_at"