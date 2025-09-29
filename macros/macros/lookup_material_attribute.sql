-- Reusable macro for material attribute lookups with SQL override support
{% macro lookup_material_attribute(attribute_name, item_nbr_column, override_param=none) %}
    (
        {% if override_param %}
            -- Use SQL override if provided
            {{ var(override_param, 'select null as char_value where 1=0') }}
        {% else %}
            -- Standard lookup query
            select char_value
            from {{ source('lookup_system', 'material_attributes_lookup') }}
            where key_of_obj = {{ item_nbr_column }}
            and attribute_type = '{{ attribute_name }}'
            limit 1
        {% endif %}
    )
{% endmacro %}