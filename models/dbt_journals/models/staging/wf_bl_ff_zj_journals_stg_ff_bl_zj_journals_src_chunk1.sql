-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Staging: FF_BL_ZJ_JOURNALS_SRC
-- Source: Blackline journal entries flat file
-- Raw data from flat file source system with basic transformations

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
    gl_posted_code,
    reverse_void,
    reconciled_code,
    purchase_order,
    asset_number,
    gluser_user_id,
    date_updated,
    time_last_updated,
    email,
    filename,
    
    -- Convert Julian dates to standard dates
    {{ convert_julian_date('gl_date') }} as gl_date_converted,
    {{ convert_julian_date('batch_date') }} as batch_date_converted,
    {{ convert_julian_date('date_updated') }} as date_updated_converted,
    
    -- Add audit fields
    current_timestamp() as loaded_at
    
from {{ source('blackline_files', 'ff_bl_zj_journals_src') }}