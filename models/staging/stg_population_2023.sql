select
    CODE_INSEE,
    REGION,
    POPULATION,
    ANNEE
from {{ source('raw', 'population_raw') }}
where ANNEE = 2023