-- Step 0: Create and use the database
CREATE DATABASE IF NOT EXISTS company;
USE company;

-- Setup: Two tables for demonstration
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert into Departments
INSERT INTO Departments VALUES 
(1, 'HR'), (2, 'IT'), (3, 'Finance');

-- Insert into Employees
INSERT INTO Employees VALUES 
(101, 'Alice', 60000, 1),
(102, 'Bob', 50000, 2),
(103, 'Charlie', 45000, 2),
(104, 'David', 70000, 3),
(105, 'Eva', 30000, 1);

-- 1. Scalar Subquery in SELECT
SELECT EmpName, Salary,
       (SELECT AVG(Salary) FROM Employees) AS AvgSalary
FROM Employees;

-- 2. Subquery in WHERE using IN
SELECT EmpName FROM Employees
WHERE DeptID IN (SELECT DeptID FROM Departments WHERE DeptName = 'IT');

-- 3. Subquery in WHERE using EXISTS
SELECT EmpName FROM Employees E
WHERE EXISTS (
    SELECT 1 FROM Departments D
    WHERE D.DeptID = E.DeptID AND D.DeptName = 'Finance'
);

-- 4. Correlated Subquery in WHERE
SELECT EmpName, Salary FROM Employees E1
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees E2
    WHERE E1.DeptID = E2.DeptID
);

-- 5. Subquery in FROM clause (Derived Table)
SELECT DeptID, AvgSal
FROM (
    SELECT DeptID, AVG(Salary) AS AvgSal
    FROM Employees
    GROUP BY DeptID
) AS DeptAvg;

-- 6. Subquery using = for scalar return
SELECT EmpName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 7. Subquery returning multiple rows with IN
SELECT EmpName
FROM Employees
WHERE DeptID IN (
    SELECT DeptID FROM Departments WHERE DeptName IN ('IT', 'HR')
);
