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