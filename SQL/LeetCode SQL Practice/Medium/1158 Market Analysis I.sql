-- Link -- https://leetcode.com/problems/market-analysis-i/description/
-- Question:
-- Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.
-- Return the result table in any order.

select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019
from Users u
left join Orders o 
on u.user_id = o.buyer_id
and o.order_date >= '2019-01-01'
and o.order_date < '2019-12-31'
group by u.user_id, u.join_date;

