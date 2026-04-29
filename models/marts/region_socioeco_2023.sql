select
    s.region,
    s.year_path_started as annee,
    count(distinct s.user_id) as total_students,
    p.population,
    r.REVENUE_BRUT_DISPO
from {{ ref('stg_students') }} s
left join {{ ref('stg_population_2023') }} p
    on s.region = p.region
    and s.year_path_started = p.annee
left join {{ ref('stg_revenue_2023') }} r
    on s.region = r.region
    and s.year_path_started = r.annee
group by
    s.region,
    s.year_path_started,
    p.population,
    r.REVENUE_BRUT_DISPO