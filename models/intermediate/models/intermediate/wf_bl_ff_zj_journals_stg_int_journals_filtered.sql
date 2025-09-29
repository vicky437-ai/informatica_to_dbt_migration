-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model applying foreign currency filter
-- Replicates flt_condition_Foreign_currency_R and flt_condition_Foreign_currency_NR

select *
from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_with_user_lookup') }}
where out_flag = 'Y'  -- Filter condition: out_Flag='Y'