-- ====== 1. =======
-- Схема БД соц/сеть
-- регистрация юзеров
-- создание публикаций
-- добавление в друзья
-- https://dbdiagram.io/d/65ca3fedac844320aef87faf

TABLE Users {
    user_id int [primary key] 
    username VARCHAR(50)
    first_name VARCHAR(50)
    last_name VARCHAR(50)
    birth_date DATE
    country VARCHAR(25)
    email VARCHAR(100)
    phone VARCHAR
    password_hash VARCHAR(255)
    created_at TIMESTAMP
}

TABLE Posts {
    post_id INT
    user_id INT
    created_at TIMESTAMP
    content VARCHAR(1000)
}


TABLE Friends {
    friendship_id INT 
    user1_id INT
    user2_id INT
    status VARCHAR(50)
}




-- ====== 2. =======
CREATE DATABASE IF NOT EXISTS webshop;

USE webshop;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),
    price FLOAT,
    category VARCHAR(64)
);

INSERT INTO products (title, price, category) VALUES ('Bubble gum', 30, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Roses', 20, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Sea', 15, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Peach of love', 60, 'Candles');
INSERT INTO products (title, price, category) VALUES ('Strawberry', 30, 'Candles');


-- В рамках БД webshop создайте произвольную таблицу клиентов и добавьте несколько клиентов
CREATE TABLE IF NOT EXISTS clients (
    id int primary key auto_increment,
	fullname varchar(128) not null,
	country varchar(125) not null,
	created_at timestamp default current_timestamp,
	is_blocked bool default false
);
INSERT INTO clients (fullname, country) VALUES ('Max Musterman', 'Germany'),
                                                ('Steven Jonsen', 'USA'),
                                                ('John Smith', 'UK'),
                                                ('Alias Gergano', 'Spain');
