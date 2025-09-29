-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Base journal data for Non-Reversed records
with source_data as (
    select distinct
        f0911.glicu,
        f0911.glicut,
        f0911.gldct,
        f0911.gldoc,
        f0911.glkco,
        f0911.gldgj,
        f0911.gllt,
        f0911.glexa,
        f0911.glcrcd,
        f0911.glcrrm,
        f0911.gltorg,
        f0911.gldicj,
        f0011.icame,
        f0011.icist,
        f0911.gljeln,
        f0911.glextl,
        f0911.glani,
        f0901.gmdl01,
        f0911.glco,
        f0911.glaa,
        f0911.glexr,
        f0911.glsblt,
        f0911.glsbl,
        f0911.glpost,
        f0911.glre,
        f0911.glrcnd,
        f0911.glpo,
        f0911.glasid,
        f0911.gluser,
        f0911.glupmj,
        f0911.glupmt,
        f01151.eaemal,
        f0011.icicu,
        f0011.icicut,
        f0911.glaid,
        f0901.gmaid
    from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911') }} f0911
    inner join {{ ref('wf_bl_ff_zj_journals_stg_stg_f0011') }} f0011
        on f0911.glicu = f0011.icicu
        and f0911.glicut = f0011.icicut
    inner join {{ ref('wf_bl_ff_zj_journals_stg_stg_f0901') }} f0901
        on f0911.glaid = f0901.gmaid
    left join {{ ref('wf_bl_ff_zj_journals_stg_stg_f0092') }} f0092
        on f0911.gluser = f0092.uluser
    left join {{ ref('wf_bl_ff_zj_journals_stg_stg_f01151') }} f01151
        on f0092.ulan8 = f01151.eaan8
    where f0911.glre != 'R'
)

select * from source_data