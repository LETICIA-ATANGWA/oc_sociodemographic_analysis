select
    USER_ID as user_id,
    PATH_CATEGORY_NAME as path_category_name,
    AGE_GROUP as age_group,
    coalesce(GENDER, 'Unknown') as gender,
    REGION as region,
    YEAR_PATH_STARTED as year_path_started
from {{ source('raw', 'students_raw') }}