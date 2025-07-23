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

### 1. 🎯 Schema Design
- **Tables Created**: `Employee`, `Department`
- Foreign key relationship: `Employee.DepartmentID` → `Department.DepartmentID`  
📷 [`schema_design.png`](Screenshots/schema_design.png)

### 2. 📥 Insert Queries
- Sample data for departments and employees.  
📷 [`insert_query.png`](Screenshots/insert_query.png)

### 3. 🧱 Table Creation
- Structure for both tables with data types, keys, and default values.  
📷 [`table_creation.png`](Screenshots/table_creation.png)

### 4. 🔍 CTE – Top Earners
- CTE to list employees earning above ₹50,000.  
📷 [`cte_top_earners.png`](Screenshots/cte_top_earners.png)

### 5. 🔁 Data Type Conversion
- Example using `CAST()` to convert salary into string.  
📷 [`data_type_conversion.png`](Screenshots/data_type_conversion.png)

### 6. 🧾 Stored Procedure with Output Message
- Procedure to insert employee and return a success message.  
📷 [`sp_add_employee_output.png`](Screenshots/sp_add_employee_output.png)

### 7. 👁️ View – Employee with Department
- View joining employee and department details.  
📷 [`view_output.png`](Screenshots/view_output.png)

### 8. 📐 Scalar Function – Annual Salary
- Function that calculates annual salary from monthly.  
📷 [`scalar_function_output.png`](Screenshots/scalar_function_output.png)

### 9. 📊 Table-valued Function – Employees by Department
- Returns employees from a given department.  
📷 [`function_output.png`](Screenshots/function_output.png)

### 10. 🔄 After Trigger – Log Insertions
- Automatically logs inserted employee data.  
📷 [`insert_trigger_log.png`](Screenshots/insert_trigger_log.png)

### 11. ❌ Instead Of Trigger – Delete Restriction
- Prevents deletion if salary is more than ₹60,000.  
📷 [`delete_trigger_test.png`](Screenshots/delete_trigger_test.png)

### 12. 🔄 Transaction + Isolation Level
- Increases salary inside a transaction with `READ COMMITTED`.  
📷 [`transaction_output.png`](Screenshots/transaction_output.png)

### 13. 🗂️ Index Creation
- Clustered and non-clustered index creation.  
📷 [`index_list.png`](Screenshots/index_list.png)

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
