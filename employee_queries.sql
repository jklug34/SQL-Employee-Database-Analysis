-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM "employees";
SELECT * FROM "salaries";

SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no
ORDER BY emp_no;

-- use alias
SELECT e.emp_no,
  e.last_name,
  e.first_name,
  e.gender,
  s.salary
FROM employees AS e
INNER JOIN salaries AS s 
ON (e.emp_no = s.emp_no)
ORDER BY emp_no;

--2. List employees who were hired in 1986.
SELECT * FROM "employees";

SELECT emp_no, last_name, first_name, hire_date 
FROM employees
WHERE hire_date LIKE '1986%'
ORDER BY hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * FROM "departments";
SELECT * FROM "employees";
SELECT * FROM "dept_manager";

SELECT dept_manager.dept_no,
  departments.dept_name,
  dept_manager.emp_no,
  employees.last_name,
  employees.first_name,
  dept_manager.from_date,
  dept_manager.to_date
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no
	JOIN departments ON
	departments.dept_no = dept_manager.dept_no
	ORDER BY dept_no;

--use alias	
SELECT dm.dept_no,
  d.dept_name,
  dm.emp_no,
  e.last_name,
  e.first_name,
  dm.from_date,
  dm.to_date
FROM dept_manager AS dm
JOIN employees AS e 
ON (dm.emp_no = e.emp_no)
	JOIN departments AS d 
	ON (d.dept_no = dm.dept_no)
	ORDER BY dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM "employees";
SELECT * FROM "dept_emp";
SELECT * FROM "departments";

SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
	JOIN departments ON
	departments.dept_no = dept_emp.dept_no
	ORDER BY emp_no;
	
-- use alias
SELECT e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no = de.emp_no)
	JOIN departments AS d 
	ON (d.dept_no = de.dept_no)
	ORDER BY emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY emp_no;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no = de.emp_no)
	JOIN departments AS d 
	ON (d.dept_no = de.dept_no)
	WHERE d.dept_name = 'Sales'
	ORDER BY emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
  e.last_name,
  e.first_name,
  d.dept_name
FROM employees AS e
JOIN dept_emp AS de 
ON (e.emp_no = de.emp_no)
	JOIN departments AS d 
	ON (d.dept_no = de.dept_no)
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
	ORDER BY emp_no;
	
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last name count" FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;


--2. Create a bar chart of average salary by title.
SELECT * FROM "titles";
SELECT * FROM "salaries";

SELECT title, ROUND(AVG(salary), 2) AS "Avg Salary"
FROM titles
INNER JOIN salaries ON
titles.emp_no = salaries.emp_no
GROUP BY title
ORDER BY "Avg Salary" DESC;

--add alias
SELECT title, ROUND(AVG(salary), 2) AS "Average Salary"
FROM titles AS t
INNER JOIN salaries AS s 
ON (t.emp_no = s.emp_no)
GROUP BY title
ORDER BY "Average Salary" DESC;
