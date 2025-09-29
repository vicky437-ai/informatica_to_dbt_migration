-- Model: wf_bl_ff_zj_journals_stg_f0911
-- Merged from 2 chunks

select
    glaid as ledger_id,
    glco as company,
    globj as object_account,
    glsub as subsidiary,
    gldct as document_type,
    gldoc as document_number,
    glkco as document_company,
    gljeln as journal_line_number,
    glpost as post_edit_code,
    glaa as amount,
    glicu as currency_code,
    gldgj as gl_date,
    gldsj as journal_date,
    gltorg as origin,
    gluser as user_id,
    glpid as program_id,
    glupmj as updated_date,
    glupmt as updated_time
from {{ source('jde_system', 'f0911') }}