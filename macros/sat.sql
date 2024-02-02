{%- macro default__sat(src_pk, src_hashdiff, src_payload, src_extra_columns, src_eff, src_ldts, src_source, source_model) -%}

{{- automate_dv.postgres__sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                             src_payload=src_payload, src_extra_columns=src_extra_columns,
                             src_eff=src_eff, src_ldts=src_ldts,
                             src_source=src_source, source_model=source_model) -}}

{%- endmacro -%}
