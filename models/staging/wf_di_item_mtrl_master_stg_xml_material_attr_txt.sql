-- Model: wf_di_item_mtrl_master_stg_xml_material_attr_txt
-- Merged from 3 chunks

{{ config(materialized='view') }}

select
    material_id,
    language_key,
    material_desc,
    attr_value,
    created_date,
    updated_date,
    current_timestamp as loaded_at
from {{ source('material_system', 'xml_md_material_attr_txt') }}