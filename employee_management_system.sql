
CREATE DATABASE EmployeeDB;

USE EmployeeDB;

-- 1. Create Tables
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




-- 2. Insert Sample Data
INSERT INTO Department (DepartmentName) VALUES ('HR'), ('IT'), ('Finance');
INSERT INTO Employee (Name, Salary, DepartmentID) VALUES
('Alice', 50000, 1),
('Bob', 70000, 2),
('Charlie', 60000, 3),
('David', 40000, 2);




-- 3. CREATE VIEW
CREATE VIEW vw_EmployeeDetails AS
SELECT e.EmployeeID, e.Name, e.Salary, d.DepartmentName, e.HireDate
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID;


SELECT * FROM vw_EmployeeDetails;



-- 4. CTE: Top Earners
WITH TopEarners AS (
    SELECT Name, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT * FROM TopEarners;





-- 5. Data Type Conversion
SELECT Name, CAST(Salary AS VARCHAR(10)) AS SalaryText FROM Employee;




-- 6. Stored Procedure: Add Employee with output message
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



-- 7. Scalar Function: Calculate Annual Salary
CREATE FUNCTION fn_GetAnnualSalary(@MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @MonthlySalary * 12;
END;


-- 8. Table-valued Function: Get Employees by Department
CREATE FUNCTION fn_GetEmployeesByDept(@DeptID INT)
RETURNS TABLE
AS
RETURN (
    SELECT * FROM Employee WHERE DepartmentID = @DeptID
);


-- 9. AFTER TRIGGER: Log insertion
CREATE TABLE EmployeeLog (
    LogID INT IDENTITY PRIMARY KEY,
    EmployeeID INT,
    ActionTime DATETIME DEFAULT GETDATE(),
    ActionType VARCHAR(50)
);

CREATE TRIGGER trg_AfterInsertEmployee
ON Employee
AFTER INSERT
AS
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, ActionType)
    SELECT EmployeeID, 'INSERT' FROM INSERTED;
END;

-- 10. INSTEAD OF TRIGGER: Prevent deletion if salary > 60000
CREATE TRIGGER trg_InsteadOfDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Employee
    WHERE EmployeeID IN (SELECT EmployeeID FROM DELETED WHERE Salary <= 60000);
END;

-- 11. Transaction with Isolation Level
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
    UPDATE Employee SET Salary = Salary + 1000 WHERE Name = 'Alice';
COMMIT;

-- 12. Indexes
CREATE CLUSTERED INDEX idx_EmployeeID ON Employee(EmployeeID);
CREATE NONCLUSTERED INDEX idx_EmployeeName ON Employee(Name);

-- 13. Optimized Query with WHERE + JOIN + SELECT specific columns
SELECT e.Name, e.Salary, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;


