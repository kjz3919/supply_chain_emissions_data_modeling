WITH source AS (
    SELECT DISTINCT
        MD5(ref_useeio_code) AS useeio_key,
        ref_useeio_code
    FROM {{ ref('raw_emissions') }}
)

SELECT * FROM source