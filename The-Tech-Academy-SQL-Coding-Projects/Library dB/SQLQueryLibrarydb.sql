/*DATABASE & SQL COURSE / STEP 78*/

--CREATE THE DATABASE dbo_Library
CREATE DATABASE dbo_Library;

--USE THIS DATABASE
USE dbo_Library;
GO

--CREATE LIBRARY_BRANCH TABLE
CREATE TABLE tbl_Library_Branch (
	BranchID int NOT NULL IDENTITY(11,1) PRIMARY KEY,
	BranchName varchar(30),
	BranchAddress varchar(100));

--CREATE PUBLISHER TABLE
CREATE TABLE tbl_Publisher (
	PublisherID int NOT NULL IDENTITY(51,1) PRIMARY KEY,
	PublisherName varchar(50) NOT NULL,
	PublisherAddress varchar(100),
	PublisherPhone varchar(20));

--CREATE BOOK TABLE
CREATE TABLE tbl_Book (
	BookID int NOT NULL IDENTITY(1001,1) PRIMARY KEY,
	BookTitle varchar(50) NOT NULL,
	PublisherID int NOT NULL FOREIGN KEY REFERENCES tbl_Publisher(PublisherID));

--CREATE BORROWER TABLE
CREATE TABLE tbl_Borrower (
	CardNo int NOT NULL IDENTITY(50001,1) PRIMARY KEY,
	BorrowerName varchar(30) NOT NULL,
	BorrowerAddress varchar(100) NOT NULL,
	BorrowerPhone varchar(20));

--CREATE BOOK AUTHOR TABLE
CREATE TABLE tbl_Book_Author (
	BookID int NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	BookAuthor varchar(30) NOT NULL);

--CREATE BOOK_COPY TABLE
CREATE TABLE tbl_Book_Copy (
	BookID int NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch (BranchID),
	NoOfCopy int NOT NULL);

--CREATE BOOK_LOAN TABLE
CREATE TABLE tbl_Book_Loan (
	BookLoanID int NOT NULL IDENTITY(60001,1) PRIMARY KEY,
	BookID int NOT NULL FOREIGN KEY REFERENCES tbl_Book (BookID),
	BranchID int NOT NULL FOREIGN KEY REFERENCES tbl_Library_Branch (BranchID),
	CardNo int NOT NULL FOREIGN KEY REFERENCES tbl_Borrower (CardNo),
	DateOut date NOT NULL,
	DateDue date NOT NULL);

--ADD DATA TO LIBRARY_BRANCH TABLE
INSERT INTO tbl_Library_Branch
	(BranchName, BranchAddress)
VALUES
	('Sharpstown', 'Kent, WA'),
	('Central', 'Seattle, WA'),
	('Cedar River', 'Renton, WA'),
	('Rock Creek', 'Maple Valley, WA');

--ADD DATE TO PUBLISHER TABLE
INSERT INTO tbl_Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
VALUES
	('Scribner', 'New York, NY', '212-632-4945'),
	('Chilton Company', 'New York, NY', '800-842-3636'),
	('Grand Central', 'New York, NY', '866-376-6591'),
	('Picador USA', 'New York, NY', '800-221-5441'),
	('Bloomsbury Children''s', 'New York, NY', '212-419-5300'),
	('Simon & Schuster', 'New York, NY', '212-698-7000'),
	('Little, Brown & Co', 'Lebanon, IN', '800-759-0190'),
	('Penguin Random House', 'New York, NY', '800-733-3000'),
	('Thomas & Mercer', 'Seattle, WA', '206-775-1423'),
	('Independent Publisher', 'Seattle, WA', '206-555-1212');

--ADD DATA TO BOOK TABLE
INSERT INTO tbl_Book
	(BookTitle, PublisherID)
