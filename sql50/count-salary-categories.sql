-- Write your PostgreSQL query statement below
with markup as (
    select
        account_id,
        case
            when income < 20000 then 'Low Salary'
            when income >= 20000 and income <= 50000 then 'Average Salary'
            when income > 50000 then 'High Salary'
        end category
    from accounts
), categories as (
    select 'Low Salary' category
    union all
    select 'Average Salary'
    union all
    select 'High Salary'
)
select
    categories.category,
    count(markup.account_id) accounts_count
from categories
    left join markup using(category)
group by 1
;
