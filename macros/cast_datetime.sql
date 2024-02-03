{%- macro cast_datetime(column_str, as_string=false, alias=none, date_type=none) -%}

    {%- if as_string -%}
        {%- set column_str -%} '{{ column_str }}' {%- endset -%}
    {%- endif -%}

    {%- set date_type = date_type | lower -%}

    {{ return(adapter.dispatch('cast_datetime', 'automate_dv')(column_str=column_str, as_string=as_string, alias=alias, date_type=date_type)) }}
{%- endmacro -%}


{%- macro default__cast_datetime(column_str, as_string=false, alias=none, date_type=none) -%}

    CONVERT(DATETIME2, {{ column_str }})

    {%- if alias %} AS {{ alias }} {%- endif %}

{%- endmacro -%}