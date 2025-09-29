-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model preparing data for routing based on GLPOST
-- Replicates rtr_GLPOST_NR router logic

select
    *,
    case 
        when out_glpost = 'P' then 'Flat_File'
        when out_glpost != 'P' then 'STG_Table'
        else 'DEFAULT'
    end as routing_group
from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_filtered') }}