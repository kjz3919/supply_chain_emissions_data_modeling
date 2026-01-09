WITH base AS (
    SELECT * FROM {{ ref('raw_emissions') }}
),
aggregated AS (
    SELECT
        naics_code,
        naics_title,
        GHG,
        unit,
        ref_useeio_code,
        AVG(sc_emission_factors_without_margins) AS avg_factor_no_margin,
        AVG(sc_emission_factors_with_margins) AS avg_factor_with_margin,
        AVG(margins_sc_emission_factors) AS avg_margin,
        SUM(sc_emission_factors_without_margins) AS total_factor_no_margin,
        SUM(sc_emission_factors_with_margins) AS total_factor_with_margin
    FROM base
    GROUP BY
        naics_code,
        naics_title,
        GHG,
        unit,
        ref_useeio_code
)

SELECT * FROM aggregated