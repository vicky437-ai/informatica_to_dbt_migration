-- Model: wf_bl_ff_zj_journals_stg_stg_f01151
-- Merged from 4 chunks

{{ config(materialized='view') }}

select
    mcmcu as business_unit,
    trim(mcdl01) as description,
    mcstyl as category_code,
    current_timestamp as load_timestamp
from {{ source('lookup_system', 'f01151') }}