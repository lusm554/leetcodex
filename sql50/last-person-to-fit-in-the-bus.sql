-- Write your PostgreSQL query statement below
with markup as (
    select person_name, turn, sum (weight) over (order by turn) as wsum
    from queue
),
last_person as (
    select max(turn) turn from markup where wsum <= 1000
)
select person_name
from markup
    join last_person using (turn)
;
