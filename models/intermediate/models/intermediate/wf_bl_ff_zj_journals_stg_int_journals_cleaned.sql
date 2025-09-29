-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model applying data cleansing transformations
-- Replicates exp_replace_R transformation logic

select
    -- Apply cleaning macro to all fields
    {{ clean_field_and_remove_quotes('glicu') }} as out_glicu,
    {{ clean_field_and_remove_quotes('glicut') }} as out_glicut,
    {{ clean_field_and_remove_quotes('gldct') }} as out_gldct,
    {{ clean_field_and_remove_quotes('gldoc') }} as out_gldoc,
    {{ clean_field_and_remove_quotes('glkco') }} as out_glkco,
    {{ clean_field_and_remove_quotes('gldgj') }} as out_gldgj,
    {{ clean_field_and_remove_quotes('gllt') }} as out_gllt,
    {{ clean_field_and_remove_quotes('glexa') }} as out_glexa,
    {{ clean_field_and_remove_quotes('glcrcd') }} as out_glcrcd,
    {{ clean_field_and_remove_quotes('glcrrm') }} as out_glcrrm,
    {{ clean_field_and_remove_quotes('gltorg') }} as out_gltorg,
    {{ clean_field_and_remove_quotes('gldicj') }} as out_gldicj,
    {{ clean_field_and_remove_quotes('icame') }} as out_icame,
    {{ clean_field_and_remove_quotes('icist') }} as out_icist,
    {{ clean_field_and_remove_quotes('gljeln') }} as out_gljeln,
    {{ clean_field_and_remove_quotes('glextl') }} as out_glextl,
    {{ clean_field_and_remove_quotes('glani') }} as out_glani,
    {{ clean_field_and_remove_quotes('gmdl01') }} as out_gmdl01,
    {{ clean_field_and_remove_quotes('glco') }} as out_glco,
    {{ clean_field_and_remove_quotes('glaa') }} as out_glaa,
    {{ clean_field_and_remove_quotes('glexr') }} as out_glexr,
    {{ clean_field_and_remove_quotes('glsblt') }} as out_glsblt,
    {{ clean_field_and_remove_quotes('glsbl') }} as out_glsbl,
    {{ clean_field_and_remove_quotes('glpost') }} as out_glpost,
    {{ clean_field_and_remove_quotes('glre') }} as out_glre,
    {{ clean_field_and_remove_quotes('glrcnd') }} as out_glrcnd,
    {{ clean_field_and_remove_quotes('glpo') }} as out_glpo,
    {{ clean_field_and_remove_quotes('glasid') }} as out_glasid,
    {{ clean_field_and_remove_quotes('gluser') }} as out_gluser,
    {{ clean_field_and_remove_quotes('glupmj') }} as out_glupmj,
    {{ clean_field_and_remove_quotes('glupmt') }} as out_glupmt,
    etl_load_dte
from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911_journals') }}