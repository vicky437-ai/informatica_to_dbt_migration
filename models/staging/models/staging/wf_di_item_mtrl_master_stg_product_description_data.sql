-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for product description data
-- Source: SAP product description master data

select
    product0,
    language,
    product_description
from {{ source('sap_source', 'product_description_data') }}