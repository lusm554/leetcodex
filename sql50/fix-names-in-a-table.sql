-- Write your PostgreSQL query statement below
select user_id, upper(substring(name, 1, 1))||lower(substring(name, 2, length(name))) name
from users
order by 1
;
