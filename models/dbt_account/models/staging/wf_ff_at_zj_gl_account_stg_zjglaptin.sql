-- Source: wf_FF_AT_ZJ_GL_ACCOUNT.XML
-- Staging: ZJGLAPTIN
-- Source: SAPBWOHS.ZJGLAPTIN
-- Raw data from SAP BW OHS source system

select
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
    line_desc_zj,
    glexr_zj,
    glsbl_zj,
    glpo_zj,
    glvinv_zj,
    gldgj_zj,
    fiscal_per_zj,
    desc_long_zj,
    amount_zj,
    amount_loc_zj
from {{ source('sapbwohs', 'zjglaptin') }}