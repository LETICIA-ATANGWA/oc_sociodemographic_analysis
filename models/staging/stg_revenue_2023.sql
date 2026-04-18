select
    -- Conversion du code INSEE en entier pour assurer la cohérence des jointures
    cast(code_insee as int) as code_region,

    -- Nom de la région
    region,

    -- Conversion du revenu en float pour analyses statistiques
    cast(revenu_disponible_brut as float) as revenu_disponible_brut,

    -- Année en entier
    cast(annee as int) as annee

-- Référence au seed revenu
from {{ ref('revenu_region_2023') }}