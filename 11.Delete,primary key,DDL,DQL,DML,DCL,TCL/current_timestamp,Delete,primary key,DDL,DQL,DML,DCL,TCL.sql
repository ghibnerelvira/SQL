-- https://sqliteonline.com  <- песочница
-- https://western-appeal-39b.notion.site/GenTech-7-Jan-31-2024-6266862efcb64786a29329d83fa70f45

---------------------------------------------------------- Структура SQL ----------------------------------------------------------

-- - `DQL` (Data Query Language)
--     - `SELECT`
--     - `SELECT DISTINCT`

-- - `DDL` (Data Definition Language)
--     - `CREATE` - создать объект (напр., БД, таблица и т.д.)
--     - `DROP` - удалить
--     - `ALTER` - изменить
--     - `RENAME` - переименовать

-- - `DML` (Data Manipulation Language)
--     - `INSERT INTO` - добавить записи
--     - `UPDATE` - изменить записи
--     - `DELETE` - удалить записи

-- - `DCL` (Data Control Language)
-- - `TCL` (Transaction Control Language)

-------------------------------------------------------  Основные типы данных в MySQL ------------------------------------------------------- 

-- - каждый столбец (поле) таблицы должен иметь указание на тип данных
 

-- ===== Числовые =====

-- - `int` / `integer`
-- - `float`


-- ===== Строковые =====

-- - `varchar(x)`
--     - `x` - макс. ко-во символов
-- - `text(x)`
--     - `x` - макс. ко-во символов


-- ===== Логические =====

-- - `bool`


-- ===== Дата / время =====

-- - `datetime` / `timestamp`
-- - `date`
-- - `time`

-- # SQL: DDL


-- ============= Создание БД =============

-- ```sql
-- CREATE DATABASE db_name;
-- CREATE DATABASE IF NOT EXISTS db_name;
-- ```

-- ============= Создание таблиц =============

-- ```sql
-- CREATE TABLE <название_таблицы> (<структура>);

-- CREATE TABLE users (
-- 	-- название_поля тип_данных доп_хар-ки
--     id int
-- );
-- ```

-- ============= Удаление таблиц =============

-- ```sql
-- DROP TABLE table_name;
-- DROP TABLE IF EXISTS table_name;
-- ```

-- ============= Создание таблицы `users` =============

-- Создать таблицу videos
CREATE TABLE videos (
		id int primary key auto_increment,
    created_at timestamp,
    title varchar(128),
		author_id int,
    duration_secs int
);

-- =================================================== SQL CRUD: Create / добавление / Оператор INSERT INTO ===================================================
-- Пример. Добавить юзеров в таблицу users
INSERT INTO users (created_at, fullname, email, country, is_blocked)
VALUES
  (current_timestamp(), 'Ivan Ivanov', 'ivan@example.org', 'Germany', False),
  (current_timestamp(), 'User 2', 'ivan@example.org', 'Germany', False),
  (current_timestamp(), 'User 3', 'user3@example.org', 'USA', False),
  (current_timestamp(), 'User 4', 'u4@example.org', 'Germany', False),
  (current_timestamp(), 'User 5', 'me@example.org', 'USA', False);


-- Пример. Вывести всех юзеров
SELECT *
FROM users

-- ==== Задача ====
-- Добавить несколько видео-роликов в таблицу videos
INSERT INTO videos (created_at, title, author_id, duration_secs)
VALUES
	(current_timestamp(), 'About USA', 1, 3600),
    (current_timestamp(), 'About me', 1, 7200),
	(current_timestamp(), 'About YOU', 2, 600),
    (current_timestamp(), 'About Germany', 3, 820),
	(current_timestamp(), 'About France', 5, 1200),
    (current_timestamp(), 'About Brazil', 5, 5600);

-- =================================================== SQL CRUD: Delete / удаление записей / Оператор DELETE FROM ===================================================
-- Пример. Очистить таблицу
DELETE FROM videos;

-- Пример. Удалить видео 12
DELETE FROM videos
WHERE
	id = 12;

-- =================================================== SQL CRUD: Update / модификация / Оператор UPDATE ===================================================
-- Пример. Изменить страну пользователя 1 на USA
UPDATE users
SET
	country = 'USA'
WHERE
	id = 1


-- =============================================================== Задачи ===============================================================

-- ==== 1. ====
-- Удалить (очистить) email-адреса у юзеров 3 и 4
UPDATE users
	SET email = ''
WHERE
	id IN (3, 4)


-- ==== 2. ====
-- Изменить название видео 2 (или другое) на произвольное
UPDATE videos
	SET title = 'NEW TITLE'
WHERE
	id = 11


-- ==== 3. ====
-- Вывести данные о видео-роликах
-- (проекция: название_видео_ролика, имя_автора)
select
	users.fullname,
	videos.title
from videos

join users on videos.author_id = users.id


-- ==== 4. ====
-- Вывести общую продолжительность видео-роликов
select
	sum(duration_secs) as total_duration_secs
from videos;

-- ==== 5. ====
-- Задача. Вывести видео-ролики юзеров из France (или другой страны)
SELECT 
	videos.title, 
	users.fullname 
FROM videos

JOIN users on videos.author_id = users.id 

WHERE
	users.country = 'Germany'

-- ==== 6. ====
-- Задача. Вывести среднюю продолжительность видео-роликов по странам
select
	users.country,
	avg(videos.duration_secs) as avg_duration
from videos

join users on users.id = videos.author_id

group by users.country;

-- ==== 7. ====
-- Создать таблицу реакций (оценки на видео) и добавить в нее 10 записей
create table video_reactions (
	id int primary key auto_increment,
	created_at timestamp,
	video_id int,
	author_id int,
	value int
);

insert into video_reactions (created_at, video_id, author_id, value)
values
	(current_timestamp(), 1, 1, 2),
	(current_timestamp(), 3, 5, 10),
	(current_timestamp(), 2, 2, 9),
	(current_timestamp(), 1, 3, 8),
	(current_timestamp(), 1, 1, 5),
	(current_timestamp(), 2, 4, 4),
	(current_timestamp(), 4, 1, 1),
	(current_timestamp(), 1, 1, 10),
	(current_timestamp(), 3, 1, 10),
	(current_timestamp(), 1, 4, 10);
