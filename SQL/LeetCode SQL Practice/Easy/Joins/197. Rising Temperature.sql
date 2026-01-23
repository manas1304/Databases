-- Link -- https://leetcode.com/problems/rising-temperature/description/
-- Question: 
-- Write a solution to find all dates id with higher temperatures compared to its previous dates (yesterday)
-- Return the result table in any order.

select w1.id 
from Weather w1
join
Weather w2 on w1.recordDate = w2.recordDate + interval '1 day'
where w1.temperature > w2.temperature;