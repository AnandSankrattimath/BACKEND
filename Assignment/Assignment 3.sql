--Assignment 3--

--Assignment 3.1  
CREATE TABLE dbo.tblStudent(
StudId INT PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
Address VARCHAR(50))


--Assignment 3.2
DROP TABLE dbo.tblStudent;


--Assignment 3.3
IF NOT EXISTS(SELECT NAME FROM sys.tables)
BEGIN
CREATE TABLE tblEmployee(
EmpId INT PRIMARY KEY,
FirstName VARCHAR(15) NOT NULL,
MiddleName VARCHAR(10),
LastName VARCHAR(15),
DOB DATE,
IsMarried BIT,
)
END

IF EXISTS(SELECT NAME FROM sys.tables)
BEGIN
DROP TABLE tblEmployee
END

--Assignment 3.4
EXECUTE SP_RENAME 'dbo.tblStudent','dbo.tblStudentInfo'


--Assignment 3.5
ALTER TABLE dbo.tblStudent
ALTER COLUMN Name NVARCHAR(20);



--Assignment 3.5
EXEC SP_RENAME 'dbo.tblStudent.Name', 'FirstName'





