-- Link -- https://leetcode.com/problems/recyclable-and-low-fat-products/
-- Question -- Write a solution to find the ids of products that are both low fat and recyclable.

select product_id 
from Products 
where low_fats = 'Y' and recyclable = 'Y';