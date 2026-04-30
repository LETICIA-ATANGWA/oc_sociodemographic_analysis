with source as (
    select * from {{ source('raw', 'students_raw') }}
),

cleaned as (
    select
        USER_ID,
        PATH_CATEGORY_NAME,
        AGE_GROUP,
        GENDER,
        REGION,
        YEAR_PATH_STARTED as YEAR

    from source
    where
        USER_ID is not null
        and REGION is not null
        and YEAR_PATH_STARTED is not null
)

select * from cleaned
