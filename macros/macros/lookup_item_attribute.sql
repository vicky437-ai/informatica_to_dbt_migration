{% macro lookup_item_attribute(item_column, attribute_name, default_value='NULL') %}
    -- Reusable macro for item attribute lookups
    -- This replaces the multiple similar lookup transformations
    COALESCE(
        (SELECT char_value 
         FROM {{ ref('models/staging/wf_di_item_mtrl_master_stg_item_attributes') }} 
         WHERE key_of_obj = {{ item_column }} 
         AND attribute_name = '{{ attribute_name }}'
         LIMIT 1),
        {{ default_value }}
    )
{% endmacro %}