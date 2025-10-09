-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Staging: FF_BL_ZJ_JOURNALS_SRC
-- Source: Flat file for BL ZJ Journals
-- Same flat file used to append timestamp in the file name

{{ config(
    materialized='view',
    tags=['staging', 'file']
) }}

select
    batch_number,
    batch_type,
    document_type,
    document_number,
    document_company,
    gl_date,
    currency,
    foreign_domestic,
    batch_date,
    amount_entered,
    batch_status,
    gltorg_user_id,
    explanation_alpha,
    ledger_type,
    journal_entry_line_number,
    line_extension_code,
    account_number,
    account_description,
    company,
    amount,
    explanation_remark,
    subledger_type,
    subledger,
    g_l_posted_code,
    reverse_void,
    reconciled_code,
    purchase_order,
    asset_number,
    gluser_user_id,
    date_updated,
    time_last_updated,
    email,
    filename

from {{ source('file_system', 'ff_bl_zj_journals_src') }}