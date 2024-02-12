-- https://western-appeal-39b.notion.site/GenTech-8-Feb-7-2024-95e0e565f64c46019cbe7d92a90a4e21

-- Отличие БД от СУБД

-- БД - данные, как таковые
-- СУБД - прикладное ПО

-- Типы связей
-- - `1:1`
-- - `1:M` - самый распр.
-- - `M:M`


-- ......... Пример. Создать БД music ..........
-- create database if not exists music



-- ====================== Задача. Создать таблицу users ======================
-- create table users (
-- 	id int,
-- 	fullname varchar(128),
-- 	country varchar(64),
-- 	created_at timestamp,
-- 	is_blocked bool
-- )
-- -------------------------------
-- create table users (
-- 	id int primary key auto_increment,
-- 	fullname varchar(128) not null,
-- 	country varchar(64) not null,
-- 	created_at timestamp default current_timestamp,
-- 	is_blocked bool default false
-- )



-- .......... Валидация данных в SQL / SQL Constraints ..........

-- - По сути, представляет собой правила (ограничения)
-- - Позволяет повысить целостность БД и удобство работы




-- .......... Основные ограничения (правила): ..........

-- - `primary key` (`unique + not null`)
-- - `unique` уникальное
-- - `not null` не пустое
-- - `foreign key` внешний ключ
-- - `check` проверка условий
-- - `default` установка значения по умолчания




-- .......... Пример. Удалить таблицу users ..........
-- drop table users




-- .......... Пример. Добавить пять юзеров в таблицу users ..........
-- INSERT INTO users (fullname, country)
-- VALUES
-- 		('Petr Petrov', 'Germany'),
--     ('Hacker', 'USA'),
--     ('User X', 'USA'),
--     ('Nobody', 'France'),
-- 		('Ivan Ivanov', 'Germany')




-- ====================== Задача. Создать таблицу tracks с применением мех. валидации данных ======================
-- create table tracks (
--     id int auto_increment primary key,
--     created_at timestamp default current_timestamp,
--     title varchar(128) not null,
--     is_published bool default false,
--     duration_secs int not null,
--     author_id int 
-- );

-- create table tracks (
--     id int auto_increment primary key,
--     created_at timestamp default current_timestamp,
--     title varchar(128) not null,
--     is_published bool default false,
--     duration_secs int not null check(duration_secs > 0),
--     author_id int not null,
--     foreign key (author_id) references users(id)
-- );



-- .......... Пример. Добавить один трек ..........
-- INSERT INTO tracks (title, duration_secs, author_id)
-- VALUES
-- 	('Track N', 500, 2)



-- ====================== Задача. Создать таблицу reactions (оценки на видео) ======================
-- create table reactions (
--     id int primary key auto_increment,
--     created_at timestamp default current_timestamp,
--     value int not null check (value between 1 and 5),
--     author_id int not null,
--     track_id int not null,
    
--     foreign key (author_id) references users (id),
--     foreign key (track_id) references tracks (id)
-- );



-- ====================== Задача. Добавить несколько произвольных оценок (реакций) в таблицу reactions ======================
-- insert into reactions (`value`, author_id, track_id)
--     values
-- 		(2, 2, 2),
-- 		(5, 1, 2),
-- 		(4, 3, 3)



-- ====================== Задача. Вывести данные о треках ======================

-- (проекция: `название_трека`, `продолжительность`, `имя_автора`)

-- SELECT
-- 		tracks.title,
--     tracks.duration_secs,
--     users.fullname as author_fullname
-- FROM tracks

-- JOIN users ON tracks.author_id = users.id




-- ====================== Задача. Очистить поле `country` юзерам `2` и `4` ======================

-- UPDATE users
-- SET country = ''
-- WHERE
-- 	id IN (2, 4)




-- ====================== Задача. Вывести среднюю оценку на все треки ======================
-- SELECT
-- 	AVG(value) as avg_value
-- FROM reactions



-- ............... Схема БД “платежная система” ...............

-- Базовые сущности:
-- - юзеры
-- - счета (аккаунты)
-- - транзакции