-- Model: wf_bl_ff_zj_journals_stg_s_zj_journals
-- Merged from 2 chunks

select
    company,
    object_account,
    subsidiary,
    document_type,
    document_number,
    journal_line_number,
    amount,
    currency_code,
    gl_date,
    journal_date,
    origin,
    user_id,
    program_id,
    updated_date,
    updated_time
from {{ source('staging_system', 's_zj_journals') }}