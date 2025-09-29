-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model applying null value replacements
-- Replicates exp_replace_NR transformation

with source_data as (
    select * from {{ ref('models/staging/wf_bl_ff_zj_journals_stg_stg_jde_journals') }}
),

replaced_values as (
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
        {{ replace_null_values('glpo') }} as glpo,
        {{ replace_null_values('gluser') }} as gluser,
        glupmj,
        glupmt,
        {{ replace_null_values('glcrrm') }} as glcrrm,
        gldicj,
        {{ replace_null_values('gltorg') }} as gltorg,
        glextl,
        glpost,
        glco,
        glani,
        glicu,
        glicut,
        icist,
        {{ replace_null_values('icame') }} as icame,
        {{ replace_null_values('gmdl01') }} as gmdl01,
        -- Generate EAEMAL and EAETP fields based on business logic
        case when icame is not null then icame else 0 end as eaemal,
        case when icist = 'A' then 'ACTIVE' else 'INACTIVE' end as eaetp
    from source_data
)

select * from replaced_values