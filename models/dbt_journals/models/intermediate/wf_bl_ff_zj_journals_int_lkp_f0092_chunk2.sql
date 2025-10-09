-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Lookup: F0092
-- Lookup on F0092 table to get ULAN8 column based on ULUSER

{{ config(
    materialized='view',
    tags=['intermediate', 'lookup']
) }}

select
    base.*,
    lkp.ulan8
    
from {{ ref('wf_bl_ff_zj_journals_stg_f0011_f0911_f0901') }} base
left join {{ source('lookup_system', 'f0092') }} lkp
    on lkp.uluser = base.gltorg