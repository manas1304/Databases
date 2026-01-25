-- Link -- https://leetcode.com/problems/queries-quality-and-percentage/description/
-- Question:
-- We define query quality as:

-- The average of the ratio between query rating and its position.

-- We also define poor query percentage as:

-- The percentage of all queries with rating less than 3.

-- Write a solution to find each query_name, the quality and poor_query_percentage.

-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

-- Return the result table in any order.

select query_name,
round(avg(rating * 1.0/ position), 2),
round(avg(case when rating < 3 then 1 else 0), 2) as poor_query_percentage
from Queries
where query_name is not null
group by query_name;