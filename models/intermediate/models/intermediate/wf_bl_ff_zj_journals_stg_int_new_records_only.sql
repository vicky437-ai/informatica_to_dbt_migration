-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Filter for new records only (not in staging)
select *
from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_f0911_with_staging_check') }}
where out_flag = 'Y'