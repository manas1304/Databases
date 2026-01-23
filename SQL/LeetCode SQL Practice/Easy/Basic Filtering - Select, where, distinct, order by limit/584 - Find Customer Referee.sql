-- Link -- https://leetcode.com/problems/find-customer-referee/description/
-- Question: 
-- Find the names of the customer that are either:
-- referred by any customer with id != 2.
-- not referred by any customer.
-- Return the result table in any order.

select name from Customer
where referee_id != 2 and referee_id is null;