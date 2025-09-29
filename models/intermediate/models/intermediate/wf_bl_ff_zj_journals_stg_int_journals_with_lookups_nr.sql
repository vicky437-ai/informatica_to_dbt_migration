-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model for non-revaluation journals with lookups
with base_journals as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911_nr') }}
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
    {{ trim_fields('glkco') }} as glkco,
    {{ trim_fields('gldct') }} as gldct,
    {{ trim_fields('gldoc') }} as gldoc,
    {{ trim_fields('gldgj') }} as gldgj,
    {{ trim_fields('gljeln') }} as gljeln,
    {{ trim_fields('glextl') }} as glextl,
    {{ trim_fields('glpost') }} as glpost,
    {{ trim_fields('glco') }} as glco,
    {{ trim_fields('glani') }} as glani,
    {{ trim_fields('glsbl') }} as glsbl,
    {{ trim_fields('glsblt') }} as glsblt,
    {{ trim_fields('gllt') }} as gllt,
    {{ trim_fields('glcrcd') }} as glcrcd,
    glaa,
    {{ trim_fields('glre') }} as glre,
    glexa,
    glexr,
    {{ trim_fields('glasid') }} as glasid,
    glrcnd,
    {{ trim_fields('glpo') }} as glpo,
    {{ trim_fields('gluser') }} as gluser,
    glupmj,
    glupmt,
    {{ trim_fields('glcrrm') }} as glcrrm,
    gldicj,
    {{ trim_fields('gltorg') }} as gltorg,
    {{ trim_fields('glicu') }} as glicu,
    {{ trim_fields('glicut') }} as glicut,
    icist,
    icame,
    gmdl01,
    eaetp,
    eaemal,
    {{ foreign_currency_flag('glcrcd') }} as foreign_currency_flag,
    current_timestamp as etl_load_dte
from joined_data
where {{ foreign_currency_flag('glcrcd') }} = 'Y' -- Foreign currency filter