VALUES
	('The Lost Tribe', 54),
	('The Shining', 56),
	('Pet Semetery', 56),
	('Dune', 52),
	('Destination Void', 52),
	('Dosadai Experiment', 52),
	('Harry Potter', 55),
	('Very Good Lives', 55),
	('Alias Grace', 56),
	('The Testaments', 56),
	('Unsolved', 57),
	('Zoo', 57),
	('Blowout', 58),
	('On Tyranny', 58),
	('Hunt the Lion', 59),
	('Shadow Shepherd', 59),
	('Talking to Strangers', 57),
	('Outliers', 57),
	('Dirty Talk', 60),
	('Buck Wild', 60),
	('The Gender Game', 60),
	('A Shade of Kiev', 60);

-- ADD DATA TO BOOK_AUTHOR TABLE
INSERT INTO tbl_Book_Author
	(BookAuthor, BookID)
VALUES
	('Mark Lee', 1002),
	('Stephen King', 1003),
	('Stephen King', 1004),
	('Frank Herbert', 1005),
	('Frank Herbert', 1006),
	('Frank Herbert', 1007),
	('JK Rowling', 1008),
	('JK Rowling', 1009),
	('Margaret Atwood', 1010),
	('Margaret Atwood', 1011),
	('James Patterson', 1012),
	('James Patterson', 1013),
	('Rachel Maddow', 1014),
	('Rachel Maddow', 1015),
	('Chad Zunker', 1016),
	('Chad Zunker', 1017),
	('Malcolm Gladwell', 1018),
	('Malcolm Gladwell', 1019),
	('Lauren Landish', 1020),
	('Lauren Landish', 1021),
	('Bella Forrest', 1022),
	('Bella Forrest', 1023);

--ADD DATA TO BOOK COPY TABLE
INSERT INTO tbl_Book_Copy
	(BookID, BranchID, NoOfCopy)
VALUES
	(1002, 11, 3),
	(1002, 12, 4),
	(1002, 13, 2),
	(1002, 14, 6),
	
	(1003, 11, 3),
	(1003, 12, 4),
	(1003, 13, 2),
	(1003, 14, 6),
	
	(1004, 11, 3),
	(1004, 12, 4),
	(1004, 13, 2),
	(1004, 14, 6),
	
	(1005, 11, 3),
	(1005, 12, 4),
	(1005, 13, 2),
	(1005, 14, 6),
	
	(1006, 11, 3),
	(1006, 12, 4),
	(1006, 13, 2),
	(1006, 14, 6),
	
	(1007, 11, 3),
	(1007, 12, 4),
	(1007, 13, 2),
	(1007, 14, 6),
	
	(1008, 11, 3),
	(1008, 12, 4),
	(1008, 13, 2),
	(1008, 14, 6),
	
	(1009, 11, 3),
	(1009, 12, 4),
	(1009, 13, 2),
	(1009, 14, 6),
	
	(1010, 11, 3),
	(1010, 12, 4),
	(1010, 13, 2),
	(1010, 14, 6),
	
	(1011, 11, 3),
	(1011, 12, 4),
	(1011, 13, 2),
	(1011, 14, 6),
	
	(1012, 11, 3),
	(1012, 12, 4),
	(1012, 13, 2),
	(1012, 14, 6),
	
	(1013, 11, 3),
	(1013, 12, 4),
	(1013, 13, 2),
	(1013, 14, 6),
	
	(1014, 11, 3),
	(1014, 12, 4),
	(1014, 13, 2),
	(1014, 14, 6),
	
	(1015, 11, 3),
	(1015, 12, 4),
	(1015, 13, 2),
	(1015, 14, 6),

	(1016, 11, 3),
	(1016, 12, 4),
	(1016, 13, 2),
	(1016, 14, 6),

	(1017, 11, 3),
	(1017, 12, 4),
	(1017, 13, 2),
	(1017, 14, 6),

	(1018, 11, 3),
	(1018, 12, 4),
	(1018, 13, 2),
	(1018, 14, 6),

	(1019, 11, 3),
	(1019, 12, 4),
	(1019, 13, 2),
	(1019, 14, 6),

	(1020, 11, 3),
	(1020, 12, 4),
	(1020, 13, 2),
	(1020, 14, 6),

	(1021, 11, 3),
	(1021, 12, 4),
	(1021, 13, 2),
	(1021, 14, 6),

	(1022, 11, 3),
	(1022, 12, 4),
	(1022, 13, 2),
	(1022, 14, 6),

	(1023, 11, 3),
	(1023, 12, 4),
	(1023, 13, 2),
	(1023, 14, 6);

