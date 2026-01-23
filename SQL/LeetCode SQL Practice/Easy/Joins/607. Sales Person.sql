-- Link -- https://leetcode.com/problems/sales-person/description/
-- Question:
-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".
-- Return the result table in any order.

select sales_id 
from SalesPerson
where sales_id not in(
    select o.sales_id
    from Orders o
    join Company c on o.com_id = c.com_id
    where c.name = 'RED'
);


-- The subquery first finds the the company id from the company table where the name is 'RED
-- Then in orders table it finds the all the rows where the company is 'RED'
-- return all those sales id from the rows where the company is 'RED'

-- then in the outer query return all the sales id where the company is not 'RED'
-- ( Result - first fetch all the sales id with company 'RED' then use not in to exclude that. )