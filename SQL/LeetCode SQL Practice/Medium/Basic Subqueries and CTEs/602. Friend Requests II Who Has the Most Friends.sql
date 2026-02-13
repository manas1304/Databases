-- Link -- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
-- Question:
-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.

with ALLIDs as(
    select requester_id as id from RequestAccepted
    union all
    select accepter_id as id from RequestAccepted
)
select id, count(*) as num
from RequestAccepted
group by id
order by num desc
limit 1;