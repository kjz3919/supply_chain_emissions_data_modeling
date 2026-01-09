WITH source AS (
    SELECT DISTINCT
        MD5(naics_code) AS naics_key,
        naics_code,
        naics_title
    FROM {{ ref('raw_emissions') }}
)

SELECT * FROM source

