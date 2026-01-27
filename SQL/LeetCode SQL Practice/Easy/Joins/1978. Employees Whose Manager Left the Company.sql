-- Link -- https://leetcode.com/problems/employees-whose-manager-left-the-company/description/
-- Question: 
-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. 
-- When a manager leaves the company, their information is deleted from the Employees table, 
-- but the reports still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.

-- Method 1 - Using Subquery ( Easiest )
select employee_id
from Employees
where salary < 30000
and manager_id is not null 
and manager_id not in (select employee_id from Employees)
order by employee_id;

-- Method 2 -- Using Left Joins
select e.employee_id
from Employees e
left join Employees m on e.manager_id = m.employee_id
where e.salary < 30000
and e.manager_id is not null
and m.employee_id is null
order by e.employee_id;