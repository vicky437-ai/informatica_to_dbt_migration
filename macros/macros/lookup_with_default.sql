-- Macro for performing lookups with default values
{% macro lookup_with_default(lookup_table, lookup_key, lookup_value, source_key, default_value='NULL') %}
    coalesce(
        (select {{ lookup_value }}
         from {{ lookup_table }}
         where {{ lookup_key }} = {{ source_key }}
         limit 1),
        {{ default_value }}
    )
{% endmacro %}