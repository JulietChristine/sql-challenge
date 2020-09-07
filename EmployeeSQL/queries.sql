-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	e.sex as "Gender",
	s.salary as "Salary"
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- List first name, last name,
-- and hire date for employees who were hired in 1986.

SELECT
	first_name as "First Name",
	last_name as "Last Name",
	hire_date as "Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no as "Department Number",
	d.dept_name as "Department Name",
	m.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name"
FROM departments d
JOIN dept_manager m
ON (d.dept_no = m.dept_no)
	JOIN employees e
	ON (m.emp_no = e.emp_no);
	
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no);
	
-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."

SELECT
	first_name as "First Name",
	last_name as "Last Name",
	sex as "Gender"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT
	e.emp_no as "Employee Number",
	e.last_name as "Last Name",
	e.first_name as "First Name",
	d.dept_name as "Department Name"
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
	JOIN departments d
	ON (de.dept_no = d.dept_no)
WHERE dept_name = 'Sales' OR dept_name ='Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT
	last_name as "Last Name",
	COUNT(last_name) Frequency
FROM employees
GROUP BY "Last Name"
ORDER BY Frequency desc;