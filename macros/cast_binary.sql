{%- macro cast_binary(column_str, alias=none, quote=true) -%}
    {{ return(adapter.dispatch('cast_binary', 'automate_dv')(column_str=column_str, alias=alias, quote=quote)) }}
{%- endmacro -%}

{%- macro default__cast_binary(column_str, alias=none, quote=true) -%}

    {%- if quote -%}
        CONVERT({{ automate_dv.type_binary() }}, '{{ column_str }}', 2)
    {%- else -%}
        CONVERT({{ automate_dv.type_binary() }}, {{ column_str }}, 2)
    {%- endif -%}

    {% if alias %} AS {{ alias }} {%- endif %}

{%- endmacro -%}