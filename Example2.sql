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

#(b)
select employee_name from employee
where city='Rajshahi';
#(c)
select employee_name, street from employee
where city='Rajshahi';

#(d)
select employee_name from works
where company_name='Sonali';
select employee_name from works
where company_name='Agrani';
select employee_name from works
where company_name='Janata';

#(e)
select employee_name,salary from works
where company_name='Sonali';
select employee_name,salary from works
where company_name='Agrani';
select employee_name,salary from works
where company_name='Janata';

#(f)
select employee_name from works
where salary=12000;
select employee_name from works
where salary>=12000;
select employee_name from works
where salary<12000;

#(g)
select employee_name,company_name from works
where salary=12000;
select employee_name, company_name from works
where salary>=12000;
select employee_name,company_name from works
where salary<12000;

#(h)
select e.employee_name, e.street, e.city 
from employee  e
join works w 
on e.employee_name = w.employee_name
where w.company_name='Agrani';

#(i)
SELECT e.employee_name, street,city 
from employee e
join works w 
on w.employee_name = e.employee_name
where salary>10000;

#(j)
SELECT w.employee_name, w.company_name,salary 
from works w 
join employee e 
on w.employee_name = e.employee_name
where city='Rajshahi';

#(k)
select e.employee_name, e.street, e.city, w.company_name
from employee e 
join works w
on e.employee_name = w.employee_name
where salary>=10000;

#(L)
select e.employee_name, e.street, e.city 
from employee e 
join works w
on w.employee_name = e.employee_name
where company_name='Sonali' and salary>12000;
#(M)
select e.
from employee e
join works w
on w.employee_name = e.employee_name
where company_name !='Sonali';

#(N)
UPDATE employee
set city='Natore' where employee_name='Arif';
SELECT * from employee

#(o)
update works 
set salary= salary+(salary * 0.1)
where company_name = 'Agrani';
SELECT * FROM works WHERE company_name = 'Agrani';

#(P)
delete from employee
where employee_name='Sagor';
select * from employee;

#(Q)
Alter Table works
add manager VARCHAR(15);
SELECT * FROM works;
