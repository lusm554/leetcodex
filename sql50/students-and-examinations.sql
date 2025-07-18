-- Write your PostgreSQL query statement below
select
    st.student_id,
    st.student_name,
    sub.subject_name,
    count(e.student_id) attended_exams
from Students st
    cross join Subjects sub
    left join Examinations e
    on st.student_id = e.student_id and sub.subject_name = e.subject_name
group by 1,2,3
order by st.student_id, sub.subject_name
;
