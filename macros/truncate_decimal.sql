-- Macro to truncate decimal fields to specified precision
-- Replicates trunc(field, precision) from Informatica

{% macro truncate_decimal(field_name, precision=3) %}
    case 
        when {{ field_name }} is not null 
        then trunc({{ field_name }}, {{ precision }})
        else null 
    end
{% endmacro %}