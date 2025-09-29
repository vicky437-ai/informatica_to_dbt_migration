-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging model for JDE journal entries
-- Source: F0011_F0911_F0901 combined table

select
    glkco,
    gldct,
    gldoc,
    gldgj,
    gljeln,
    gllt,
    glaa,
    glsbl,
    glsblt,
    glcrcd,
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
    glextl,
    glpost,
    glco,
    glani,
    glicu,
    glicut,
    icist,
    icame,
    gmdl01
from {{ source('jde_source', 'f0011_f0911_f0901') }}