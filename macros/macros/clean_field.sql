-- Macro to clean fields by removing double quotes and handling nulls
{% macro clean_field(field_name) %}
    case 
        when {{ field_name }} is null then ''
        else replace({{ field_name }}, '"', '')
    end
{% endmacro %}