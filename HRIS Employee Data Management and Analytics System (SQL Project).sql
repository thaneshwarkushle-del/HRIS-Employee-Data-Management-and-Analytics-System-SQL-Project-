CREATE DATABASE HRIS_System;

USE HRIS_System;

-- Table to store department information
CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);



-- Create Employees Table
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(50),
DepartmentID INT,
Salary INT,
JoiningDate DATE,
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert Departments Data
INSERT INTO Departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');
-- Insert Employees Data
INSERT INTO Employees VALUES
(101,'Rahul Sharma',1,50000,'2022-01-10'),
(102,'Priya Reddy',2,45000,'2021-05-12'),
(103,'Arjun Patel',3,55000,'2020-09-20'),
(104,'Sneha Gupta',1,60000,'2023-02-15'),
(105,'Karan Mehta',4,48000,'2022-08-05'),
(106,'Ananya Verma',2,47000,'2023-01-18');

-- View All Employees
SELECT * FROM Employees;

-- INNER JOINCombine Employees with Departments using INNER JOIN
SELECT e.EmployeeID, e.Name, d.DepartmentName, e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;
-- Show all employees even if department missing using LEFT JOIN
SELECT e.Name, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- HR Analysis Queries

-- Employees per Department
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Average Salary per Department
SELECT d.DepartmentName, AVG(e.Salary) AS AverageSalary
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Highest Paid Employee
SELECT Name, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1;

-- Total Salary Cost per Department
SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- Update Employee Salary
UPDATE Employees
SET Salary = 65000
WHERE EmployeeID = 101; 

-- Delete Employee
DELETE FROM Employees
WHERE EmployeeID = 106;

