-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Filter for new records only
-- Implements Filter transformation: flt_STG_R

select
    glicu,
    glicut,
    icist,
    icame,
    gmdl01,
    glkco,
    gldct,
    gldoc,
    gldgj,
    gljeln,
    glextl,
    glpost,
    glco,
    glani,
    glsbl,
    glsblt,
    gllt,
    glcrcd,
    glaa,
    glre,
    glexa,
    glexr,
    glasid,
    glrcnd,
    glpo,
    gluser,
    glupmj,
    glupmt,
    glcrrm,
    gldicj,
    gltorg,
    eaemal,
    eaetp,
    etl_load_dte

from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_with_staging_lookup') }}

where out_flag = 'Y'