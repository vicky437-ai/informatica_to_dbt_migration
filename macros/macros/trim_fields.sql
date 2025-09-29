{% macro trim_fields(field_name) %}
    trim({{ field_name }})
{% endmacro %}