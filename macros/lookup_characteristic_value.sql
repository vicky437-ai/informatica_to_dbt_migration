-- Model: lookup_characteristic_value
-- Merged from 2 chunks

select char_value
        from {{ ref('models/staging/wf_di_item_mtrl_master_stg_material_characteristics_lookup') }}
        where key_of_obj = {{ item_column }}
        and characteristic_name = '{{ characteristic_name }}'
        limit 1
    )
{% endmacro %}