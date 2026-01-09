WITH source AS (
    SELECT * FROM {{ source('raw_emissions', 'raw_emissions_data') }}
)

SELECT * FROM source