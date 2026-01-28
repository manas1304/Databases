-- Link -- https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/
-- Question:
-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, 
-- and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.

select m.employee_id, count(m.employee_id) as reports_count, round(avg(e.age)) as average_age
from Employees e
join Employees m on e.reports_to = m.employee_id
group by m.employee_id, m.name
order by m.employee_id;