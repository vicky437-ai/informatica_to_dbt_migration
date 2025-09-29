-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model for reversed records with minimum GLDGJ aggregation
select
    glkco,
    gldct,
    gldoc,
    gljeln,
    gllt,
    min(gldgj) as min_gldgj,
    -- Get first values for other fields
    max(glicu) as glicu,
    max(glicut) as glicut,
    max(icist) as icist,
    max(icame) as icame,
    max(gmdl01) as gmdl01,
    max(glextl) as glextl,
    max(glpost) as glpost,
    max(glco) as glco,
    max(glani) as glani,
    max(glsbl) as glsbl,
    max(glsblt) as glsblt,
    max(glcrcd) as glcrcd,
    max(glaa) as glaa,
    max(glre) as glre,
    max(glexa) as glexa,
    max(glexr) as glexr,
    max(glasid) as glasid,
    max(glrcnd) as glrcnd,
    max(glpo) as glpo,
    max(gluser) as gluser,
    max(glupmj) as glupmj,
    max(glupmt) as glupmt,
    max(glcrrm) as glcrrm,
    max(gldicj) as gldicj,
    max(gltorg) as gltorg,
    max(eaemal) as eaemal,
    max(eaetp) as eaetp
from {{ ref('wf_bl_ff_zj_journals_stg_int_journals_with_flags') }}
where record_type = 'REVERSED'
group by glkco, gldct, gldoc, gljeln, gllt