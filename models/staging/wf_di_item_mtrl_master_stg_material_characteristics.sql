-- Model: wf_di_item_mtrl_master_stg_material_characteristics
-- Merged from 2 chunks

select
    key_of_obj,
    char_value,
    characteristic_name,
    upper(trim(characteristic_name)) as characteristic_name_clean

from {{ source('lookup_tables', 'material_characteristics') }}