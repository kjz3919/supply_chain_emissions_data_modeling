WITH source AS (
    SELECT * FROM {{ ref('raw_emissions') }}
)

SELECT DISTINCT
    ROW_NUMBER() OVER () AS emission_key,
    n.naics_key,
    g.ghg_key,
    u.unit_key,
    us.useeio_key,
    s.sc_emission_factors_without_margins,
    s.margins_sc_emission_factors,
    s.sc_emission_factors_with_margins
FROM source s
JOIN {{ ref('dim_naics') }} n ON s.naics_code = n.naics_code
JOIN {{ ref('dim_ghg' )}} g ON s.GHG = g.GHG
JOIN {{ ref('dim_unit') }} u ON s.unit = u.unit
JOIN {{ ref('dim_useeio') }} us ON s.ref_useeio_code = us.ref_useeio_code