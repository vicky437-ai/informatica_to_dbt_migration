-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate: Journals Enriched
-- Enriches journal data with account descriptions and user email addresses
-- Combines F0911, F0901, F0011, and F01151 data

select
    -- Primary keys
    j.f0911_gldct || '-' || j.f0911_gldoc || '-' || j.f0911_glkco as document_key,
    j.f0911_gldct || '-' || j.f0911_gldoc || '-' || j.f0911_glkco || '-' || j.f0911_gldgj || '-' || j.f0911_gllt || '-' || j.f0911_gljeln as journal_line_key,
    
    -- Journal fields
    j.f0911_glicu,
    j.f0911_glicut,
    j.f0911_gldct,
    j.f0911_gldoc,
    j.f0911_glkco,
    j.f0911_gldgj,
    j.f0911_gllt,
    j.f0911_glexa,
    j.f0911_glcrcd,
    j.f0911_glcrrm,
    j.f0911_gltorg,
    j.f0911_gldicj,
    j.f0911_gljeln,
    j.f0911_glextl,
    j.f0911_glani,
    j.f0911_glco,
    j.f0911_glaa,
    j.f0911_glexr,
    j.f0911_glsblt,
    j.f0911_glsbl,
    j.f0911_glpost,
    j.f0911_glre,
    j.f0911_glrcnd,
    j.f0911_glpo,
    j.f0911_glasid,
    j.f0911_gluser,
    j.f0911_glupmj,
    j.f0911_glupmt,
    
    -- Enriched fields
    a.f0901_gmdl01,
    ab.f0011_icame,
    ab.f0011_icist,
    e.f01151_eaemal

from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911_journals') }} j
left join {{ ref('wf_bl_ff_zj_journals_stg_stg_f0901_accounts') }} a
    on j.f0911_glco = a.f0901_gmco
    and j.f0911_glani = a.f0901_gmobj
left join {{ ref('wf_bl_ff_zj_journals_stg_stg_f0011_address_book') }} ab
    on cast(j.f0911_gltorg as number) = ab.f0011_ican8
left join {{ ref('wf_bl_ff_zj_journals_stg_stg_f01151_email') }} e
    on ab.f0011_ican8 = e.f01151_eaan8