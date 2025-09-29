{% macro replace_null_with_space(field_name) %}
    coalesce({{ field_name }}, ' ')
{% endmacro %}