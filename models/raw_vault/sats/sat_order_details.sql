{%- set source_model = "v_stg_orders" -%}
{%- set src_pk = ["ORDER_HK", "LOAD_DATETIME"] -%}
{%- set src_hashdiff = "ORDER_HASHDIFF" -%}
{%- set src_payload = ["order_date", "status"] -%}
{%- set src_eff = "LOAD_DATETIME" -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
