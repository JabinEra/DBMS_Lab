CREATE TABLE Publisher (
    Name VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);
INSERT INTO Publisher VALUES
('PHI', '20 Delhi Super Market', '01715-454678'),
('Tata', 'North Kolkata', '0156-2345445'),
('Galgotia', 'Mumbai', '0192-203490');
select * from Publisher

CREATE TABLE Book (
    BookId VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(100),
    PublisherName VARCHAR(100),
    FOREIGN KEY (PublisherName) REFERENCES Publisher(Name)
);
select * from Book;
INSERT INTO Book VALUES
('100.001cn', 'Computer Network', 'PHI'),
('100.002dsc', 'Database System', 'Tata'),
('100.003ds', 'Digital System', 'PHI'),
('100.004db', 'DBMS', 'PHI'),
('100.005ora', 'Oracle 2000', 'Galgotia');

CREATE TABLE Book_Authors (
    BookId VARCHAR(20),
    AuthorName VARCHAR(100),
    PRIMARY key(BookId, AuthorName),
    FOREIGN KEY (BookId) REFERENCES Book(BookId)
);
select * from Book_Authors;
INSERT INTO Book_Authors VALUES
('100.001cn', 'A S Tanenbaum'),
('100.002dsc', 'Silberschatz'),
('100.003ds', 'Ronald J Tocci'),
('100.004db', 'Ivan Bayross'),
('100.005ora', 'Ivan Bayross');
CREATE TABLE Library_Branch (
    BranchId VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(100)
);
select * from Library_Branch;
INSERT INTO Library_Branch VALUES
('1001', 'CSE Seminar Library', 'Rajshahi'),
('1002', 'RU Central Library', 'Rajshahi'),
('1003', 'DU Central Library', 'Dhaka');

CREATE TABLE Book_Copies (
    BookId VARCHAR(20),
    BranchId VARCHAR(10),
    No_Of_Copies INT,
    FOREIGN KEY (BookId) REFERENCES Book(BookId),
    FOREIGN KEY (BranchId) REFERENCES Library_Branch(BranchId)
);
select * from Book_Copies;
INSERT INTO Book_Copies VALUES
('100.001cn', '1001', 2),
('100.001cn', '1002', 5),
('100.002dsc', '1001', 3),
('100.002dsc', '1002', 4),
('100.003ds', '1001', 3),
('100.003ds', '1003', 5),
('100.004db', '1001', 2),
('100.004db', '1002', 5),
('100.005ora', '1001', 2),
('100.005ora', '1002', 7);

CREATE TABLE Borrower (
    CardNo VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100),
    Phone VARCHAR(20)
);
select * from Borrower;
INSERT INTO Borrower VALUES
('10001', 'Saidur', 'CSE', '01714-400567'),
('10002', 'Rafiq', 'PHYSICS', '0194-300456'),
('10003', 'Masud', 'CSE', '0156-345678'),
('10004', 'Nobir', 'ICT', '01199-203456');


CREATE TABLE Book_Loan (
    BookId VARCHAR(20),
    BranchId VARCHAR(10),
    CardNo VARCHAR(10),
    DateOut DATE,
    DueDate DATE,
    FOREIGN KEY (BookId) REFERENCES Book(BookId),
    FOREIGN KEY (BranchId) REFERENCES Library_Branch(BranchId),
    FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo)
);
select * from Book_Loan;
INSERT INTO Book_Loan VALUES
('100.001cn', '1001', '10001', '2015-01-15', '2015-02-15'),
('100.001cn', '1002', '10002', '2015-01-25', '2015-02-25'),
('100.002dsc', '1001', '10003', '2015-02-20', '2015-03-20'),
('100.002dsc', '1002', '10004', '2015-03-15', '2015-04-15'),
('100.003ds', '1001', '10001', '2015-06-07', '2015-07-07'),
('100.003ds', '1003', '10002', '2015-10-15', '2015-11-15'),
('100.004db', '1001', '10003', '2015-10-25', '2015-11-25'),
('100.004db', '1002', '10004', '2015-11-15', '2015-12-15'),
('100.005ora', '1001', '10003', '2015-12-22', '2016-01-22'),
('100.005ora', '1002', '10001', '2015-12-25', '2016-01-25');

--(1)How many copies of the book titled DBMS are owned by the library branch whose name is “CSE Seminar library”?
select bc.No_Of_Copies from `Book_Copies` bc
join Book b 
on b.`BookId` = bc.`BookId`
join `Library_Branch` lb
on lb.`BranchId`=bc.`BranchId`
WHERE `Title`='DBMS' and `BranchName`='CSE Seminar Library';

--(2)How many copies of the book titled DBMS are owned by each library branch?

select bc.No_Of_Copies , lb.`BranchName` from `Book_Copies` bc
join Book b 
on b.`BookId` = bc.`BookId`
join `Library_Branch` lb
on lb.`BranchId`=bc.`BranchId`
WHERE `Title`='DBMS';

--(3)Retrieve the names of all borrowers who do not have any books checked out?
select Name 
from `Borrower`
WHERE `CardNo` not in(
    SELECT `CardNo`
    from `Book_Loan`
);

--(4)For each book that is loaned out from the “CSE seminar library” 
--branch and whose DueDate is today, retrieve the book title, the borrower’s name, and the borrower’s address.
 SELECT b.Title, br.Name, br.Address
 from `Book_Loan` bl
 join `Book` b
    on b.`BookId`=bl.`BookId`
join `Borrower` br
    on bl.`CardNo`=br.`CardNo`
join `Library_Branch` lb
    on lb.`BranchId`=bl.`BranchId`
WHERE lb.`BranchName`='CSE seminar library' AND bl.`DueDate`=CURDATE();

--(5)For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

select lb.BranchName, COUNT(bl.`BookId`) as total_book
from `Library_Branch` lb 
join `Book_Loan` bl
on bl.`BranchId`=lb.`BranchId`
GROUP BY lb.`BranchName`;

--(6)Retrieve the names, addresses, and number of books checked out for all borrowers who have more than two books checked out.  
SELECT br.Name, br.Address, COUNT(bl.BookId) 
from `Borrower` br
join `Book_Loan`bl
on bl.`CardNo`=br.`CardNo`
GROUP BY br.`CardNo`
HAVING COUNT(*)>2;

--(7)For each book authored by “Ivan BayRoss”, retrieve the title and the no. of copies owned by the library branch whose name is “RU central library”.
SELECT  b.Title, bc.NO_Of_Copies
from `Book` b 
join `Book_Authors` ba
    on ba.`BookId`=b.`BookId`
join `Book_Copies` bc 
    on bc.`BookId`=ba.`BookId`
join `Library_Branch` lb
    on lb.`BranchId`=bc.`BranchId`
WHERE lb.`BranchName`='RU Central Library' 
and ba.`AuthorName`='Ivan bayross';

