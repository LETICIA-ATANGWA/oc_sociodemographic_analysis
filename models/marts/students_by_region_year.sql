{{ config(materialized='table') }}

select
    region,
    year_path_started,
    gender,
    count(*) as total_students
from {{ ref('stg_students') }}
group by 1,2,3