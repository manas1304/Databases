-- Link -- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/
-- Question:
-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.

select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id;