-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for material characteristics lookup
-- Source: Material characteristics lookup table

select
    key_of_obj,
    char_value,
    characteristic_name,
    current_timestamp as etl_load_dt

from {{ source('lookup_system', 'material_characteristics_lookup') }}