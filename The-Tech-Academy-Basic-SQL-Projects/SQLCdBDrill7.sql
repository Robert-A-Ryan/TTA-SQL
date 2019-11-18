
/*CREATE THE DATABASE*/
CREATE DATABASE db__drill7;

/*USE THIS DATABASE*/
USE db__drill7;
GO

/*CREATE THE TABLES*/
CREATE TABLE tbl_info (
	infoID int NOT NULL IDENTITY(100,1) PRIMARY KEY,
	addStreet varchar(100) NOT NULL,
	addAptNum varchar(10),
	addCity varchar (50),
	addState varchar (2),
	addZip int);

CREATE TABLE tbl_name (
	nameID int NOT NULL IDENTITY(1000,1) PRIMARY KEY,
	fname varchar(50) NOT NULL,
	lname varchar(50) NOT NULL,
	fk_tblinfoID int FOREIGN KEY REFERENCES tbl_info(infoID));

/*INSERT THE DATA INTO THE TABLES*/
INSERT INTO tbl_info
	(addStreet, addAptNum, addCity, addState, addZip)
VALUES
	('124 Main St',' ' , 'Reno', 'NV', 55261),
	('939 Wells Ave', '#9', 'Renton', 'WA', 98057),
	('526 Beacher',' ' , 'Seattle', 'WA', 98134),
	('1518 134th Ave SE', 'Apt 6', 'Enumclaw', 'WA', 98442);

INSERT INTO tbl_name 
	(fname, lname, fk_tblinfoID)
VALUES 
	('Bob', 'Smith', 101),
	('Diane', 'Brooke', 102),
	('John', 'Dean', 102),
	('Merrill', 'Lynch', 100);

/*MY SELECT STATEMENT*/
SELECT 
	tbl_name.fname,tbl_name.lname, tbl_info.addCity, tbl_info.addState
FROM tbl_name
INNER JOIN tbl_info
	ON tbl_name.fk_tblinfoID = tbl_info.infoID;
