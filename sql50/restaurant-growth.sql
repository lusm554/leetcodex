with daily_amount as (
  select visited_on, sum(amount) as amount
  from customer
  group by visited_on
),
week_window as (
    select distinct
        c1.visited_on report_dt,
        c2.visited_on window_dates,
        c2.amount
    from daily_amount c1
        join daily_amount c2
        on c2.visited_on between c1.visited_on - interval '6 days' and c1.visited_on
)
select
    report_dt visited_on,
    sum(amount) amount,
    round(sum(amount)*1.0/7, 2) average_amount
from week_window
    where report_dt in (select report_dt from week_window group by 1 having count(distinct window_dates) = 7)
group by 1
order by 1
;
