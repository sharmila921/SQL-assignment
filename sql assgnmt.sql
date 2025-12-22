CREATE DATABASE employee;
USE employee;
CREATE TABLE departments (department_id INT PRIMARY KEY ,department_name VARCHAR(100));
CREATE TABLE employees (employee_id INT PRIMARY KEY ,employee_name VARCHAR(50) ,gender ENUM('M','F') ,
aage INT, hire_date DATE, designation VARCHAR(100) , salary DECIMAL (10.2));
CREATE TABLE location (location_id INT PRIMARY KEY, location VARCHAR(30));
ALTER TABLE employees ADD COLUMN email VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN  designation VARCHAR(200);
ALTER TABLE employees DROP COLUMN aage;
ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;
RENAME TABLE departments to department_info;
RENAME TABLE location to locations;
TRUNCATE TABLE employees;
DROP TABLE employees;
DROP TABLE IF EXISTS Employees;

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
CREATE TABLE if not exists Employees (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Hire_Date DATE NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0)
);
CREATE TABLE if not exists Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) CHECK (gender = 'M' OR gender = 'F'),
    age INT CHECK (age >= 18),
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    department_id INT REFERENCES Departments(department_id),
    location_id INT REFERENCES Location(location_id)
);

