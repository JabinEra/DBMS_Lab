create database Students_Trigger
use Students_Trigger

create table student(
	studentId varchar(10) primary key,
    studentName varchar(20),
    GPA decimal(3,2));
select * from student
create table apply(
	studentId varchar(10),
    hallID varchar(10),
    hallName varchar(20),
    applyName date,
    foreign key(studentId) references student(studentId)
    );
ALTER TABLE apply
CHANGE applyName applyDate DATE;
select * from apply
    

DELIMITER $$

CREATE TRIGGER student_insert_apply
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    DECLARE hallId VARCHAR(10);
    DECLARE hallName VARCHAR(100);

    IF NEW.GPA > 3.9 THEN
        SET hallId = '01';
        SET hallName = 'BB';
    ELSEIF NEW.GPA > 3.7 THEN
        SET hallId = '02';
        SET hallName = 'ZR';
    ELSEIF NEW.GPA > 3.5 THEN
        SET hallId = '03';
        SET hallName = 'MB';
    ELSEIF NEW.GPA > 3.3 THEN
        SET hallId = '04';
        SET hallName = 'SJ';
    ELSEIF NEW.GPA > 3.1 THEN
        SET hallId = '05';
        SET hallName = 'FH';
    END IF;

    IF hallId IS NOT NULL THEN
        INSERT INTO apply (studentId, hallId, hallName, applyDate)
        VALUES (NEW.studentId, hallId, hallName, CURDATE());
    END IF;
END$$

DELIMITER ;

insert into student values('1001' , 'shafiq', 3.93);
insert into student values('1002' , 'Rafiq', 3.67);


