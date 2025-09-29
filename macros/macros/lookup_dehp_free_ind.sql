-- Macro for DEHP Free Indicator lookup
-- Reusable lookup pattern for material characteristics

{% macro lookup_dehp_free_ind(material_column) %}
    (
        select char_value
        from {{ ref('wf_di_item_mtrl_master_stg_material_characteristics') }}
        where key_of_obj = {{ material_column }}
        and characteristic_name_clean = 'DEHP_FREE'
        limit 1
    )
{% endmacro %}