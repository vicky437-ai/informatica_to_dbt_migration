-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model for revaluation journals with lookups
with base_journals as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911_r') }}
),

company_info as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0011') }}
),

account_info as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0901') }}
),

user_codes as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0092') }}
),

electronic_addr as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f01151') }}
),

joined_data as (
    select
        j.*,
        c.icist,
        c.icame,
        a.gmdl01,
        u.ulan8,
        e.eaetp,
        e.eaemal
    from base_journals j
    left join company_info c on j.glicu = c.icicu
    left join account_info a on j.glaid = a.gmaid
    left join user_codes u on j.gltorg = u.ulan8
    left join electronic_addr e on u.ulan8 = e.eaetp
)

select
    -- Apply field replacements and transformations
    {{ replace_null_with_space('glkco') }} as glkco,
    {{ replace_null_with_space('gldct') }} as gldct,
    {{ replace_null_with_space('gldoc') }} as gldoc,
    {{ replace_null_with_space('gldgj') }} as gldgj,
    {{ replace_null_with_space('gljeln') }} as gljeln,
    {{ replace_null_with_space('glextl') }} as glextl,
    {{ replace_null_with_space('glpost') }} as glpost,
    {{ replace_null_with_space('glco') }} as glco,
    {{ replace_null_with_space('glani') }} as glani,
    {{ replace_null_with_space('glsbl') }} as glsbl,
    {{ replace_null_with_space('glsblt') }} as glsblt,
    {{ replace_null_with_space('gllt') }} as gllt,
    {{ replace_null_with_space('glcrcd') }} as glcrcd,
    glaa,
    {{ replace_null_with_space('glre') }} as glre,
    glexa,
    glexr,
    {{ replace_null_with_space('glasid') }} as glasid,
    glrcnd,
    {{ replace_null_with_space('glpo') }} as glpo,
    {{ replace_null_with_space('gluser') }} as gluser,
    glupmj,
    glupmt,
    {{ replace_null_with_space('glcrrm') }} as glcrrm,
    gldicj,
    {{ replace_null_with_space('gltorg') }} as gltorg,
    {{ replace_null_with_space('glicu') }} as glicu,
    {{ replace_null_with_space('glicut') }} as glicut,
    icist,
    icame,
    gmdl01,
    eaetp,
    eaemal,
    {{ foreign_currency_flag('glcrcd') }} as foreign_currency_flag,
    current_timestamp as etl_load_dte
from joined_data
where {{ foreign_currency_flag('glcrcd') }} = 'Y' -- Foreign currency filter