-- Source: wf_FF_AT_ZJ_GL_ACCOUNT.XML
-- REQUIRED mart for target: FF_AT_ZJ_GL_ACCOUNT
-- Target type: FlatFile
-- Fact table for GL Account transactions from SAP BW

{{ config(
    materialized='table',
    indexes=[
      {'columns': ['journal_id', 'journal_line_id'], 'unique': false},
      {'columns': ['posting_date'], 'unique': false},
      {'columns': ['gl_account_number'], 'unique': false}
    ]
) }}

select
    -- Primary business keys
    gl_account_number as account,
    cost_center,
    journal_id,
    document_type,
    journal_line_id,
    
    -- Vendor information
    vendor_id,
    vendor_name,
    
    -- Account details
    account_description,
    
    -- Currency information
    base_currency_code as currency_code_base,
    from_currency_code as currency_code_from,
    
    -- Descriptions and remarks
    journal_line_description,
    remark_explanation,
    
    -- Reference fields
    subledger_gl as subledger_gl,
    purchase_order,
    supplier_invoice,
    
    -- Date and period
    posting_date,
    fiscal_year_period as fiscal_year_period,
    
    -- Source system
    source_erp,
    
    -- Financial amounts
    amount,
    local_amount,
    
    -- Audit fields
    current_timestamp as dbt_created_at,
    current_timestamp as dbt_updated_at

from {{ ref('wf_ff_at_zj_gl_account_int_gl_account_transformed') }}