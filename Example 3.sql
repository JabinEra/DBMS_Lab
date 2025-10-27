-- show databases
-- use  lab_practice
-- 	table person(nid int primary key , name varchar(10), address varchar(10));
-- select * from person
-- INSERT into person VALUES(123451,'Arif','Rajashai'),(123452,'Sumon','Maynamati'),(123453,'Sagor','Shirajganj'),(123454,'Abdul','Rajshahi'),
-- (123455,'Himesh','Dhaka'),(123456,'Amminul','Sylhet'),(123457,'Sajib','Chittagang');
-- select * from car
create table person(nid INT primary key,
    name VARCHAR(15),
    address varchar(15)
);
select * from person;
insert into person(nid,name,address) VALUES
('123451','Arif','Rajshahi'),
('123452','Sumon','Moynamoti'),
('123453','Sagor','Sirajgang'),
('123454','Abdul','Rajshahi'),
('123455','Himesh','Dhaka'),
('123456','Amirul','Sylhet'),
('123457','Sajib','Chittagang');

create table car(license VARCHAR(15) primary key,
    year INT,
    model VARCHAR(10)
);
insert into car(license,year,model)  VALUES
('12-3000',2012,'Axio'),
('11-3000',2008,'Corolla'),
('12-4000',2013,'Axio'),
('12-5000',2013,'Premio'),
('11-5000',2011,'Nano'),
('11-6000',2011,'Alto'),
('12-6000',2015,'Nano Twist');
select * from car;
create table accident(date DATE,
    driver varchar(15),
    d_amount DECIMAL(10,2),
    primary key(date,driver)
);
select * from accident;
insert into accident(date,driver,d_amount) VALUES
('2013-01-12','Arif',10000),
('2015-09-25','Komol',12000),
('2014-06-20','Bahadur',11000),
('2011-12-20','Abdul',8000),
('2015-09-19','Akter',7000),
('2013-05-15','Arif',20000),
('2014-08-20','Arif',15000);
 create table owns(nid INT,
    license VARCHAR(15),
    PRIMARY key(nid, license),
    Foreign Key (nid) REFERENCES person(nid),
    Foreign Key (license) REFERENCES car(license)
);
select * from owns;
insert into owns(nid,license) VALUES
(123451,'11-3000'),
(123452,'12-4000'),
(123453,'12-5000'),
(123454,'11-5000'),
(123455,'11-6000'),
(123456,'12-6000'),
(123457,'12-3000');

create TABLE log(license VARCHAR(15),
    date DATE,
    driver VARCHAR(15),
    PRIMARY key(license,date,driver)
);  
insert into log(license,date,driver) VALUES
('11-3000','2013-01-12','Arif'),
('12-4000','2015-09-25','Komol'),
('11-6000','2014-06-20','Bahadur'),
('11-5000','2011-12-20','Abdul'),
('12-6000','2015-09-19','Akter'),
('11-3000','2013-05-15','Arif'),
('11-3000','2014-08-20','Arif');
select * from log;

#(b)
select name from person
where address='Rajshahi';

#(c)
select model from car
where year=2013;

#(d)
select driver from accident
where d_amount BETWEEN 10000 and 15000;

#(e)
select o.nid
 from owns o 
join car c 
on c.license = o.license
where model="Axio";
#(f)
select p.name, p.address
from person p
join owns o on o.nid=p.nid
join car c on c.license=o.license
where model='Alto';

#(g)
select l.driver
from log l
join car c
on c.license=l.license
where date='2011-12-20';

#(h)
select p.name from person p
join owns o on o.nid=p.nid
join log l on l.license=o.license
where driver='Arif';

#(i)
select c.model from car c
join log l on l.license=c.license
join accident a on a.driver = l.driver
where a.date='2015-09-19';

#(k)
select count(*) as num_accident
from accident
where driver="Arif";

#(l)
select date
from accident where driver="Arif";

#(m)
UPDATE person
set address="Natore"
where name='Arif';
select * from person;
