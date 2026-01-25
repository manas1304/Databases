-- Link -- https://leetcode.com/problems/fix-names-in-a-table/description/
-- Question:
-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

select user_id,
    concat(
        upper(subtring(name, 1, 1)),
        lower(substring(name, 2))
    )
    as name
from Users
order by user_id;