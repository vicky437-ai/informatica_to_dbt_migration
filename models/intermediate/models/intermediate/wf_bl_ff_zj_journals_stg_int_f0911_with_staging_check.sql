-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: F0911 with staging table lookup to identify new records
with f0911_data as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911') }}
),

staging_lookup as (
    select 
        glkco as lkp_glkco,
        gldct as lkp_gldct,
        gldoc as lkp_gldoc,
        gljeln as lkp_gljeln,
        gllt as lkp_gllt
    from {{ ref('wf_bl_ff_zj_journals_stg_stg_s_zj_journals') }}
),

f0911_with_lookup as (
    select 
        f.*,
        s.lkp_glkco as lkp_f0911_glkco,
        s.lkp_gldct as lkp_f0911_gldct,
        s.lkp_gldoc as lkp_f0911_gldoc,
        s.lkp_gljeln as lkp_f0911_gljeln,
        s.lkp_gllt as lkp_f0911_gllt
    from f0911_data f
    left join staging_lookup s
        on f.glkco = s.lkp_glkco
        and f.gldct = s.lkp_gldct
        and f.gldoc = s.lkp_gldoc
        and f.gljeln = s.lkp_gljeln
        and f.gllt = s.lkp_gllt
)

select 
    *,
    {{ check_staging_exists() }} as out_flag,
    current_timestamp as etl_load_dte
from f0911_with_lookup