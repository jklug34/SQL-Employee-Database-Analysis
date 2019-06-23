# SQL-Employee-Database-Analysis
Data Modeling, Engineering and Analysis on a SQL employee database along with additional analysis using SQLAlchemy and Pandas

# Data Engineering Steps
- Inspect the six csv files and determine column headers and data types
- Look for columns with the same headers across the csv files
- Note that employee number (emp_no) is an integer and observed across 5 of the 6 csv files (employees, titles, salaries, dept_emp, and dept_manager)
- Note that department number (dept_no) is a string (VARCHAR) and shared across 3 of the 6 files (departments, dept_emp, and dept_manager)
- Set emp_no in the employees csv file as the primary key and reference emp_no in the other csv files as a foriegn key
- Set dept_no as a primary key in the departments csv and reference dept_no as a foriegn key in dept_emp and dept_mangager csv files
- Other than emp_no and salary which are set to integers all other column headers are set to strings (VARCHAR)
- The relationship types used were many to one. An example: an employee can have multiple department managers

Employee Database Entity Relationship Diagram (ERD) showing the relationships between tables

![Employee Database ERD](https://user-images.githubusercontent.com/48166327/59970917-7bcf7480-9526-11e9-9edb-2ac834493bac.png)


After analyzing the average salary data across job title it was clear that the numbers reported were not correct. For example, senior engineers and managers were making less than staff.

![average_salary_by_title](https://user-images.githubusercontent.com/48166327/59970920-825dec00-9526-11e9-8406-61aba47c7d6b.png)
