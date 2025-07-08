show databases
use lab_practice
show tables
select * from Employee
select * from company
select * from works
 select * from manager;
 insert into manager values ('Amirul','Amirul'),('Abdul','Amirul'),('Sagor','Amirul'),('Sumon','Sumon'),('Huimesh', 'Sumon'),('Arif','Arif'),('Sajib','Arif');
 
 select employee_name from works where company_name='Sonali';
 
 select e.employee_name, e.street, e.city
 from Employee e
 join works w on e.employee_name=w.employee_name
 where w.company_name='Agrani';
 
 select e.employee_name, e.street, e.city
 from Employee e
 join works w on e.employee_name=w.employee_name
 where w.company_name='Sonali' and w.salary>12000;
 
 select e.employee_name
 from Employee e
 join works w on e.employee_name=w.employee_name
 join company c on w.company_name=c.company_name
 where e.city=c.city;
 
 select e.employee_name
 from Employee e
 join manager m on e.employee_name=m.employee_name
 join Employee mgr on m.manager_name=mgr.employee_name
 where e.city=mgr.city  and e.street=mgr.street;

select e.employee_name
from Employee e
where e.employee_name not in(
select w.employee_name from works w
where w.company_name='Sonali'
);

select employee_name 
from works w
where w.salary>all(
select ww.salary 
from works ww
where ww.company_name='Janata'                                                                                                                                           
);


  
