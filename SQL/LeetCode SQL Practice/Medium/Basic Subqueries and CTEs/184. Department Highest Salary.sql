-- Link -- https://leetcode.com/problems/department-highest-salary/description/
-- Question:
-- Write a solution to find employees who have the highest salary in each of the departments.
-- Return the result table in any order.

select
d.name as Department,
e.name as Employee,
e.salary as Salary
from Department d
join Employee e on d.id = e.departmentId
where e.salary = (
    select max(salary)
    from Employee
    where departmentId = d.id
);