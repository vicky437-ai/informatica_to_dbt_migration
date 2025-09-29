-- Model: wf_bl_ff_zj_journals_stg_stg_f0911_nr
-- Merged from 2 chunks

select
    glaid as accounting_id,
    glkco as company,
    gldgj as gl_date,
    gldoc as document_number,
    gldct as document_type,
    gllt as ledger_type,
    globj as object_account,
    glsub as subsidiary,
    glpost as posted_code,
    glaa as amount,
    glcrcd as currency_code,
    glexr1 as exchange_rate,
    current_timestamp as load_timestamp
from {{ source('zj_system', 'f0911') }}