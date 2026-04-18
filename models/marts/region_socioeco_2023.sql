with population as (

    -- Sélection des données nettoyées de population
    select *
    from {{ ref('stg_population_2023') }}

),

revenue as (

    -- Sélection des données nettoyées de revenu
    select *
    from {{ ref('stg_revenue_2023') }}

)

select
    p.code_region,
    p.region,
    p.population,
    r.revenu_disponible_brut,

    -- Calcul d’un indicateur : revenu moyen par habitant
    r.revenu_disponible_brut as revenu_par_habitant,

    p.annee

from population p
left join revenue r
    on p.code_region = r.code_region
    and p.annee = r.annee