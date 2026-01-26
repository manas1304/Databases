-- Link -- https://leetcode.com/problems/average-selling-price/description/
-- Question:
-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. 
-- If a product does not have any sold units, its average selling price is assumed to be 0.
-- Return the result table in any order.

select p.product_id,
coalesce(round(sum(p.price*u.units) *1.0/sum(u.units), 2), 0) as average_price
from Prices p
left join UnitsSold u on p.product_id = u.product_id
and u.purchase_date between p.start_date and p.end_date
group by p.product_id;