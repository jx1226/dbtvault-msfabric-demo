{%- macro default__null_column_sql(col_name, default_value) -%}

    {{ col_name }} AS {{ col_name ~ "_ORIGINAL" }},
    ISNULL({{ col_name }}, '{{ default_value }}') AS {{ col_name }}

{%- endmacro -%}