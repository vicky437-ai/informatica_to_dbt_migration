-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Mart: FF_AT_Z1_GL_ACCOUNT (Flat file export)
-- Final analytical data ready for consumption
-- Data flow: stg_zb_reporting_finance_global_apptio_gb_z1_appt -> int_sq_zb_reporting_finance_global_apptio_gb_z1_appt -> int_exp_passthrough -> fct_ff_at_z1_gl_account
-- Prepares GL Account data for external file export

{{
    config(
        materialized='table',
        tags=['export', 'flatfile', 'gl_account']
    )
}}

select
    out_posting_date as posting_date,
    out_fiscal_year as fiscal_year,
    out_fiscalperiod as fiscal_period,
    out_accountingdocumentnumber as doc_num,
    out_numoflineitemwithinaccdoc as doc_line,
    out_itemtext as journal_line_description,
    out_glaccountnumber as account,
    out_glaccountlongname as account_description,
    out_costcenter as cost_center,
    out_companycode as company_code,
    out_accountnumofvendororcreditor as vendor_id,
    out_supplierfullname as vendor_name,
    out_purchasingdocumentnumber as purchase_order,
    out_invoice_reference as invoice,
    out_amountindocumentcurrency as amount_in_document_currency,
    out_currencykey as currency_code_document,
    out_amountinlocalcurrency as amount_in_local_currency,
    out_localcurrency as currency_code_local,
    out_source_desc_long as source_erp,
    out_wbs as wbs,
    out_projectdefinition as project_definition,
    out_documenttype as document_type,
    current_timestamp() as loaded_at
from {{ ref('wf_ff_at_z1_gl_account_int_exp_passthrough') }}