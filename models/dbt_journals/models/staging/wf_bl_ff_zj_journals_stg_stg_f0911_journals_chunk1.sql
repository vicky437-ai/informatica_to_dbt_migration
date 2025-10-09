-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging: F0911 Account Ledger
-- Source: JDE F0911 table
-- Raw journal entry data from JD Edwards

select
    glicu as f0911_glicu,
    glicut as f0911_glicut,
    gldct as f0911_gldct,
    gldoc as f0911_gldoc,
    glkco as f0911_glkco,
    gldgj as f0911_gldgj,
    gllt as f0911_gllt,
    glexa as f0911_glexa,
    glcrcd as f0911_glcrcd,
    glcrrm as f0911_glcrrm,
    gltorg as f0911_gltorg,
    gldicj as f0911_gldicj,
    gljeln as f0911_gljeln,
    glextl as f0911_glextl,
    glani as f0911_glani,
    glco as f0911_glco,
    glaa as f0911_glaa,
    glexr as f0911_glexr,
    glsblt as f0911_glsblt,
    glsbl as f0911_glsbl,
    glpost as f0911_glpost,
    glre as f0911_glre,
    glrcnd as f0911_glrcnd,
    glpo as f0911_glpo,
    glasid as f0911_glasid,
    gluser as f0911_gluser,
    glupmj as f0911_glupmj,
    glupmt as f0911_glupmt
from {{ source('jde_source', 'f0911') }}