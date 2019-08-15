---CREATING TABLES

--Departments table
CREATE TABLE departments (
  dept_no character varying NOT NULL PRIMARY KEY,
  dept_name varchar(45) NOT NULL	
);

select * from departments;

--Department Manager Table
CREATE TABLE dept_manager (
	dept_no character varying NOT NULL, 
	emp_no character varying NOT NULL,
	from_date timestamp without time zone NOT NULL,
	to_date timestamp without time zone NOT NULL
);
select * from dept_manager;
--DROP TABLE dept_manager;

--Departmetn employee Table
CREATE TABLE dept_emp (
	emp_no character varying NOT NULL, 
	dept_no character varying NOT NULL, 
	from_date timestamp without time zone DEFAULT now() NOT NULL, 
	to_date timestamp without time zone DEFAULT now() NOT NULL
);
--DROP TABLE dept_emp;
select * from dept_emp;

--Employee table
CREATE TABLE employees (
	emp_no character varying NOT NULL,
	birth_date timestamp without time zone DEFAULT now() NOT NULL, 
	first_name Varchar NOT NULL, 
	last_name Varchar NOT NULL, 
	gender Varchar NOT NULL, 
	hire_date timestamp without time zone DEFAULT now() NOT NULL
);
--DROP TABLE employees;
select * from employees;

--Salaries Table
CREATE TABLE salaries (
	emp_no character varying NOT NULL,
	salary float NOT NULL,
	from_date timestamp without time zone DEFAULT now() NOT NULL, 
	to_date timestamp without time zone DEFAULT now() NOT NULL
);
--DROP TABLE salaries;

--Titles table
CREATE TABLE titles (
	emp_no character varying NOT NULL, 
	title Varchar NOT NULL, 
	from_date timestamp without time zone DEFAULT now() NOT NULL,
	to_date timestamp without time zone DEFAULT now() NOT NULL
);
--DROP TABLE titles;

---List employee number, last name, gender, and salary
--need from employee table and salaries table  

SELECT s.emp_no, s.salary, e.last_name, e.gender
FROM salaries as s
JOIN employees as e
ON (s.emp_no = e.emp_no);

--list employees who were hired in 1986
select * from employees;

SELECT first_name, last_name
FROM employees
WHERE hire_date like 1985;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

select d.dept_no, d.dept_name, m.emp_no, m.to_date, e.hire_date, e.last_name, e.first_name
from departments as d
join dept_manager as m
on d.dept_no = m.dept_no
join employees as e 
on e.emp_no = m.emp_no;


--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.first_name, e.last_name, e.emp_no, dept_emp.dept_no, d.dept_name
from departments as d
join dept_emp 
on d.dept_no = dept_emp.dept_no
join employees as e 
on dept_emp.emp_no = e.emp_no;

--List all employees whose first name is 
--"Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, 
--and department name.

select e.first_name, e.last_name, e.emp_no, dept_emp.dept_no, d.dept_name
from departments as d
join dept_emp 
on d.dept_no = dept_emp.dept_no
join employees as e 
on dept_emp.emp_no = e.emp_no
where d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select e.first_name, e.last_name, e.emp_no, dept_emp.dept_no, d.dept_name
from departments as d
join dept_emp 
on d.dept_no = dept_emp.dept_no
join employees as e 
on dept_emp.emp_no = e.emp_no
where d.dept_name in ('Sales','Development');

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

select last_name, count(last_name) as "name_count"
from employees
group by last_name
order by "name_count" desc;







