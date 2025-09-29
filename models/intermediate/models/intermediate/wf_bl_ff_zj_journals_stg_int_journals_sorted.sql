-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Sort journals by key fields
-- Implements Sorter transformation: srt_R
-- Sort by: GLKCO, GLDCT, GLDOC, GLJELN, GLLT

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

from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911_journals') }}

order by 
    glkco,
    gldct,
    gldoc,
    gljeln,
    gllt