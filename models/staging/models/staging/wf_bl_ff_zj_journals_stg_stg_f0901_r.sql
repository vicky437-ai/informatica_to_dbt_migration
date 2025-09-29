-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging for F0901 Account Master (R pipeline)
select
    gmaid as accounting_id,
    gmkco as company,
    gmobj as object_account,
    gmsub as subsidiary,
    gmlt as ledger_type,
    trim(gmdl01) as description_line_1,
    trim(gmdl02) as description_line_2,
    current_timestamp as load_timestamp
from {{ source('zj_system', 'f0901') }}