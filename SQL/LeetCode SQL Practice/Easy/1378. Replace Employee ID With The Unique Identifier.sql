-- Link -- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/
-- Question:
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
-- Return the result table in any order.

select eu.unique_id, e.name 
from Employees e
left join EmployeeUNI eu
on e.id = eu.id;