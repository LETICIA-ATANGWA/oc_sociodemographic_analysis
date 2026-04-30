select
    CODE_INSEE,
    REGION,
    REVENUe_BRUT_DISPO,
    ANNEE
from {{ source('raw', 'revenue_raw') }}
where ANNEE = 2023
and REGION IS NOT NULL  
