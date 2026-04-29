{{ config(materialized='table') }}

select
    region,
    year_path_started as year,
    gender,
    count(distinct user_id) as total_students
from {{ ref('stg_students') }}
group by region, year_path_started, gender