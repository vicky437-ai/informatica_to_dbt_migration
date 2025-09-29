-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model for filtered material data
-- Applies language key filter and basic transformations

select
    material_id,
    language_key,
    material_desc,
    attr_value,
    created_date,
    updated_date,
    loaded_at
from {{ ref('wf_di_item_mtrl_master_stg_xml_material_attr_txt') }}
where language_key is not null
  and language_key != ''