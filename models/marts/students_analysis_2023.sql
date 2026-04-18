with students as (

    -- Comptage des étudiants par région et année
    select
        region,
        year_path_started as annee,
        count(distinct user_id) as nb_students
    from {{ ref('stg_students') }}
    group by region, year_path_started

),

region_data as (

    -- Données socio-économiques (uniquement 2023)
    select *
    from {{ ref('region_socioeco_2023') }}

)

select
    s.region,
    s.annee,
    s.nb_students,

    r.population,
    r.revenu_par_habitant,

    case
        when r.population is not null
        then (s.nb_students / r.population) * 100000
        else null
    end as students_per_100k

from students s
left join region_data r
    on lower(trim(s.region)) = lower(trim(r.region))
    and s.annee = r.annee
