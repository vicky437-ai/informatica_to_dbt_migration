-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for material descriptions
select
    product0 as product,
    language,
    product_description,
    current_timestamp as loaded_at

from {{ source('xml_file', 'xml_md_material_attr_txt') }}
where language is not null
  and product_description is not null