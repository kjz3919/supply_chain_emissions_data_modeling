WITH source AS (
    SELECT DISTINCT
        MD5(unit) AS unit_key,
        SUBSTRING(unit, 1, position(unit, '/') - 1) AS emission_unit,
        SUBSTRING(unit, position(unit, ' ') + 1, 3) AS currency,
        SUBSTRING(unit, position(unit, '/') + 1, 4) AS currency_year,
        CASE
            WHEN unit ILIKE '%purchaser price%' THEN 'purchaser'
            WHEN unit ILIKE '%producer price%' THEN 'producer'
            WHEN unit ILIKE '%basic price%' THEN 'basic'
        END AS price_type
    FROM {{ ref('raw_emissions') }}
)

SELECT * FROM source