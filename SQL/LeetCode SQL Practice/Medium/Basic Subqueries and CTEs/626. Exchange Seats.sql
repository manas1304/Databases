-- Link -- https://leetcode.com/problems/exchange-seats/description/
-- Question:
-- Write a solution to swap the seat id of every two consecutive students. 
-- If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.

select
    case 
        when id % 2 = 1 and id = (select max(id) from Seat) then id
        when id % 2 = 1 then id + 1
        else id - 1
    end as id,
    student
from Seat
order by id;