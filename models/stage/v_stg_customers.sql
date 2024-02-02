{%- set yaml_metadata -%}
source_model: "raw_customers"
hashed_columns:
  CUSTOMER_HK: "customer_id"
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "first_name"
      - "last_name"
derived_columns:
  RECORD_SOURCE: "!ECOM_SYSTEM"
  LOAD_DATETIME: CONVERT(DATETIME2, '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}')
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}


{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  hashed_columns=hashed_columns,
                  derived_columns=derived_columns,
                  ranked_columns=none) }}