{% macro default__hash_alg_md5() -%}

    {% do return(automate_dv.cast_binary("HASHBYTES('MD5', [HASH_STRING_PLACEHOLDER])", quote=false)) %}

{% endmacro %}