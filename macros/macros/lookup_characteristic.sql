-- Macro for characteristic lookups
-- Reusable pattern for all characteristic value lookups

{% macro lookup_characteristic(lookup_table, item_field, default_value='NULL') %}
    coalesce(
        (select char_value 
         from {{ ref(lookup_table) }} 
         where key_of_obj = {{ item_field }}
         limit 1),
        {{ default_value }}
    )
{% endmacro %}