create database Trigger_example_1;
use Trigger_example_1;

create table students(
	studentID int primary key auto_increment,
    name varchar(20)
);

create table account(
    accountNO varchar(10),
    balance decimal(9,2)   
);

Delimiter //

create trigger account_before 
before insert
on account for each row
begin
	declare vUser varchar(20);
    select user() into vUser;
    
	insert into students (name) values(vUser);
end//

Delimiter ;

insert into account values ( "fariya99", 0000000.00);
select * from students
select * from account