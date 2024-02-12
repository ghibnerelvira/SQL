create database if not exists bank;
use bank;
create table if not exists users (
    id int primary key auto_increment,
    created_at timestamp default current_timestamp,
    country varchar(128) not null,
    fullname varchar(128) not null,
    is_blocked boolean default false
);
INSERT INTO users (created_at, country, fullname, is_blocked) VALUES (current_timestamp, 'Germany', 'Max Mustermann', false),
                                                                     (current_timestamp, 'Spain', 'Alias Gergano', false),
                                                                     (current_timestamp, 'USA', 'Steven Jonsen', false),
                                                                     (current_timestamp, 'Germany', 'Lili Göttermann', false);

create table if not exists accounts (
    id int primary key auto_increment,
    created_at timestamp default current_timestamp,
    currensy varchar(128) not null,
    owner_id int,
    is_blocked boolean default false,
    
    FOREIGN KEY (owner_id) REFERENCES users(id)  -- зашита от дубликатов
);
INSERT INTO accounts (currensy, owner_id) VALUES ('EUR', 1),
                                                 ('EUR', 2),
                                                 ('EUR', 3),
                                                 ('EUR', 4),
                                                 ('EUR', 5)


-- удаление 
-- DROP TABLE IF EXISTS accounts;


-- Создать таблицу транзакций txs
create table if not exists txs (
    transaction_id int primary key auto_increment, 
    from_account_id int,
    to_account_id int,
    amount double,
    transaction_date timestamp default current_timestamp,
    comment varchar(128) not null
);
-- Перевести 1000 EUR от между юзерами 1 → 2
INSERT INTO txs (from_account_id, to_account_id, amount, comment)
VALUES (1, 2, 1000, 'Перевод от пользователя 1 пользователю 2');