-- Macro to replace null values with empty strings for journal fields
-- Replicates the exp_replace transformation logic

{% macro replace_null_values(column_name) %}
    coalesce(trim({{ column_name }}), '')
{% endmacro %}