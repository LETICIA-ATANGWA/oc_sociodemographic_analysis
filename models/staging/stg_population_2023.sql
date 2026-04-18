select
    -- Conversion du code INSEE en entier pour permettre les jointures
    cast(code_insee as int) as code_region,

    -- Nom de la région (inchangé)
    region,

    -- Conversion de la population en nombre décimal pour calculs futurs
    cast(population as float) as population,

    -- Conversion de l'année en entier
    cast(annee as int) as annee

-- Référence au seed importé via dbt
from {{ ref('population_region_2023') }}