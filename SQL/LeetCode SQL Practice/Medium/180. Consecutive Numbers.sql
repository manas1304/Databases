-- Link -- https://leetcode.com/problems/consecutive-numbers/description/
-- Question:
-- Find all numbers that appear at least three times consecutively.
-- Return the result table in any order.

select distinct
l1.id as ConsecutiveNums
from Logs l1
join Logs l2 on l2.id = l1.id + 1
join Logs l3 on l3.id = l2.id + 1
where l1.num = l2.num and l2.num = l3.num;