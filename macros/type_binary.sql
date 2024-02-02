{%- macro type_binary() -%}
  {{- return(adapter.dispatch('type_binary', 'automate_dv')()) -}}
{%- endmacro -%}

{%- macro default__type_binary() -%}
    {%- if var('hash', 'MD5') | lower == 'md5' -%}
        BINARY(16)
    {%- elif var('hash', 'MD5') | lower == 'sha' -%}
        BINARY(32)
    {%- else -%}
        BINARY(16)
    {%- endif -%}
{%- endmacro -%}