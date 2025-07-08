select * from Employee
select * from Works;
select Employee.employee_name, Employee.street, Employee.city from Employee
join Works  W on Employee.employee_name= W.Employee_name
Where W.company_name='Agrani';

select Employee.employee_name, Employee.street, Employee.city from Employee
join Works  W on Employee.employee_name= W.Employee_name
Where W.salary>=10000;

select W.employee_name, W.salary, W.company_name from Works W
join Employee E on W.employee_name=E.employee_name
Where E.city='Rajshahi';

select Employee.employee_name, Employee.street, Employee.city, W.company_name from Employee
join Works  W on Employee.employee_name= W.Employee_name
Where W.salary>=10000;

select Employee.employee_name, Employee.street, Employee.city from Employee
join Works  W on Employee.employee_name= W.Employee_name
Where W.salary>12000 and W.company_name='Sonali';

Select employee_name from Works
where company_name!='Sonali';
SELECT * FROM Employee
WHERE employee_name NOT IN (
    SELECT employee_name
    FROM Works
    WHERE company_name = 'Sonali'
);




