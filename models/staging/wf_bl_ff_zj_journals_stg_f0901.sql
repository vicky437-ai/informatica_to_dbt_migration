-- Model: wf_bl_ff_zj_journals_stg_f0901
-- Merged from 2 chunks

select
    gmco as company,
    gmobj as object_account,
    gmsub as subsidiary,
    gmlt as ledger_type,
    gmdl01 as description_line_1,
    gmdl02 as description_line_2,
    gmstyl as posting_edit,
    gmr001 as reserved_field_001
from {{ source('jde_system', 'f0901') }}