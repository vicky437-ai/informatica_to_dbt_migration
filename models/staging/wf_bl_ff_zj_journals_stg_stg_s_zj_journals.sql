-- Model: wf_bl_ff_zj_journals_stg_stg_s_zj_journals
-- Merged from 5 chunks

select
    journal_id,
    company,
    gl_date,
    document_number,
    document_type,
    ledger_type,
    object_account,
    subsidiary,
    amount,
    currency_code,
    exchange_rate,
    posted_flag,
    current_timestamp as load_timestamp
from {{ source('staging_system', 's_zj_journals') }}