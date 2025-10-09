-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Lookup: F01151
-- Lookup on F01151 table to get EAETP and EAEMAL column based on EAAN8

{{ config(
    materialized='view',
    tags=['intermediate', 'lookup']
) }}

select
    base.*,
    lkp.eaetp as f01151_eaetp,
    lkp.eaemal as f01151_eaemal
    
from {{ ref('wf_bl_ff_zj_journals_int_lkp_f0092') }} base
left join {{ source('lookup_system', 'f01151') }} lkp
    on lkp.eaan8 = base.ulan8