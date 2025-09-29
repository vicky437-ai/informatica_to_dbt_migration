-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Filter for non-reversal records (GLRE <> 'R')
select 
    {{ trim_and_clean('glicu') }} as out_glicu,
    {{ trim_and_clean('glicut') }} as out_glicut,
    {{ trim_and_clean('icist') }} as out_icist,
    {{ trim_and_clean('icame') }} as out_icame,
    {{ trim_and_clean('gmdl01') }} as out_gmdl01,
    {{ trim_and_clean('glkco') }} as out_glkco,
    {{ trim_and_clean('gldct') }} as out_gldct,
    {{ trim_and_clean('gldoc') }} as out_gldoc,
    {{ trim_and_clean('gldgj') }} as out_gldgj,
    {{ trim_and_clean('gljeln') }} as out_gljeln,
    {{ trim_and_clean('glextl') }} as out_glextl,
    {{ trim_and_clean('glpost') }} as out_glpost,
    {{ trim_and_clean('glco') }} as out_glco,
    {{ trim_and_clean('glani') }} as out_glani,
    {{ trim_and_clean('glsbl') }} as out_glsbl,
    {{ trim_and_clean('glsblt') }} as out_glsblt,
    {{ trim_and_clean('gllt') }} as out_gllt,
    {{ trim_and_clean('glcrcd') }} as out_glcrcd,
    {{ trim_and_clean('glaa') }} as out_glaa,
    {{ trim_and_clean('glre') }} as out_glre,
    {{ trim_and_clean('glexa') }} as out_glexa,
    {{ trim_and_clean('glexr') }} as out_glexr,
    {{ trim_and_clean('glasid') }} as out_glasid,
    {{ trim_and_clean('glrcnd') }} as out_glrcnd,
    {{ trim_and_clean('glpo') }} as out_glpo,
    case 
        when gluser is null or trim(gluser) = '' then ''
        else {{ trim_and_clean('gluser') }}
    end as out_gluser,
    {{ trim_and_clean('glupmj') }} as out_glupmj,
    {{ trim_and_clean('glupmt') }} as out_glupmt,
    {{ trim_and_clean('glcrrm') }} as out_glcrrm,
    {{ trim_and_clean('gldicj') }} as out_gldicj,
    {{ trim_and_clean('gltorg') }} as out_gltorg,
    {{ trim_and_clean('eaemal') }} as out_eaemal,
    {{ trim_and_clean('eaetp') }} as out_eaetp,
    current_timestamp as etl_load_dte
from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_new_records_only') }}
where trim(glre) <> 'R' or glre is null