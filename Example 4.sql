create table employee(
    employee_name VARCHAR(15) primary key,
    street VARCHAR(15),
    city VARCHAR(15)
);
select * from employee;
insert into employee(employee_name,street,city)
values ('Arif','51 Upashahar','Rajshahi'),
    ('Sumon','52 east','Moynamati'),
    ('Sagor','Neemgachhi','Sirajgong'),
    ('Abdul','Binodpur','Rajshahi'),
    ('Himesh','Nazrul Avenue','Dhaka'),
    ('Amirul','Chawk bazar','Sylhet'),
    ('Sajib','99 north','Chittagong');

create Table works(
    employee_name VARCHAR(15) primary key,
    company_name VARCHAR(15),
    salary DECIMAL(10,2)
);

select * from works;

insert into works(employee_name, company_name, salary)
values ('Sumon','Agrani',12000),
    ('Abdul','Sonali',13000),
    ('Himesh','Agrani',6000),
    ('Amirul','Sonali',20000),
    ('Sagor','Sonali',8000),
    ('Arif','Janata',13000),
    ('Sajib','Janata',9000);
create table company(company_name varchar(15) primary key,
    city varchar(10));
select * from company;
insert into company(company_name,city) VALUES
('Agrqani','Rajsahi'),
('Sonali','Sylhet'),
('Janata','Dhaka');
create table manager(
    employee_name varchar(15) primary key,
    manager_name varchar(15)
);
select * from manager;
insert into manager(employee_name,manager_name) VALUES
('Amirul','Amirul'),
('Abdul','Amirul'),
('Sagor','Amirul'),
('Sumon','Sumon'),
('Himesh','Sumon'),
('Arif','Arif'),
('Sajib','Arif');

#(b)
select e.employee_name
from employee e
join works w 
on e.employee_name=w.employee_name
where w.company_name='Sonali';

#(c)
select e.employee_name, e.street, e.city
from employee e
join works w 
on e.employee_name=w.employee_name
where w.company_name='Agrani';

#(d) Find the names, streets and cities residence of all employees who work for “Sonali” and earn more than 1,20,000 per annum.

select e.employee_name, e.street, e.city
from employee e
join works w 
on e.employee_name=w.employee_name
where w.company_name='Sonali' and salary*12 >120000;

#(e)
select e.employee_name
from employee e 
join works w 
on w.employee_name=e.employee_name
join company c
on c.company_name=w.company_name
where e.city=c.city;

#(f)
SELECT e.employee_name
FROM employee e
JOIN manager m
 ON e.employee_name = m.employee_name
JOIN employee mgr 
ON m.manager_name = mgr.employee_name
WHERE e.city = mgr.city
  AND e.street = mgr.street;
   
#(g)
select e.employee_name 
from employee e
join works w 
on w.employee_name=e.employee_name
where company_name !='Sonali';

#(h)
select employee_name from works
where salary > all(
    select salary from works
    where company_name="Janata"
);

--(i)Find all employees who earn more than the average salary of all employees of their companies.
select w.employee_name from works w
where salary>(
    select avg(w2.salary)
    from works w2
    where w.company_name = w2.company_name
);

--(r)Define a view consisting of manager-name and average salary of all employees who work for that manager. Now try to modify that view.
create view manager_avg_salary AS
select manager_name,
    avg(w.salary)
    from manager m
    join works w 
    on w.employee_name = m.employee_name
    GROUP BY m.manager_name;
select * from manager_avg_salary;

UPDATE works
set salary=18000
WHERE employee_name='Amirul';

--(p) Give all managers a 10 percent salary raise unless salary becomes greater than 19,000;
-- in such cases, give only a 3 percent salary raise.
UPDATE works
SET salary = CASE
    WHEN salary * 1.10 < 19000 THEN salary * 1.10
    ELSE salary * 1.03
END
WHERE employee_name IN (
    SELECT DISTINCT manager_name
    FROM manager
);

--(o)Give all managers of “Agrani” Bank a 10 percent salary raise.

SELECT * from works;
update works
set salary = salary *1.10
where employee_name IN(
    select DISTINCT manager_name
    from manager
) and company_name='Agrani';

--(n)Give all employees of “Agrani” Bank  10 percent raise.

 update works 
 set salary=salary*1.10
 where company_name='Agrani';

--(m)Modify the database so that “Arif” now lives in Natore.
update employee
set city='Natore'
where employee_name='Arif';

--(l)Find those companies whose employees earn a higher salary, on average,
-- than the average salary at “Agrani” Bank.
SELECT company_name
FROM works
GROUP BY company_name
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'Agrani'
);
--(k)Find the company that has the smallest payroll.
select company_name
from works
GROUP BY company_name
ORDER BY sum(salary) ASC
LIMIT 1;

--(j)Find the company that has the most employees.
select company_name
from works
GROUP BY company_name
ORDER BY count(employee_name) DESC
limit 1;

--(i)Find all employees who earn more than the average salary of all employees of their companies.
select employee_name from works w
where salary>(
    select AVG(salary)
    from works company_name
    where w.company_name=company_name
);

--(h)Find all employees in the database who earn more than each employee of  “Janata” Bank
SELECT employee_name
from works
where salary> all(
    SELECT salary
    from works w
    WHERE w.company_name='Janata'
);

SELECT * FROM works;

--(g)Find all employees in the database who do not work for “Sonali” Bank.
select employee_name from works
WHERE company_name!='Sonali';

--(f)Find all employees in the database who live in the same cities and on the same streets as do their managers.
SELECT e.employee_name 
from employee e
join manager m
on e.employee_name = m.employee_name
join employee em
on em.employee_name=m.manager_name
where em.city=e.city
and em.street=e.street;

--(e)Find all employees in the database who live in the same cities as the companies for which they work.
SELECT e.employee_name
from employee e
join works w
on w.employee_name=e.employee_name
join company c
on c.company_name=w.company_name
WHERE c.city=e.city;

--(d)  Find the names, streets and cities residence of all employees who work for “Sonali” and earn more than 1,20,000 per annum.
select e.employee_name, e.street, e.city
from employee e
join works w 
on e.employee_name=w.employee_name
where w.company_name='Sonali' and salary*12 >120000;

--(c)Find the names, streets and cities residence of all employees who work for “Agrani”.
select e.employee_name, e.street, e.city
from employee e
join works w 
on e.employee_name=w.employee_name
where w.company_name='Agrani';

--(b)Find the names of all employee who work for “Sonali”.
SELECT employee_name
from works
WHERE company_name='Sonali';

--(q)Delete all tuples in the works relation for employees of “Janata” Bank.
delete from works
where company_name='Janata';
SELECT * FROM works;
