-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model with aggregation for R records
-- Replicates agg_GLDGJ_R aggregator transformation

with filtered_r as (
    select * from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_filtered_r') }}
),

aggregated_data as (
    select
        gldgj,
        glkco,
        gldct,
        gldoc,
        gljeln,
        gllt,
        glcrcd,
        glaa,
        glsbl,
        glsblt,
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
        gmdl01,
        eaemal,
        eaetp,
        max(gldgj) as out_gldgj
    from filtered_r
    group by
        gldgj, glkco, gldct, gldoc, gljeln, gllt, glcrcd, glaa, glsbl, glsblt,
        glre, glexa, glexr, glasid, glrcnd, glpo, gluser, glupmj, glupmt,
        glcrrm, gldicj, gltorg, glextl, glpost, glco, glani, glicu, glicut,
        icist, icame, gmdl01, eaemal, eaetp
)

select * from aggregated_data