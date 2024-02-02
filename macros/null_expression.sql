{%- macro default__null_expression(standardise, column_str, null_placeholder_string) -%}

    {%- set column_expression -%}
        ISNULL({{ standardise | replace('[EXPRESSION]', column_str) }}, '{{ null_placeholder_string }}')
    {%- endset -%}

    {% do return(column_expression) %}

{%- endmacro -%}