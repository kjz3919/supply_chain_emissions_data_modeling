WITH source AS (
    SELECT DISTINCT 
           MD5(GHG) AS ghg_key,
           GHG
    FROM {{ ref('raw_emissions') }}
)

SELECT * FROM source
