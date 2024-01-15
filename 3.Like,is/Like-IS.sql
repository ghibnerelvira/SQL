-- LIKE 
-- Выборка 

select * from Staff
where firstname = 'Anna';

select * from Staff
where firstname In ('Anna');

select * from Staff
where firstname Like 'Anna'; -- 'Anna'-> только имя Anna

select * from Staff
where firstname Like 'A%'; -- 'A%' -> первая буква

select * from Staff
where firstname Like '%r'; -- '%r'-> последняя буква

select * from Staff
where firstname Like 'A%r';  -- 'A%r'-> первая и последняя букв

select * from Staff
where firstname Like 'An%'; -- An% -> первая и вторая букв

select * from Staff
where firstname Like '_a%'; -- '_a%'-> вторая (позиция) буква

select * from Staff
where firstname Like '____'; -- 4 позиций



-- список работников, у которых средний уровень должности (middle) и им больше 20 лет
select * from Staff
where position Like '%middle%'; 


-- Найти список работников, у которых имя начинается с буквы А и у них нет детей,
SELECT * FROM Staff
WHERE 
    firstname LIKE 'A%' 
    AND 
    has_child LIKE 'N'; -- has_child is null / has_child = 0



-- Найти первых трех сотрудников, чьи имена начинаются на A
SELECT * FROM Staff
WHERE 
    firstname LIKE 'A%' 

LIMIT 3;  


-- Найти сотрудников с id 4, 12, 19
SELECT * FROM Staff
WHERE 
    id IN (4, 12, 19);


-- Найти список работников с именем Анна, у которых уровень должности либо средний(middle), либо старший(senior),
-- 1. Вариант
SELECT * FROM Staff
WHERE 
    firstname LIKE 'Anna' 
    AND 
    (position LIKE '%middle%' OR position LIKE '%senior%');

-- 2. Вариант
SELECT * FROM Staff
WHERE 
    firstname LIKE 'Anna' 
    AND 
    position  NOT LIKE '%junior%';

-- 3. Вариант
SELECT * FROM Staff
WHERE 
    firstname LIKE 'Anna' 
    AND 
    position IN ('middle', 'senior');



-- Найти список работников, у который юзернейм заканчивается на ‘1’,
SELECT * FROM Staff
WHERE 
    username LIKE '%1';


-- Найти список работников, у который юзернейм состоит из 5 символов
SELECT * FROM Staff
WHERE 
    username LIKE '_____';