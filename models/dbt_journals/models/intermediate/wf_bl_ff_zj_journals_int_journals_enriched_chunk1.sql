-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Intermediate: Journals Enriched
-- Applies business logic transformations and creates composite keys
-- Note: This model will be enhanced when transformation logic from chunks 2-3 is available

select
    -- Create composite key for journal entry
    concat(
        coalesce(cast(batch_number as string), ''),
        '-',
        coalesce(cast(document_number as string), ''),
        '-',
        coalesce(document_company, ''),
        '-',
        coalesce(cast(journal_entry_line_number as string), '')
    ) as journal_key,
    
    -- Batch information
    batch_number,
    batch_type,
    batch_status,
    batch_date_converted as batch_date,
    
    -- Document information
    document_type,
    document_number,
    document_company,
    
    -- GL information
    gl_date_converted as gl_date,
    ledger_type,
    journal_entry_line_number,
    line_extension_code,
    
    -- Account information
    account_number,
    account_description,
    company,
    
    -- Amount information
    amount_entered,
    amount,
    currency,
    foreign_domestic,
    
    -- Explanations and remarks
    explanation_alpha,
    explanation_remark,
    
    -- Subledger information
    subledger_type,
    subledger,
    
    -- Status codes
    gl_posted_code,
    reverse_void,
    reconciled_code,
    
    -- Reference information
    purchase_order,
    asset_number,
    
    -- User information
    gltorg_user_id,
    gluser_user_id,
    email,
    
    -- Audit information
    date_updated_converted as date_updated,
    time_last_updated,
    filename,
    loaded_at
    
from {{ ref('wf_bl_ff_zj_journals_stg_ff_bl_zj_journals_src') }}