with students as (
    select * from {{ ref('stg_students') }}
),

final as (
    select
        PATH_CATEGORY_NAME,
        REGION,
        GENDER,
        AGE_GROUP,
        YEAR,
        COUNT(DISTINCT USER_ID) as NB_STUDENTS
    from students
    group by
        PATH_CATEGORY_NAME,
        REGION,
        GENDER,
        AGE_GROUP,
        YEAR
)

select * from final
