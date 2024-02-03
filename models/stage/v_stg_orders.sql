{%- set yaml_metadata -%}
source_model: "raw_orders"
derived_columns:
  RECORD_SOURCE: "!ECOM_SYSTEM"
  LOAD_DATETIME: CONVERT(DATETIME2, '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}')
hashed_columns:
  ORDER_HK: "order_id"
  CUSTOMER_HK: "customer_id"
  LINK_CUSTOMER_ORDER_HK:
    - 'order_id'
    - 'customer_id'
  ORDER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "order_date"
      - "status"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ automate_dv.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}