--Assignment 10.1
--Normalization

CREATE DATABASE Normalization
USE Normalization

--Before 1st NF---
CREATE TABLE dbo.EmployeeDetailsAndTheirDepartments(
EmpName varchar(30),Gender varchar(6),Salary int,DeptName varchar(20),
DeptHeadName varchar(20),DeptLocation varchar(30));

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Manikantha','Male',25000,'IT','XYZ','Bangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Manish','Male',30000,'HR','ABC','Mangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Gururraj','Male',25000,'IT','XYZ','Bangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Sagar','Male',25000,'HR','ABC','Mangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Abhishek','Male',25000,'IT','XYZ','Bangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Anand','Male',25000,'HR','ABC','Mangalore')

SELECT * FROM dbo.EmployeeDetailsAndTheirDepartments

-- Duplicate data is present in the current table,duplicate data increases the spaces to solve this problem we need apply 1st NF.
-- Applying 1st Normal form to EmployeeDetailsAndTheirDepartments table.
--In this process we need to break the into two one is having the employee data and onother is having the department data.

--Creating employee table
CREATE TABLE dbo.Employee(
EmpId int primary key,
EmpName varchar(30),
Gender varchar(6),
Salary int,)

Drop table Employee

--inserting the data
INSERT INTO dbo.Employee VALUES(
1,'Manikantha','Male',25000)

INSERT INTO dbo.Employee VALUES(
2,'Manish','Male',55000)

INSERT INTO dbo.Employee VALUES(
3,'Sagar','Male',45000)

INSERT INTO dbo.Employee VALUES(
4,'Abhishek','Male',35000)

INSERT INTO dbo.Employee VALUES(
5,'Anand','Male',5000)

--creating department table
CREATE TABLE dbo.Department(
DeptId int primary key,
DeptName varchar(20),
DeptHeadName varchar(20),
DeptLocation varchar(30)
);

DROP TABLE Department

INSERT INTO dbo.Department VALUES(
1,'HR','XYZ','Bangalore')

INSERT INTO dbo.Department VALUES(
2,'IT','ABC','Mangalore')

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.Department;

--After applying 1NF we are able to solve the problem of space waste/Data duplication.

--Applying 2nd NF
	-- To proceed with 2nf, the table must follows the 1NF rules
	--In 2nd NF built the relationship with other table using Foriegn key.

CREATE TABLE dbo.Employee(
EmpId int PRIMARY KEY,
EmpName varchar(30),
Gender varchar(6),
Salary int,
DeptId int FOREIGN KEY REFERENCES dbo.Department(DeptId))       

INSERT INTO dbo.Employee VALUES(
1,'Manikantha','Male',25000,1)

INSERT INTO dbo.Employee VALUES(
2,'Manish','Male',55000,2)

INSERT INTO dbo.Employee VALUES(
3,'Sagar','Male',45000,1)

INSERT INTO dbo.Employee VALUES(
4,'Abhishek','Male',35000,1)

INSERT INTO dbo.Employee VALUES(
5,'Anand','Male',5000,2)


CREATE TABLE dbo.Department(
DeptId int primary key,
DeptName varchar(20),
DeptHeadName varchar(20),
DeptLocation varchar(30)
);

INSERT INTO dbo.Department VALUES(
1,'HR','XYZ','Bangalore')

INSERT INTO dbo.Department VALUES(
2,'IT','ABC','Mangalore')

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.Department;


--Applying 3rd NF
	--It must follows 1NF and 2NF.
	--Does not contain column that not fully dependent on primary key.
	--If a table contains non dependent column we need to take further steps to solve it.

	SELECT EmpId,EmpName,Gender,Salary FROM dbo.Employee;




--Assignment 10.2
--Execution Plan

--AFTER CREATING NONCLUSTER INDEX
SELECT DP.ProductKey as DPKey, DP.ProductName,CFS.DateKey,CFS.SalesAmount FROM DimProduct AS DP 
INNER JOIN CopyOfFactSales AS CFS
ON DP.ProductKey=CFS.ProductKey
WHERE CFS.DateKey LIKE '%2007%'


--Before creating NONCLUSTER INDEX---
SELECT DP.ProductKey as DPKey, DP.ProductName,FS.DateKey,FS.SalesAmount FROM DimProduct AS DP 
INNER JOIN FactSales AS FS
ON DP.ProductKey=FS.ProductKey
WHERE FS.DateKey LIKE '%2007%'

