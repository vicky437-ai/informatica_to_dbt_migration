-- Model: wf_di_item_mtrl_master_stg_material_attr_txt
-- Merged from 2 chunks

{{ config(materialized='view') }}

select
    product0 as product,
    language,
    product_description
from {{ source('sap_material', 'material_attr_txt') }}
where language = 'EN'  -- Filter for English language as per flt_LANG_KEY