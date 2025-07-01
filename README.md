
# task6
# Task 6 – SQL Subqueries and Nested Queries

## 🎯 Objective
To practice and demonstrate the use of SQL subqueries in SELECT, WHERE, and FROM clauses including scalar, correlated, and EXISTS logic.

---

## 🗂 Tables Used

### 🔸 Employees
| Column   | Type | Description          |
|----------|------|----------------------|
| EmpID    | INT  | Primary Key          |
| EmpName  | TEXT | Employee Name        |
| Salary   | INT  | Employee Salary      |
| DeptID   | INT  | FK referencing Dept  |

### 🔸 Departments
| Column   | Type | Description       |
|----------|------|-------------------|
| DeptID   | INT  | Primary Key       |
| DeptName | TEXT | Department Name   |

---

## 🧪 Subquery Techniques Used

- Scalar subquery in SELECT
- Subquery with IN / EXISTS in WHERE
- Correlated subquery (WHERE clause)
- Subquery in FROM clause (Derived Table)
- Subquery with aggregate functions

---

## ✅ Output
- Filtered employee names by department
- Average salaries by department
- Employees earning above department average
- Employees in departments like IT/HR
- Max salary using subquery

---

## 🛠 Tools Used
- MySQL Workbench or DB Browser for SQLite
