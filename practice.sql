CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments (department_id),
    salary DECIMAL (10, 2),
    hire_date DATE
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

DROP TABLE employees;
DROP TABLE departments;

INSERT INTO departments (department_name) VALUES
('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Customer Support'),
('Administration'),
('Research'),
('Quality Assurance');

INSERT INTO employees (employee_name, department_id, salary, hire_date) VALUES
('Christopher Lee', 4, 72000.00, '2021-06-14'),
('Amanda Harris', 5, 68000.00, '2022-07-03'),
('Matthew Clark', 6, 81000.00, '2020-09-17'),
('Jessica Lewis', 7, 65000.00, '2022-05-22'),
('Daniel Walker', 8, 74000.00, '2021-04-11'),
('Olivia Hall', 9, 69000.00, '2022-08-19'),
('Andrew Young', 1, 77000.00, '2020-12-05'),
('Sophia Allen', 4, 63000.00, '2022-09-28'),
('Kevin King', 5, 85000.00, '2019-11-30'),
('Nicole Scott', 6, 71000.00, '2021-08-15'),
('Ryan Green', 7, 78000.00, '2020-07-22'),
('Hannah Adams', 8, 67000.00, '2022-03-10'),
('Jason Baker', 3, 73000.00, '2021-02-18'),
('Rachel Gonzalez', 10, 80000.00, '2020-04-27'),
('William Nelson', 4, 75000.00, '2021-10-09'),
('Megan Carter', 5, 64000.00, '2022-11-21'),
('Joshua Mitchell', 6, 82000.00, '2020-01-15'),
('Lauren Perez', 2, 69000.00, '2022-06-30');

SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM employees
JOIN departments on employees.department_id = departments.department_id;

SELECT * FROM employees
JOIN departments USING(department_id);

SELECT department_name FROM employees
JOIN departments USING (department_id)
GROUP BY department_name;