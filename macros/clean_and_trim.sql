-- Macro for cleaning and trimming string fields
-- Replicates LTRIM(RTRIM()) functionality from Informatica

{% macro clean_and_trim(column_name) %}
    trim({{ column_name }})
{% endmacro %}