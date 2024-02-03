{%- set source_model = "v_stg_payments" -%}
{%- set src_pk = ["PAYMENT_HK", "LOAD_DATETIME"] -%}
{%- set src_hashdiff = "PAYMENT_HASHDIFF" -%}
{%- set src_payload = ["payment_method", "amount"] -%}
{%- set src_eff = "LOAD_DATETIME" -%}
{%- set src_ldts = "LOAD_DATETIME" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}
