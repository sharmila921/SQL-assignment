DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
drop table Employees;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    age INT CHECK (age >= 18),
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,
    location_id INT,

    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
INSERT INTO Location (location_name)
VALUES
('Chennai'),
('Bangalore'),
('Hyderabad');

INSERT INTO Employees
(employee_id, employee_name, gender, age, designation, salary, hire_date, department_id, location_id)
VALUES
(2, 'Priya Sharma', 'F', 26, 'HR Executive', 45000, '2017-06-15', 102, 2),
(3, 'Ravi Singh', 'M', 35, 'Finance Manager', 75000, '2014-03-10', 103, 1),
(4, 'Anita Verma', 'F', 24, NULL, 48000, '2018-08-20', 101, 3),
(5, 'Karthik Raj', 'M', 30, 'Business Analyst', 62000, '2018-01-12', 104, 2);

CREATE TABLE if not exists Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE  if not exists Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE if not exists employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender = 'M' OR gender = 'F'),
    age INT CHECK (age >= 18),
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    department_id INT REFERENCES Departments(department_id),
    location_id INT REFERENCES Location(location_id),
    salary int
);


DELIMITER $$
CREATE PROCEDURE show_all_tables()
BEGIN
    SELECT * FROM Employees;
    SELECT * FROM Departments;
    SELECT * FROM Location;
END$$
DELIMITER ;
CALL show_all_tables();

DELIMITER $$
CREATE PROCEDURE get_distinct_salaries()
BEGIN
    SELECT DISTINCT salary
    FROM Employees;
END$$
DELIMITER ;
CALL get_distinct_salaries();


DELIMITER $$
CREATE PROCEDURE update_null_designation()
BEGIN
    UPDATE Employees
    SET designation = 'Data Scientist'
    WHERE designation IS NULL;
END$$

DELIMITER ;
CALL update_null_designation();
 

SELECT age AS Employee_Age,
       salary AS Employee_Salary
FROM Employees;



SELECT *
FROM Employees
WHERE salary > 50000
  AND hire_date < '2016-01-01';
  
 
select * from Employees;

UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;

SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;
RENAME TABLE departments to departments_info;



SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date
LIMIT 5;

SELECT SUM(e.salary) AS Total_Finance_Salary
FROM Employees e
JOIN Departments_Info d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Minimum_Age
FROM Employees;
RENAME TABLE location to locations;
SELECT l.location_name,
       MAX(e.salary) AS Max_Salary
FROM Employees e
JOIN Locations l
ON e.location_id = l.location_id
GROUP BY l.location_name;

SELECT designation,
       AVG(salary) AS Average_Salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY department_id
HAVING COUNT(*) < 3;

SELECT location_id,
       AVG(age) AS Average_Age
FROM Employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;

SELECT e.employee_name,
       e.designation,
       d.department_name
FROM Employees e
INNER JOIN Departments_Info d
ON e.department_id = d.department_id;

SELECT d.department_name,
       COUNT(e.employee_id) AS Total_Employees
FROM Departments_Info d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;




