-- Link -- https://leetcode.com/problems/daily-leads-and-partners/description/
-- Question:
-- For each date_id and make_name, find the number of distinct lead_id's and distinct partner_id's.
-- Return the result table in any order.

select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name;