# 💼 Employee Management System – SQL Project

This project demonstrates a complete **SQL-based Employee Management System** implemented in **Microsoft SQL Server (SSMS)** using real-time database concepts. It includes table creation, views, functions, stored procedures, triggers, transactions, and optimization techniques — all backed by practical screenshots.

---
## 📂 Project Structure

EmployeeManagementSystem/
│
├── employee_management_system.sql # Main SQL file with all queries
├── LICENSE # MIT License
├── README.md # This file
└── Screenshots/ # Output screenshots

---

## 🛠 Features Implemented

<details> <summary><strong>1. Schema Design (Tables: Department & Employee)</strong></summary>
sql
Copy
Edit
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID),
    HireDate DATE DEFAULT GETDATE()
);

🔗 View Full Image

</details>
<details> <summary><strong>2. Insert Sample Data</strong></summary>
sql
Copy
Edit
INSERT INTO Department (DepartmentName) VALUES ('HR'), ('IT'), ('Finance');

INSERT INTO Employee (Name, Salary, DepartmentID) VALUES
('Alice', 50000, 1),
('Bob', 70000, 2),
('Charlie', 60000, 3),
('David', 40000, 2);

🔗 View Full Image

</details>
<details> <summary><strong>3. Create View</strong></summary>
sql
Copy
Edit
CREATE VIEW vw_EmployeeDetails AS
SELECT e.EmployeeID, e.Name, e.Salary, d.DepartmentName, e.HireDate
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID;

🔗 View Full Image

</details>
<details> <summary><strong>4. CTE – Top Earners</strong></summary>
sql
Copy
Edit
WITH TopEarners AS (
    SELECT Name, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT * FROM TopEarners;

🔗 View Full Image

</details>
<details> <summary><strong>5. Data Type Conversion</strong></summary>
sql
Copy
Edit
SELECT Name, CAST(Salary AS VARCHAR(10)) AS SalaryText FROM Employee;

🔗 View Full Image

</details>
<details> <summary><strong>6. Stored Procedure with OUTPUT Message</strong></summary>
sql
Copy
Edit
CREATE PROCEDURE AddEmployee
    @Name VARCHAR(100),
    @Salary DECIMAL(10,2),
    @DepartmentID INT,
    @Message VARCHAR(100) OUTPUT
AS
BEGIN
    INSERT INTO Employee (Name, Salary, DepartmentID)
    VALUES (@Name, @Salary, @DepartmentID);
    SET @Message = 'Employee added successfully';
END;

🔗 View Full Image

</details>
<details> <summary><strong>7. Scalar Function – Calculate Annual Salary</strong></summary>
sql
Copy
Edit
CREATE FUNCTION fn_GetAnnualSalary(@MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @MonthlySalary * 12;
END;

🔗 View Full Image

</details>
<details> <summary><strong>8. Table-Valued Function – Get Employees by Department</strong></summary>
sql
Copy
Edit
CREATE FUNCTION fn_GetEmployeesByDept(@DeptID INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Employee WHERE DepartmentID = @DeptID
);

🔗 View Full Image

</details>
<details> <summary><strong>9. AFTER Trigger – Insert Log</strong></summary>
sql
Copy
Edit
CREATE TRIGGER trg_AfterInsertEmployee
ON Employee
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, ActionType)
    SELECT EmployeeID, 'INSERT' FROM INSERTED;
END;

🔗 View Full Image

</details>
<details> <summary><strong>10. INSTEAD OF DELETE Trigger – Prevent High Salary Deletion</strong></summary>
sql
Copy
Edit
CREATE TRIGGER trg_InsteadOfDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Employee
    WHERE EmployeeID IN (SELECT EmployeeID FROM DELETED WHERE Salary <= 60000);
END;

🔗 View Full Image

</details>
<details> <summary><strong>11. Transaction with Isolation Level</strong></summary>
sql
Copy
Edit
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;
    UPDATE Employee SET Salary = Salary + 1000 WHERE Name = 'Alice';
COMMIT;

🔗 View Full Image

</details>
<details> <summary><strong>12. Index Creation</strong></summary>
sql
Copy
Edit
CREATE CLUSTERED INDEX idx_EmployeeID ON Employee(EmployeeID);
CREATE NONCLUSTERED INDEX idx_EmployeeName ON Employee(Name);

🔗 View Full Image

</details>
<details> <summary><strong>13. Optimized Query with Execution Plan</strong></summary>
sql
Copy
Edit
-- Before Optimization
SELECT * FROM Employee;

-- After Optimization
SELECT e.Name, e.Salary, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;
📌 Before Optimization:

🔗 View Full Image

✅ After Optimization:

🔗 View Full Image

</details>

---

## ⚡ Query Optimization

### 🔴 Before Optimization
- Example query without index or filters.  
📷 [`execution_plan_before_optimization.png`](Screenshots/execution_plan_before_optimization.png)

### ✅ After Optimization
- Optimized with WHERE, JOIN, and selective columns.  
📷 [`execution_plan_after_optimization.png`](Screenshots/execution_plan_after_optimization.png)

---

## 📦 How to Use

1. Clone this repo or download the `.sql` file.
2. Open SSMS and run the script.
3. Explore screenshots in the `Screenshots/` folder for visual output.
4. Modify and test queries to learn SQL effectively.

---

## 📜 License

This project is licensed under the MIT License.  
See [`LICENSE`](LICENSE) for full details.

---

## 🙌 Author

**Nishma P**  
BCA Graduate | SQL Enthusiast | [GitHub Profile](https://github.com/nishmacodes)

---
