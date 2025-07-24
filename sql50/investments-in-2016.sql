-- Write your PostgreSQL query statement below
select
    round(cast(sum(tiv_2016) as numeric), 2) tiv_2016
from Insurance
where 1=1
    and tiv_2015 in (select tiv_2015 from insurance group by 1 having count(*) > 1)
    and (lat, lon) in (select lat, lon from insurance group by 1,2 having count(*) = 1)
;
