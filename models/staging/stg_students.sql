{{ config(materialized='view') }}

select
    user_id,
    path_category_name,
    age_group,
    coalesce(gender, 'Unknown') as gender,
    region,
    year_path_started
from {{ source('raw', 'students_raw') }}


   
   