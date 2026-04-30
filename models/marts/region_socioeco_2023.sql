-- models/region_socioeco_2023.sql
SELECT 
    s.REGION,
    s.YEAR AS ANNEE,
    SUM(s.TOTAL_STUDENTS) AS TOTAL_STUDENTS,
    MAX(p.POPULATION) AS POPULATION,
    MAX(r.REVENU_DISPONIBLE_BRUT) AS REVENUE_BRUT_DISPO
FROM {{ ref('students_by_region_year') }} s
LEFT JOIN {{ ref('population_region_2023') }} p 
    ON UPPER(TRIM(s.REGION)) = UPPER(TRIM(p.REGION))
LEFT JOIN {{ ref('revenu_region_2023') }} r 
    ON UPPER(TRIM(s.REGION)) = UPPER(TRIM(r.REGION))
GROUP BY s.REGION, s.YEAR
ORDER BY s.REGION, s.YEAR