--ADD DATA TO BORROWER TABLE
INSERT INTO tbl_Borrower
	(BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
	('John Smith', 'Renton, WA', '425-277-1254'),
	('Phil Donohue', 'Kent, WA', '253-666-5467'),
	('Brad Pitt', 'Seattle, WA', '206-954-1289'),
	('Angelina Jolie', 'Puyallup, WA', '253-456-2263'),
	('Steve Buscemi', 'Renton, WA', '425-271-4463'),
	('Paul Atreides', 'Planet Arrakis', '7774-32-9885'),
	('Walkin'' Dude', 'Manhattan, IA', '515-274-1208'),
	('Mary Magdalene', 'Jurusalem, Israel', '011-889-5567');

--ADD DATA TO BOOK LOAN TABLE
INSERT INTO tbl_Book_Loan
	(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
	(1002,11,50001,'20190123','20190223'),
	(1003,11,50001,'20190122','20190222'),
	(1004,11,50001,'20190119','20190219'),
	(1005,11,50001,'20190115','20190215'),
	(1006,11,50001,'20190112','20190212'),
	(1007,11,50001,'20190113','20190213'),
	(1008,12,50002,'20190415','20190515'),
	(1009,12,50002,'20190415','20190515'),
	(1010,12,50002,'20190415','20190515'),
	(1011,12,50002,'20190415','20190515'),
	(1012,12,50002,'20190415','20190515'),
	(1013,12,50002,'20190415','20190515'),
	(1014,12,50002,'20190415','20190515'),
	(1015,13,50003,'20190301','20190401'),
	(1015,13,50003,'20190301','20190401'),
	(1016,13,50003,'20190301','20190401'),
	(1017,13,50003,'20190301','20190401'),
	(1018,13,50003,'20190301','20190401'),
	(1019,13,50003,'20190301','20190401'),
	(1020,13,50003,'20190301','20190401'),
	(1021,14,50004,'20170704','20170804'),
	(1022,14,50004,'20170704','20170804'),
	(1023,14,50004,'20170704','20170804'),
	(1002,14,50004,'20170704','20170804'),
	(1003,14,50004,'20170704','20170804'),
	(1004,14,50004,'20170704','20170804'),
	(1005,14,50004,'20170704','20170804'),
	(1006,11,50005,'20011016','20011116'),
	(1007,11,50005,'20011016','20011116'),
	(1008,11,50005,'20011016','20011116'),
	(1009,11,50005,'20011016','20011116'),
	(1010,11,50005,'20011016','20011116'),
	(1011,11,50005,'20011016','20011116'),
	(1012,11,50005,'20011016','20011116'),
	(1013,12,50006,'20181008','20181108'),
	(1014,12,50006,'20181008','20181108'),
	(1015,12,50006,'20181008','20181108'),
	(1016,12,50006,'20181008','20181108'),
	(1017,12,50006,'20181008','20181108'),
	(1018,12,50006,'20181008','20181108'),
	(1019,12,50006,'20181008','20181108'),
	(1020,13,50007,'20190905','20191005'),
	(1021,13,50007,'20190905','20191005'),
	(1022,13,50007,'20190905','20191005'),
	(1023,13,50007,'20190905','20191005'),
	(1002,13,50007,'20190905','20191005'),
	(1003,13,50007,'20190905','20191005'),
	(1004,13,50007,'20190905','20191005'),
	(1005,14,50008,'20191008','20191108'),
	(1006,14,50008,'20191008','20191108'),
	(1007,14,50008,'20191008','20191108'),
	(1008,14,50008,'20191008','20191108'),
	(1009,14,50008,'20191008','20191108'),
	(1010,14,50008,'20191008','20191108'),
	(1011,14,50008,'20191008','20191108');

--ADD BORROWER WITH NO BOOKS CHECKED OUT
INSERT INTO tbl_Borrower
	(BorrowerName, BorrowerAddress,BorrowerPhone)
VALUES
	('Jack Chambers', 'New York, NY', '212-555-4789');

/*XXXXXXXXXXXXXXXXXXXXX
	BEGIN QUERIES
XXXXXXXXXXXXXXXXXXXXX*/

--HOW MANY COPIES OF THE LOST TRIBE ARE AT SHARPSTOWN
SELECT BookTitle AS 'Title', NoOfCopy AS 'Number of Copies', BranchName AS 'Branch'
FROM tbl_Book TB
INNER JOIN tbl_Book_Copy TBC
	ON TB.BookID = TBC.BookID
INNER JOIN tbl_Library_Branch TLB
	ON TLB.BranchID = TBC.BranchID
WHERE TB.BookTitle = 'The Lost Tribe' 
	AND TLB.BranchName = 'Sharpstown';

--HOW MANY COPIES OF THE LOST TRIBE AT EACH LIBRARY LOCATION
SELECT BookTitle AS 'Title', NoOfCopy AS 'Number of Copies', BranchName AS 'Branch'
FROM tbl_Book TB
INNER JOIN tbl_Book_Copy TBC
	ON TB.BookID = TBC.BookID
INNER JOIN tbl_Library_Branch TLB
	ON TLB.BranchID = TBC.BranchID
WHERE TB.BookTitle = 'The Lost Tribe'; 

--ALL BORROWERS WITH OUT BOOKS CHECKED OUT
SELECT BorrowerName AS 'Customer'
FROM tbl_Borrower TBO
LEFT JOIN tbl_Book_Loan TBL
	ON TBO.CardNo = TBL.CardNo
WHERE TBL.CardNo IS NULL;

--EACH BOOK CHECKED OUT FROM SHARPSTOWN WITH DUE DATE TODAY GET BOOK TITLE, BORROWER'S NAME & ADDRESS
SELECT BookTitle AS 'Book', BorrowerName AS 'Customer', BorrowerAddress AS 'Address'
FROM tbl_Book TB
INNER JOIN tbl_Book_Loan TBL
	ON TBL.BookID = TB.BookID
INNER JOIN tbl_Library_Branch TLB
	ON TLB.BranchID = TBL.BranchID
INNER JOIN tbl_Borrower TBO
	ON TBO.CardNo = TBL.CardNo
WHERE TLB.BranchName = 'Sharpstown'
	AND TBL.DateDue = GETDATE();--NO BOOKS DUE TODAY, I RAN IT AGAINST 11-16-2001 AND IT PULLED CORRECTLY

--EACH LIBRARY TOTAL NUMBER OF BOOKS CHECKED OUT, GET BRANCH NAME AND # OF BOOKS
SELECT BranchName AS 'Branch', COUNT(BookLoanID) AS 'Number of Books Out'
FROM tbl_Book_Loan TBL
INNER JOIN tbl_Library_Branch TLB
	ON TLB.BranchID = TBL.BranchID
GROUP BY TLB.BranchName;

--RETRIEVE NAMES, ADDRESSES & # OF BOOKS CHECKED OUT FOR ALL BORROWERS WHO HAVE OVER 5 BOOKS CHECKED OUT
SELECT BorrowerName AS 'Customer Name', BorrowerAddress AS 'Address', COUNT(BookLoanID) AS 'Number of Books Out'
FROM tbl_Borrower TBO
INNER JOIN tbl_Book_Loan TBL
	ON TBL.CardNo = TBO.CardNo
GROUP BY BorrowerName, BorrowerAddress
HAVING COUNT(BookLoanID) >= 5;

--TITLE AND NUMBER OF COPIES OF STEPHEN KING BOOKS AT THE CENTRAL BRANCH
SELECT BookTitle AS 'Book Title', NoOfCopy AS 'Number of Copies'
FROM tbl_Book TB
INNER JOIN tbl_Book_Copy TBC
	ON TBC.BookID = TB.BookID
INNER JOIN tbl_Book_Author TBA
	ON TBA.BookID = TB.BookID
INNER JOIN tbl_Library_Branch TLB
	ON TLB.BranchID = TBC.BranchID
WHERE TBA.BookAuthor = 'Stephen King'
	AND TLB.BranchName = 'Central';