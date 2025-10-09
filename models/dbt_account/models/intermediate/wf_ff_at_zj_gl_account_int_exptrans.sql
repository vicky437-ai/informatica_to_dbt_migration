-- Source: wf_FF_AT_ZJ_GL_ACCOUNT.XML
-- Expression: EXPTRANS
-- Applies business logic transformations including:
-- - Data cleansing (removing double quotes)
-- - Date formatting (SAP date to YYYYMMDD)
-- - Amount truncation to 3 decimal places

select
    -- Pass-through fields
    ohrequid,
    datapakid,
    record,
    glani_zj,
    glmcu_zj,
    gldoc_zj,
    gldct_zj,
    gljeln_zj,
    vendor_id_zj,
    vendor_name_zj,
    gmdl01_zj,
    glbcrc_zj,
    glcrcd_zj,
    glsbl_zj,
    glpo_zj,
    glvinv_zj,
    fiscal_per_zj,
    desc_long_zj,
    
    -- Transformed fields
    -- Replace double quotes that mess up CSV formatting
    {{ clean_double_quotes('line_desc_zj') }} as out_line_desc_zj,
    
    -- Replace double quotes and truncate to 30 characters
    left({{ clean_double_quotes('glexr_zj') }}, 30) as out_glexr_zj,
    
    -- Format SAP date to YYYYMMDD string
    {{ format_sap_date('gldgj_zj') }} as out_gldgj_zj,
    
    -- Truncate amounts to 3 decimal places
    {{ truncate_decimal('amount_zj', 3) }} as out_amount_zj,
    {{ truncate_decimal('amount_loc_zj', 3) }} as out_amount_loc_zj

from {{ ref('wf_ff_at_zj_gl_account_int_amgdsq_zjglaptin') }}