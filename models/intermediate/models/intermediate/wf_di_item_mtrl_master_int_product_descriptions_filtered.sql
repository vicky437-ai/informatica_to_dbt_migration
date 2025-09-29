-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model for filtered product descriptions
-- Implements the filter transformation for English language only

select
    product0,
    language,
    product_description
from {{ ref('models/staging/wf_di_item_mtrl_master_stg_product_description_data') }}
where language = 'EN'