-- 1.
-- Схема БД “платежная система”

-- Базовые сущности
-- юзеры
-- счета (аккаунты)
-- транзакции


-- https://dbdiagram.io/d/65ca4092ac844320aef88ca5


-- 2.
-- В рамках БД music:
create database if not exists music;
use music;

create table users (
	id int primary key auto_increment,
	fullname varchar(128) not null,
	country varchar(64) not null,
	created_at timestamp default current_timestamp,
	is_blocked bool default false
)
INSERT INTO users (fullname, country) VALUES ('Max Musterman', 'Germany'),
                                             ('Steven Jonsen', 'USA'),
                                             ('John Smith', 'UK'),
                                             ('Alias Gergano', 'Spain');

-- Создать таблицу комментариев (comments) с использованием механизма валидации данных в SQL (DDL)
create table if not exists comments (
    id int primary key auto_increment,
    user_id int,
    fullname varchar(128) not null,
    country varchar(128) not null,
    comment_text varchar(128) not null,
    comment_date timestamp default current_timestamp,
    
    foreign key (user_id) references users(id)
);

-- Добавить в таблицу комментариев несколько записей (CRUD)
INSERT INTO comments (user_id, fullname, country, comment_text)
VALUES 
    (1, 'Max Musterman', 'Germany', 'Отличная статья!'),
    (2, 'Steven Jonsen', 'USA', 'Thank you for your information.'),
    (3, 'John Smith', 'UK', 'Great post, thanks!'),
    (4, 'Alias Gergano', 'Spain', 'Gratias');



-- Вывести ко-во комментариев на каждый трек (в упорядоченном виде) (COUNT())
SELECT 
    users.id, 
    users.fullname, 
    COUNT(comments.id) AS comment_count
FROM users

JOIN comments ON users.id = comments.user_id

GROUP BY users.id, users.fullname
ORDER BY comment_count DESC;

