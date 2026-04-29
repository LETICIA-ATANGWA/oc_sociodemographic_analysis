with students as (

    select
        region,
        year_path_started as annee,
        count(distinct user_id) as nb_students
    from {{ ref('stg_students') }}
    group by region, year_path_started

),

population_data as (

    select
        region,
        annee,
        population
    from {{ ref('stg_population_2023') }}

),

revenue_data as (

    select
        region,
        annee,
        REVENUE_BRUT_DISPO
    from {{ ref('stg_revenue_2023') }}

)

select
    s.region,
    s.annee,
    s.nb_students,
    p.population,
    r.REVENUE_BRUT_DISPO,

    case
        when p.population is not null
        then (s.nb_students / p.population) * 100000
        else null
    end as students_per_100k

from students s
left join population_data p
    on s.region = p.region
    and s.annee = p.annee
left join revenue_data r
    on s.region = r.region
    and s.annee = r.annee