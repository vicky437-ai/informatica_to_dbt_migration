-- Source: wf_FF_AT_ZJ_GL_ACCOUNT.XML
-- Staging model for SAP BW GL Account data
-- Source: ZJGLAPTIN from SAP BW OHS

select
    -- Control fields
    ohrequid,
    datapakid,
    record,
    
    -- Business fields with standardized names
    glani_zj as gl_account_number,
    glmcu_zj as cost_center,
    gldoc_zj as journal_id,
    gldct_zj as document_type,
    gljeln_zj as journal_line_id,
    vendor_id_zj as vendor_id,
    vendor_name_zj as vendor_name,
    gmdl01_zj as account_description,
    glbcrc_zj as base_currency_code,
    glcrcd_zj as from_currency_code,
    line_desc_zj as journal_line_description_raw,
    glexr_zj as remark_explanation_raw,
    glsbl_zj as subledger_gl,
    glpo_zj as purchase_order,
    glvinv_zj as supplier_invoice,
    gldgj_zj as posting_date_raw,
    fiscal_per_zj as fiscal_year_period,
    desc_long_zj as source_erp,
    amount_zj as amount_raw,
    amount_loc_zj as local_amount_raw

from {{ source('sap_bw', 'zjglaptin') }}