{%- set yaml_metadata -%}
source_model: "raw_payments"
derived_columns:
  RECORD_SOURCE: "ECOM_SYSTEM"
hashed_columns:
  PAYMENT_HK: 
    - "PAYMENT_ID"
  PAYMENT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "PAYMENT_METHOD"
      - "AMOUNT"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}


WITH staging AS (
{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *, 
       ('{{ var('load_date') }}')::DATE AS LOAD_DATE
FROM staging