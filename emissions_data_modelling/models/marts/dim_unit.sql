WITH source AS (
    SELECT DISTINCT
        MD5(unit) AS unit_key,
        unit
    FROM {{ ref('raw_emissions') }}
)

SELECT * FROM source