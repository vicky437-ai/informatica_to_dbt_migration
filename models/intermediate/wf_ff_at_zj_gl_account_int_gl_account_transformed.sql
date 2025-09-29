-- Source: wf_FF_AT_ZJ_GL_ACCOUNT.XML
-- Intermediate model applying expression transformations
-- Replicates EXPTRANS transformation logic from Informatica

select
    -- Control fields
    ohrequid,
    datapakid,
    record,
    
    -- Pass-through fields
    gl_account_number,
    cost_center,
    journal_id,
    document_type,
    journal_line_id,
    vendor_id,
    vendor_name,
    account_description,
    base_currency_code,
    from_currency_code,
    subledger_gl,
    purchase_order,
    supplier_invoice,
    fiscal_year_period,
    source_erp,
    
    -- Transformed fields using macros
    {{ clean_text_field('journal_line_description_raw') }} as journal_line_description,
    {{ clean_text_field('remark_explanation_raw', 30) }} as remark_explanation,
    {{ format_sap_date('posting_date_raw') }} as posting_date,
    {{ truncate_decimal('amount_raw', 3) }} as amount,
    {{ truncate_decimal('local_amount_raw', 3) }} as local_amount

from {{ ref('wf_ff_at_zj_gl_account_stg_sap_bw__zjglaptin') }}