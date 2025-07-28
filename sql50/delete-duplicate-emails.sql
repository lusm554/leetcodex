-- Write your PostgreSQL query statement below
delete from person
where id in (
    select id
    from (
        select
            id,
            row_number() over (partition by email order by id asc) rn
        from person
    )
    where rn > 1
)
;
