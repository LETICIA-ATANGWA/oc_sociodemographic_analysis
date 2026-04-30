select
    CODE_INSEE,
    REGION,
    to_number(replace(POPULATION, ' ', '')) as POPULATION,
    ANNEE
from {{ source('raw', 'population_raw') }}
where ANNEE = 2023
and REGION IS NOT NULL  
