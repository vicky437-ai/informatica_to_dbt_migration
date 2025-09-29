-- Macro for safe decimal casting with null handling

{% macro safe_cast_decimal(column_name, precision=13, scale=3) %}
    case 
        when {{ column_name }} is null then null
        when trim({{ column_name }}) = '' then null
        else cast({{ column_name }} as decimal({{ precision }}, {{ scale }}))
    end
{% endmacro %}