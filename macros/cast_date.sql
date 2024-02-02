{%- macro default__cast_date(column_str, as_string=false, datetime=false, alias=none, date_type=none) -%}
    {%- if datetime -%}
        {{- automate_dv.cast_datetime(column_str=column_str, as_string=as_string, alias=alias, date_type=date_type) -}}
    {%- else -%}
        {{ return(adapter.dispatch('cast_date', 'automate_dv')(column_str=column_str, as_string=as_string, alias=alias)) }}
    {%- endif -%}
{%- endmacro -%}