-- Model: material_attribute_lookup
-- Merged from 2 chunks

select char_value
        from {{ ref('wf_di_item_mtrl_master_stg_material_attributes_lookup') }}
        where key_of_obj = {{ item_column }}
        and attribute_type = '{{ attribute_type }}'
        limit 1
    )
{% endmacro %}