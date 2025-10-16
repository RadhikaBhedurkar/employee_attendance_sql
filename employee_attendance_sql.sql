-- Create Database

CREATE DATABASE employee_attendance;

USE employee_attendance;

-- Department Table

CREATE TABLE Department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- Employee Table

CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    gender ENUM('Male','Female','Other'),
    dob DATE,
    hire_date DATE,
    dept_id INT,
    email VARCHAR(100),
    phone VARCHAR(15),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Attendance Table

CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE,
    check_in TIME,
    check_out TIME,
    total_hours DECIMAL(5,2),
    status ENUM('Present', 'Absent', 'Leave') DEFAULT 'Present',
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Leave Record Table

CREATE TABLE LeaveRecord (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    leave_type ENUM('Sick Leave', 'Casual Leave', 'Paid Leave'),
    start_date DATE,
    end_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Department (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Sales'),
(5, 'Marketing');


INSERT INTO Employee (emp_id, emp_name, gender, dob, hire_date, dept_id, email, phone) VALUES
(1, 'Amit Sharma', 'Male', '1990-05-10', '2020-01-15', 3, 'amit@company.com', '9876543210'),
(2, 'Priya Nair', 'Female', '1992-08-25', '2021-06-01', 1, 'priya@company.com', '9988776655'),
(3, 'Rohan Gupta', 'Male', '1988-12-20', '2019-09-12', 4, 'rohan@company.com', '9123456789'),
(4, 'Sneha Patel', 'Female', '1995-04-18', '2022-03-20', 2, 'sneha@company.com', '9998877665'),
(5, 'Vikram Singh', 'Male', '1985-07-02', '2018-11-10', 3, 'vikram@company.com', '9786543210'),
(6, 'Karan Mehta', 'Male', '1993-09-30', '2020-07-01', 4, 'karan@company.com', '9798123456'),
(7, 'Meera Joshi', 'Female', '1994-01-14', '2023-01-05', 5, 'meera@company.com', '9856231478'),
(8, 'Rajiv Verma', 'Male', '1991-02-11', '2021-02-01', 2, 'rajiv@company.com', '9891122334'),
(9, 'Ananya Rao', 'Female', '1996-03-22', '2023-06-10', 1, 'ananya@company.com', '9922334455'),
(10, 'Deepak Kumar', 'Male', '1989-11-09', '2019-12-02', 3, 'deepak@company.com', '9812233445');


INSERT INTO Attendance (attendance_id, emp_id, attendance_date, check_in, check_out, total_hours, status) VALUES
(1, 1, '2025-10-01', '09:05:00', '17:30:00', 8.25, 'Present'),
(2, 1, '2025-10-02', '09:10:00', '17:45:00', 8.50, 'Present'),
(3, 1, '2025-10-03', NULL, NULL, 0, 'Leave'),

(4, 2, '2025-10-01', NULL, NULL, 0, 'Leave'),
(5, 2, '2025-10-02', '09:00:00', '17:15:00', 8.25, 'Present'),
(6, 2, '2025-10-03', '09:05:00', '17:10:00', 8.08, 'Present'),

(7, 3, '2025-10-01', '09:00:00', '18:00:00', 9.00, 'Present'),
(8, 3, '2025-10-02', '09:10:00', '18:10:00', 9.00, 'Present'),
(9, 3, '2025-10-03', '09:15:00', '18:05:00', 8.83, 'Present'),

(10, 4, '2025-10-01', '09:20:00', '17:40:00', 8.33, 'Present'),
(11, 4, '2025-10-02', NULL, NULL, 0, 'Absent'),
(12, 4, '2025-10-03', '09:10:00', '17:00:00', 7.83, 'Present'),

(13, 5, '2025-10-01', '08:55:00', '17:30:00', 8.58, 'Present'),
(14, 5, '2025-10-02', '09:05:00', '17:45:00', 8.67, 'Present'),
(15, 5, '2025-10-03', '09:00:00', '17:20:00', 8.33, 'Present'),

(16, 6, '2025-10-01', '09:10:00', '17:00:00', 7.83, 'Present'),
(17, 6, '2025-10-02', '09:30:00', '17:30:00', 8.00, 'Present'),
(18, 6, '2025-10-03', NULL, NULL, 0, 'Leave'),

(19, 7, '2025-10-01', '09:00:00', '17:10:00', 8.17, 'Present'),
(20, 7, '2025-10-02', '09:05:00', '17:20:00', 8.25, 'Present'),
(21, 7, '2025-10-03', '09:15:00', '17:40:00', 8.42, 'Present'),

(22, 8, '2025-10-01', NULL, NULL, 0, 'Absent'),
(23, 8, '2025-10-02', '09:20:00', '17:45:00', 8.42, 'Present'),
(24, 8, '2025-10-03', '09:10:00', '17:30:00', 8.33, 'Present'),

(25, 9, '2025-10-01', '09:00:00', '17:10:00', 8.17, 'Present'),
(26, 9, '2025-10-02', '09:15:00', '17:25:00', 8.17, 'Present'),
(27, 9, '2025-10-03', NULL, NULL, 0, 'Leave'),

(28, 10, '2025-10-01', '09:05:00', '17:35:00', 8.50, 'Present'),
(29, 10, '2025-10-02', '09:10:00', '17:20:00', 8.17, 'Present'),
(30, 10, '2025-10-03', '09:00:00', '17:40:00', 8.67, 'Present');


INSERT INTO LeaveRecord (leave_id, emp_id, leave_type, start_date, end_date, reason) VALUES
(1, 1, 'Paid Leave', '2025-10-03', '2025-10-03', 'Personal work'),
(2, 2, 'Sick Leave', '2025-10-01', '2025-10-01', 'Fever'),
(3, 6, 'Casual Leave', '2025-10-03', '2025-10-03', 'Family function'),
(4, 9, 'Paid Leave', '2025-10-03', '2025-10-03', 'Medical appointment');


-- List all employees with their department names.

SELECT e.emp_name, d.dept_name
FROM Employee e
JOIN Department d 
ON e.dept_id = d.dept_id;

-- Find all employees who were present on 2025-10-01.

SELECT e.emp_name, a.attendance_date, a.status
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.attendance_date = '2025-10-01' AND a.status = 'Present';


-- Display employees who took a leave in October 2025.

SELECT e.emp_name, l.leave_type, l.start_date, l.reason
FROM LeaveRecord l
JOIN Employee e 
ON l.emp_id = e.emp_id
WHERE MONTH(l.start_date) = 10 AND YEAR(l.start_date) = 2025;


-- Count the number of employees in each department.

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Department d
LEFT JOIN Employee e 
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Show total working hours of each employee for October 2025.

SELECT e.emp_name, SUM(a.total_hours) AS total_work_hours
FROM Attendance a
JOIN Employee e
ON a.emp_id = e.emp_id
WHERE MONTH(a.attendance_date) = 10 AND YEAR(a.attendance_date) = 2025
GROUP BY e.emp_name
ORDER BY total_work_hours DESC;


-- Find employees who were absent on any day.

SELECT DISTINCT e.emp_name
FROM Attendance a
JOIN Employee e
ON a.emp_id = e.emp_id
WHERE a.status = 'Absent';


-- Show department-wise total attendance count.

SELECT d.dept_name, COUNT(a.attendance_id) AS attendance_records
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
JOIN Department d 
ON e.dept_id = d.dept_id
WHERE a.status = 'Present'
GROUP BY d.dept_name;


-- Find employees who worked more than 8.5 hours on any day.

SELECT DISTINCT e.emp_name, a.attendance_date, a.total_hours
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.total_hours > 8.5;


-- Get the average working hours per employee.

SELECT e.emp_name, ROUND(AVG(a.total_hours),2) AS avg_hours
FROM Attendance a
JOIN Employee e
ON a.emp_id = e.emp_id
WHERE a.status = 'Present'
GROUP BY e.emp_name;


-- Find employees who joined after 2021.

SELECT emp_name, hire_date
FROM Employee
WHERE hire_date > '2021-12-31';


-- Show employees who have not taken any leave.

SELECT e.emp_name
FROM Employee e
LEFT JOIN LeaveRecord l 
ON e.emp_id = l.emp_id
WHERE l.leave_id IS NULL;


-- Get department-wise average working hours.

SELECT d.dept_name, ROUND(AVG(a.total_hours),2) AS avg_hours
FROM Attendance a
JOIN Employee e
ON a.emp_id = e.emp_id
JOIN Department d 
ON e.dept_id = d.dept_id
WHERE a.status = 'Present'
GROUP BY d.dept_name;


-- List top 3 employees with the highest total working hours.

SELECT e.emp_name, SUM(a.total_hours) AS total_work_hours
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
GROUP BY e.emp_name
ORDER BY total_work_hours DESC
LIMIT 3;


-- Find employees who checked in after 9:15 AM.

SELECT e.emp_name, a.attendance_date, a.check_in
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.check_in > '09:15:00';


-- Monthly summary: total presents, absents, and leaves.

SELECT 
    MONTH(attendance_date) AS month,
    COUNT(CASE WHEN status='Present' THEN 1 END) AS present_days,
    COUNT(CASE WHEN status='Absent' THEN 1 END) AS absent_days,
    COUNT(CASE WHEN status='Leave' THEN 1 END) AS leave_days
FROM Attendance
GROUP BY MONTH(attendance_date);


-- Identify employees with perfect attendance (no Absent or Leave).

SELECT e.emp_name
FROM Employee e
WHERE e.emp_id NOT IN (
    SELECT emp_id FROM Attendance WHERE status IN ('Absent', 'Leave')
);


-- List all employees who belong to the “Engineering” department.

SELECT emp_name 
FROM Employee e
JOIN Department d 
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';


-- Show total number of attendance records available in the system.

SELECT COUNT(*) AS total_records FROM Attendance;


-- Display the earliest and latest check-in time recorded in October 2025.

SELECT MIN(check_in) AS earliest_checkin, MAX(check_in) AS latest_checkin
FROM Attendance
WHERE MONTH(attendance_date) = 10 AND YEAR(attendance_date) = 2025;


-- Find employees whose total working hours exceed 24 hours in total (for the month).

SELECT e.emp_name, SUM(a.total_hours) AS total_hours
FROM Attendance a
JOIN Employee e 
ON e.emp_id = a.emp_id
GROUP BY e.emp_name
HAVING SUM(a.total_hours) > 24;


-- Retrieve all employees who have checked in before 9 AM.

SELECT DISTINCT e.emp_name
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.check_in < '09:00:00';


-- Get number of employees who took each type of leave.

SELECT leave_type, COUNT(DISTINCT emp_id) AS employees_count
FROM LeaveRecord
GROUP BY leave_type;


-- Display all employees and their leave count.

SELECT e.emp_name, COUNT(l.leave_id) AS leave_count
FROM Employee e
LEFT JOIN LeaveRecord l 
ON e.emp_id = l.emp_id
GROUP BY e.emp_name
ORDER BY leave_count DESC;


-- Find employees who have never been absent but took a leave.

SELECT e.emp_name
FROM Employee e
WHERE e.emp_id IN (
  SELECT emp_id FROM LeaveRecord
)
AND e.emp_id NOT IN (
  SELECT emp_id FROM Attendance WHERE status = 'Absent'
);


-- Find which department has the maximum employees.

SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM Department d
JOIN Employee e 
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY emp_count DESC
LIMIT 1;


-- Show employees who worked less than 8 hours on any day.

SELECT DISTINCT e.emp_name, a.attendance_date, a.total_hours
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.total_hours < 8 AND a.status = 'Present';


-- Display department-wise average age of employees.

SELECT d.dept_name, ROUND(AVG(TIMESTAMPDIFF(YEAR, e.dob, CURDATE())),1) AS avg_age
FROM Employee e
JOIN Department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


-- List employees whose phone number starts with ‘98’.

SELECT emp_name, phone 
FROM Employee
WHERE phone LIKE '98%';


-- Show all attendance records where checkout is NULL (not logged out).

SELECT e.emp_name, a.attendance_date, a.check_in
FROM Attendance a
JOIN Employee e
ON a.emp_id = e.emp_id
WHERE a.check_out IS NULL;


-- Display employees sorted by their total attendance days (descending).

SELECT e.emp_name, COUNT(a.attendance_id) AS days_present
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
WHERE a.status = 'Present'
GROUP BY e.emp_name
ORDER BY days_present DESC;


-- Show each department’s total leaves taken in October 2025.

SELECT d.dept_name, COUNT(l.leave_id) AS total_leaves
FROM LeaveRecord l
JOIN Employee e 
ON e.emp_id = l.emp_id
JOIN Department d 
ON d.dept_id = e.dept_id
WHERE MONTH(l.start_date) = 10 AND YEAR(l.start_date) = 2025
GROUP BY d.dept_name;


-- Show each department’s total leaves taken in October 2025.

SELECT d.dept_name, COUNT(l.leave_id) AS total_leaves
FROM LeaveRecord l
JOIN Employee e 
ON e.emp_id = l.emp_id
JOIN Department d 
ON d.dept_id = e.dept_id
WHERE MONTH(l.start_date) = 10 AND YEAR(l.start_date) = 2025
GROUP BY d.dept_name;


-- Find the youngest and oldest employee in the company.

SELECT emp_name, dob
FROM Employee
ORDER BY dob DESC
LIMIT 1;  -- Youngest

SELECT emp_name, dob
FROM Employee
ORDER BY dob ASC
LIMIT 1;  -- Oldest


-- Get the total number of working days recorded in October 2025.

SELECT COUNT(DISTINCT attendance_date) AS total_days
FROM Attendance
WHERE MONTH(attendance_date) = 10 AND YEAR(attendance_date) = 2025;


-- Find the employee with the highest average daily hours.

SELECT e.emp_name, ROUND(AVG(a.total_hours),2) AS avg_hours
FROM Attendance a
JOIN Employee e 
ON e.emp_id = a.emp_id
GROUP BY e.emp_name
ORDER BY avg_hours DESC
LIMIT 1;


-- Show total number of males and females in the company.

SELECT gender, COUNT(*) AS count
FROM Employee
GROUP BY gender;


-- Retrieve attendance data of employees who work in Finance or HR.

SELECT e.emp_name, d.dept_name, a.attendance_date, a.status
FROM Attendance a
JOIN Employee e 
ON a.emp_id = e.emp_id
JOIN Department d 
ON e.dept_id = d.dept_id
WHERE d.dept_name IN ('Finance', 'Human Resources');


-- Find all employees who joined before 2020.

SELECT emp_name, hire_date
FROM Employee
WHERE hire_date < '2020-01-01';


-- Show each employee’s total presents, absents, and leaves.

SELECT e.emp_name,
       SUM(CASE WHEN a.status='Present' THEN 1 ELSE 0 END) AS present_days,
       SUM(CASE WHEN a.status='Absent' THEN 1 ELSE 0 END) AS absent_days,
       SUM(CASE WHEN a.status='Leave' THEN 1 ELSE 0 END) AS leave_days
FROM Attendance a
JOIN Employee e ON a.emp_id = e.emp_id
GROUP BY e.emp_name;


-- List the departments with no employees.

SELECT d.dept_name
FROM Department d
LEFT JOIN Employee e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


-- Display employees with more than one type of leave record.

SELECT e.emp_name, COUNT(DISTINCT l.leave_type) AS types_of_leave
FROM LeaveRecord l
JOIN Employee e ON e.emp_id = l.emp_id
GROUP BY e.emp_name
HAVING COUNT(DISTINCT l.leave_type) > 1;











 


















