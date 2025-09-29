-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- REQUIRED mart for target: FF_AT_Z1_GL_ACCOUNT
-- Target type: FlatFile
-- Fact table containing GL account transaction data for Appito export

select
    posting_date,
    fiscal_year,
    fiscal_period,
    doc_num,
    doc_line,
    journal_line_description,
    account,
    account_description,
    cost_center,
    company_code,
    vendor_id,
    vendor_name,
    purchase_order,
    invoice,
    amount_in_document_currency,
    currency_code_document,
    amount_in_local_currency,
    currency_code_local,
    source_erp,
    wbs,
    project_definition,
    document_type

from {{ ref('wf_ff_at_z1_gl_account_int_gl_account_cleaned') }}