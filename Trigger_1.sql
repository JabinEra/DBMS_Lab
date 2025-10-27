CREATE table student(studentId VARCHAR(10),
    name varchar(10),
    gpa DECIMAL(3,2)
);

ALTER TABLE student
add PRIMARY key(studentId);
CREATE table trigger_after(
    applyId int AUTO_INCREMENT PRIMARY key,
    studentId VARCHAR(10),
    hallId INT,
    hallName VARCHAR(10),
    applyDate DATE,
    Foreign Key (studentId) REFERENCES student(studentId)
);

SELECT * FROM apply;
SELECT * from student;

alter table trigger_after
RENAME to apply;

DELIMITER $$
CREATE Trigger trigger_after_student
after INSERT ON student
FOR EACH ROW
BEGIN 
    IF new.gpa>3.9 THEN
        INSERT INTO apply(studentId,hallId,hallName,applyDate)
        VALUES(new.studentId,'01','BB',CURDATE());

    ELSEIF new.gpa>3.7 THEN
        INSERT INTO apply(studentId,hallId,hallName,applyDate)
        VALUES(new.studentId,'02','ZR',CURDATE());

    ELSEIF new.gpa>3.5 THEN
        INSERT INTO apply(studentId,hallId,hallName,applyDate)
        VALUES(new.studentId,'03','MB',CURDATE());

    ELSEIF new.gpa>3.3 THEN
        INSERT INTO apply(studentId,hallId,hallName,applyDate)
        VALUES(new.studentId,'04','SJ',CURDATE());

    ELSEIF new.gpa>3.1 THEN
        INSERT INTO apply(studentId,hallId,hallName,applyDate)
        VALUES(new.studentId,'05','FH',CURDATE());
    END IF;

END$$

DELIMITER;


insert into student VALUES('110','Rahim','3.99');
insert into student VALUES('111','Fahim','3.20');
insert into student VALUES('112','karim','3.77');
insert into student VALUES('113','sajib','3.56');
insert into student VALUES('114','Rahim','3.39');

SELECT * FROM student;
SELECT * FROM apply;

show TRIGGERs;
