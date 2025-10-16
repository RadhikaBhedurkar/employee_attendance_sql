# employee_attendance_sql

Employee Attendance Management System (SQL Project)

# Overview

The **Employee Attendance Management System** helps companies monitor:
- Daily attendance of employees  
- Total working hours  
- Leave records  
- Department-wise attendance statistics

# ER Diagram

Department (dept_id, dept_name)
│
└──< Employee (emp_id, emp_name, gender, dob, hire_date, dept_id, email, phone)
│
├──< Attendance (attendance_id, emp_id, attendance_date, check_in, check_out, total_hours, status)
└──< LeaveRecord (leave_id, emp_id, leave_type, start_date, end_date, reason)

# Concepts Used

1.SQL Joins (INNER, LEFT)

2.Aggregate Functions (SUM, COUNT, AVG)

3.Subqueries

4.GROUP BY and HAVING

5.Date and Time Functions

6.Normalization (3NF)


