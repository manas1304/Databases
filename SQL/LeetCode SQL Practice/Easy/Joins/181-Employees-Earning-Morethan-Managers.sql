-- Link -- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- Question:
-- Write a solution to find the employees who earn more than their managers.
-- Return the result table in any order.

select e.name as Employee
from Employee e
join Employee m on
m.Id = e.managerId
where e.salary > m.salary;
