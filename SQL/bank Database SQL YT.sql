create table employees(
	emp_id serial primary key,
	fname varchar(100) not null,
	lname varchar(100) not null,
	email varchar(100) not null unique,
	dept varchar(50),
	salary decimal(10,2) default 30000.00,
	hire_data date not null default current_date
);

select * from employees;

alter table employees
rename column hire_data to hire_date;

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date) 

      VALUES

(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),

(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),

(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),

(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),

(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),

(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),

(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),

(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),

(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),

(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');


select * from employees 
where emp_id = 5

select * from employees
where dept = 'HR'

select * from employees where salary < 50000.00

select * from employees where dept = 'IT' or dept = 'HR'
select * from employees where dept = 'Finance' or dept = 'Marketing'

select * from employees where dept = 'IT' and salary < 50000

select * from employees where dept not in('IT', 'Finance', 'HR');
-- above query is an alternative of or with a much simpler syntax.

select * from employees where salary between 40000 and 55000

select dept from employees

select distinct dept from employees



------------------   ORDER BY clause is used for alphabetical sorting -----------------



select * from employees order by fname;
-- this query means that show me all the data just sort the data in alphabetical order by first name.

select * from employees order by fname desc;

-- to get only the starting 3 rows of the table
select * from employees limit 3;

-- very important - like clause ( it is case sensitive )
select * from employees where fname like 'A%'; 
-- these were for names starting with a

-- for names ending with a
select * from employees where fname like '%a'

select * from employees where fname like 'A%i'

select * from employees where fname like  '%i%' 

-- to ensure the letter is between the two letters
select * from employees where fname like '%_i_%'

-- to ensure only two characters are there in the dept name
select * from employees where dept like '__'; -- this ensure only two characters are present

-- to ensure the second letter is 'a' in fname 
select * from employees where fname like '_a%'




----------- AGGREGATE FUNCTIONS ----------------------
-- count, sum, avg, min, max


-- use primary key when counting to get the right count and avoid duplicates
select count(emp_id) from employees;

-- sum function
select sum(salary) from employees;

--avg function
select avg(salary) from employees;

-- min function
select min(salary) from employees;

--max function
select max(salary) from employees;


--------------------- GROUP BY ----------------------
-- a common subject is must in grouping ( one the basis of this common subject grouping is done )

-- this gets me all the departments ( Groups have been made)
select dept from employees group by dept; 

-- now count each member in the group
-- dept,count(emp_id) -- these are the columns that are shown
select  dept,count(emp_id) from employees  group by dept;
-- mtlb har dept mein kitne employees hai  unka count nikalna hai dept ke groups banate hue....... Simple

-- har dept mein kitni salary provide kr rhe hain
select dept, sum(salary) from employees group by dept;

-- avg salary in each department
select dept, avg(salary) from employees group by dept;




---------------- STRING FUNCTIONS ---------------------------
types of string functions
-- concat
-- concat_ws
-- substr
-- left,right
-- length
-- lower,upper
-- trim,ltrim,rtrim
-- replace
-- position
-- string_agg

select concat('hello', 'world')

select concat(fname,' ', lname) as FullName from employees;

select emp_id, concat(fname, lname) as FullName, dept from employees;

select concat_ws(' ', fname, lname) as FullName from employees;

select substring('hello buddy', 1, 5);

select substring('hello buddy', 7, 11);

--- select replace(which word or column to change, 'which word to change in that word or column exactly', 'replace to')

select replace('ABCDEF', 'ABC', 'PQR');

select replace(dept, 'IT', 'Tech' ) from employees;

select * from employees;

select reverse('hello');

select length('hello world');

select emp_id, fname,length(fname) from employees;

select emp_id, fname  from employees where length(fname) > 5;

select upper(fname) from employees;
select lower(fname) from employees;

select left('hello world', 7);

select right('hello world', 7);


select length(trim('           hello world         '));

select position('om' in 'thomas');



----------- Some practice exercises ---------------

Task 1 : 
1:Raj:Sharma:IT

select concat_ws(':', emp_id, fname, lname, dept) from employees;

-- always remember that string in this postgres sql only work with single quotes.

Task2: 
1:Raj Sharma:IT:50000

select concat_ws(':', emp_id, concat(fname, ' ', lname), dept, salary) 
from employees 
where emp_id = 1;

TASK3:
4:Suman:FINANCE

select concat_ws(':', emp_id, fname, upper(dept)) from employees where emp_id = 4;

TASK 4:
I1 Raj
H2 Priya

select concat_ws(' ', concat(substring(dept, 1,1), emp_id), fname) from employees;



----------- Some questions regarding order by, distinct, like and limit -------------

-- Q1 : Find diff types of dept in database

select distinct dept from employees;


-- Q2: Display records with high to low salary

select fname, lname, dept, salary from employees order by salary desc;


-- Q3: How to see only top 3 records from the table

select * from employees limit 3;

-- Q4: Show records where first name start with letter 'A'

select fname from employees where fname like 'A%';

-- Q5: Show records where length of the lname is 4 characters

select * from employees where length(lname) = 4;



----------- Questions regarding count, group by, sum, min, max, avg ----------

-- Q1: Find total number of employees in database

select distinct count(*) from employees;

-- Q2: Find no. of employees in each department

select dept, count(emp_id) from employees group by dept;

-- Q3: Find the lowest salary paying to whom?

select fname, lname, salary from employees where salary = (select min(salary) from employees); -- This is a subquery

-- Q4: Find the total salary paying in IT department?

select sum(salary) from employees where dept = 'IT';

-- Q5: Find avg salary in each department

select dept, avg(salary) from employees group by dept;

-- Q6: Find the highest salary paid and to whom

select * from employees order by salary desc limit 1; -- Not a good method if there are multiples

select * from employees where salary = (select max(salary) from employees);
-- The above type of query is called a Subquery ( where we put query inside a query).



-------------------- CASE Expression -------------------------

select fname, salary,
case 
	when salary >= 50000 then 'High'
	else 'Low'
end as salary_category
from employees;

--- multiple cases

select fname, salary,
case
	when salary <= 45000 then 'Low'
	when salary > 45000 and salary <50000 then 'Mid'
	else 'High'
end as salary_category
from employees;


---------- Task ----------

select fname, salary,
case
	when salary > 0 then Round(salary*0.1)
end as bonus
from employees;


select 
case 
	when salary >= 60000 then 'High'
	when salary >= 50000 and salary < 60000 then 'mid'
	else 'low'
end as salary_category, count(emp_id)
from employees
group by salary_category;


















