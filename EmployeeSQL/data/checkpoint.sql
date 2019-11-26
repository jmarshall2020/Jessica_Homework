--create a new table
CREATE TABLE departments(
	dept_no VARCHAR (30) NOT NULL,
	dept_name VARCHAR (30) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

--view table columns
select * from departments
select * from dept_employee
select * from dept_manager
select * from employees
select * from salaries
select * from titles


--drop table
drop table titles;

--insert data into table
--insert into department (dept_id,dept_name)
--values('d001','Marketing'),('d002','Finance'),('d003','Human Resources'),
--('d004','Production'),('d005','Development'),('d006','Quality Management'),
--('d007','Sales'),('d008','Research'),('d009','Customer Service');


CREATE TABLE dept_employee(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR (30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE dept_manager(
	dept_no VARCHAR (30) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR (30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

select * from employees

-- 1. List the following details of each employee: 
--employee number,last name, first name, gender, and salary.

select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e left join salaries as s
on (e.emp_no= s.emp_no)
order by e.emp_no;

-- 2. List employees who were hired in 1986.
select first_name, last_name
from employees 
where hire_date 
between '1986-01-01' and '1986-12-31'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
--select dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name dm.from_date, dm.to_date

SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name,
        dm.from_date,
        dm.to_date
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select  e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees AS e
	INNER JOIN dept_employee AS de
		on (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
		ORDER BY e.emp_no;
		
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

select  e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees AS e
	INNER JOIN dept_employee AS de
		on (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales'
	ORDER BY e.emp_no;

-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

select  e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM employees AS e
	INNER JOIN dept_employee AS de
		on (e.emp_no = de.emp_no)
	INNER JOIN departments as d
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name IN ('Sales', 'Development')
	ORDER BY e.emp_no;


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;


