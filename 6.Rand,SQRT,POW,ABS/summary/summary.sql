select * from jobs;
select * from employees;
select * from departments;
select * from locations;


select employees.first_name, employees.last_name, jobs.job_title
from employees
join jobs on employees.job_id = jobs.job_id;


-- Вывести имя, фамилию, зарплату, должность(job_title) и минимальную зарплату(MIN_SALARY) для этой должности для всех сотрудников.
select t1.first_name, t1.last_name, t1.salary, t2.job_title, t2.min_salary
from employees t1
join jobs t2 on t1.job_id = t2.job_id;


-- Вывести имя, фамилию, должность(job_title), департамент(department_name) и название города(city), где находится департамент.
select 
	t1.first_name, 
	t1.last_name, 
	t2.job_title, 
    t3.department_name, 
    t4.city
from 
	employees t1
join 
	jobs t2 on t1.job_id = t2.job_id
join 
	departments t3 on t1.department_id = t3.department_id
join
	locations t4 on t3.location_id = t4.location_id


-- Вывести имя, фамилию, зарплату, должность, минимальную и 
-- максимальную зарплату для этой должности только тех сотрудников, 
-- у которых зарплата равняется либо минимальной зарплате, либо максимальной.
select 
	t1.first_name, 
	t1.last_name,
    t1.salary,
	t2.job_title,
    t2.min_salary,
    t2.max_salary
from 
	employees t1
join
    jobs t2 on t1.job_id = t2.job_id
where
    t1.salary = t2.min_salary or t1.salary = t2.max_salary;
    
-- Вывести имя, фамилию, должность и название департамента только тех работников, 
-- которые находятся в Великобритании(UK).
select 
	t1.first_name, 
	t1.last_name,
	t2.job_title,
    t3.department_name
from 
	employees t1
join 
	jobs t2 on t1.job_id = t2.job_id
join 
	departments t3 on t1.department_id = t3.department_id
join
	locations t4 on t3.location_id = t4.location_id
WHERE
    t4.country_id = 'UK';


-- функции для роботы с числами

select 5 as value;

select -5 as value;

select 5.23 as value;


-- ABS: возвращает абсолютное значение числа
select abs(-25) as abs;

-- pow(m, n): возвращает m, ввозведенную в степень n. (4 hoch 2 = pow) 
select pow(4, 2) as pow;

-- round: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление
select round(12.345, 2) as round_1;
select round(1234.345, -2) as round_2;


-- SQRT: получает квадратный корень числа.
select sqrt(225) as sqrt;


-- rand: гинерация случайного числа с плавающей точкой в 
select rand() as rand;

select round(rand(), 2) as rand;

select round(rand()*10, 2) as rand;

select pow(job_id, 2)
from jobs;