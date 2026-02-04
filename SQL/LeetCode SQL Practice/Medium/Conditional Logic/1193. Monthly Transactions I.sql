-- Link -- https://leetcode.com/problems/monthly-transactions-i/description/
-- Question:
-- Write an SQL query to find for each month and country, the number of transactions and their total amount, 
-- the number of approved transactions and their total amount.
-- Return the result table in any order.

select
to_char(trans_date, 'YYYY-MM') as month, country,
count(id) as trans_count,
count(
    case 
        when state = 'approved' then 1
    end
) as approved_count,
sum(
    amount
) as trans_total_amount,
sum(
    case 
        when state = 'approved' then amount
        else 0
    end
) as approved_total_amount
from Transactions
group by to_char(trans_date, 'YYYY-MM'), country;