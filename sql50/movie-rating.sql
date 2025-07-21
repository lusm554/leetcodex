-- Write your PostgreSQL query statement below
(
    select u.name as results
    from movierating mr
        join users u using(user_id)
    group by 1
    order by count(mr.movie_id) desc, u.name
    limit 1
)
union all
(
    select m.title as results
    from movierating mr
        join movies m using(movie_id)
    where to_char(created_at, 'YYYY-MM') = '2020-02'
    group by 1
    order by avg(mr.rating) desc, m.title
    limit 1
)
;
