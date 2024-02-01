{%- set source_model = "v_stg_customers" -%}
/* src_pk = hashed key */
{%- set src_pk = "CUSTOMER_HK" -%}
/* src_nk = natural key / business key */
{%- set src_nk = "CUSTOMER_ID" -%}
/* src_ldts = LOAD_DATE */
{%- set src_ldts = "LOAD_DATE" -%}
/* src_source = RECORD_SOURCE */
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}