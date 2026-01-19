-- Link -- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
-- Question:
-- Write a solution to find managers with at least five direct reports.
-- Return the result table in any order.

select m.name
from Employee e
join Employee m
on e.managerId = m.id
group by m.id, m.name
having count(e.id)>= 5;