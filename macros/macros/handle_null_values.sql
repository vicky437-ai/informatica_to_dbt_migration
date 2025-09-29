-- Macro to handle null values with default substitution
{% macro handle_null_values(column_name, default_value='') %}
    coalesce({{ column_name }}, '{{ default_value }}')
{% endmacro %}