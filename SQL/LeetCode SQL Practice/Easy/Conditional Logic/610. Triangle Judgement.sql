-- Link -- https://leetcode.com/problems/triangle-judgement/description/
-- Question:
-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.

select x, y, z, 
(
    case
        when x + y > z and x + z > y and y + z > x then 'Yes'
        else 'No'
    end
) as triangle
from Triangle;