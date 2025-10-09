-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Expression: Replace and Trim
-- Checking for null values for fields and replacing double quotes and perform trim operation

{{ config(
    materialized='view',
    tags=['intermediate', 'transformation']
) }}

select
    gldct,
    gldoc,
    glkco,
    gllt,
    gljeln,
    
    -- Apply trim and replace logic
    case 
        when trim(gldct) is null then ''
        else trim(replace(gldct, '"', ''))
    end as out_gldct,
    
    case 
        when trim(cast(gldoc as string)) is null then ''
        else trim(replace(cast(gldoc as string), '"', ''))
    end as out_gldoc,
    
    case 
        when trim(glkco) is null then ''
        else trim(replace(glkco, '"', ''))
    end as out_glkco,
    
    case 
        when trim(gllt) is null then ''
        else trim(replace(gllt, '"', ''))
    end as out_gllt,
    
    case 
        when trim(cast(gljeln as string)) is null then ''
        else trim(replace(cast(gljeln as string), '"', ''))
    end as out_gljeln

from {{ ref('wf_bl_ff_zj_journals_int_lkp_f01151') }}