create table student(
    roll varchar(25) primary key,
    name VARCHAR(25),
    dept varchar(10),
    year VARCHAR( 10),
    semester VARCHAR(10)
);
select * from student;
insert into student(roll,name,dept,year,semester)
 values ('06543201','Rahim','BBA','2nd','1st'),
        ('06543202','Karim','ICE','2nd','1st'),
        ('06543203','Motin','CSE','1st','2nd'),
        ('05654456','Swadhin','CSE','1st','2nd'),
        ('05654457','Hena','BBA','4th','2nd'),
        ('05654458','Shohag','CSE','3rd','1st');
select * from student;

create table studentInfo(
    roll VARCHAR(20),
    studentName VARCHAR(20),
    fatherName VARCHAR(20),
    studentAddress VARCHAR(20),
    mobile varchar(10)
);

select * from `studentInfo`;
ALTER TABLE studentInfo
ADD PRIMARY KEY (roll);

ALTER TABLE studentInfo
MODIFY mobile VARCHAR(15);


insert into studentInfo (roll, studentName,fatherName,StudentAddress,mobile) VALUES
        ('06543201','Rahim','Ataur','Rajshahi','01719201233'),
        ('06543202','Karim','Tareq','Dhaka','01719202020'),
        ('06543203','Motin','Rahman','Khulna','01719202678'),
        ('05654456','Swadhin','Fazlu','Rajshahi','01719204564'),
        ('05654457','Hena','Rahman','Rajshahi','01119212020'),
        ('05654458','Shohag','Fazlu','Natore','01719202222');

SELECT name from student
where semester='1st';

SELECT name from student
where year='2nd';
SELECT name from student
where dept='CSE';

SELECT name from student
where roll='06543201';

SELECT studentName, studentAddress, mobile from `studentInfo`
where fatherName='Rahman';
SELECT studentName, studentAddress, mobile from `studentInfo`
where mobile='01719202020';

SELECT studentName, studentAddress, mobile from `studentInfo`
where `studentAddress`='Rajshahi';

SELECT studentName, studentAddress, mobile from `studentInfo`
where `studentAddress`='Rajshahi' and fatherName ='Rahman';

SELECT studentName, studentAddress, mobile from `studentInfo`
where `roll`='05654456';
