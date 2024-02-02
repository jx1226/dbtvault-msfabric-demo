{%- set yaml_metadata -%}
source_model: "raw_payments"
derived_columns:
  RECORD_SOURCE: "!ECOM_SYSTEM"
  LOAD_DATETIME: CONVERT(DATETIME2, '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S.%f") }}')
hashed_columns:
  PAYMENT_HK: "payment_id"
  LINK_PAYMENT_ORDER_HK:
    - 'payment_id'
    - 'order_id'
  PAYMENT_HASHDIFF:
    is_hashdiff: true
    columns:
      - "payment_method"
      - "amount"
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