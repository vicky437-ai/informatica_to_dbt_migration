-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Add staging table lookup and flag
-- Implements lookup transformations and expression logic

with staging_lookup as (
    select
        f0911_gldct,
        f0911_gldoc,
        f0911_glkco,
        f0911_gllt,
        f0911_gljeln
    from {{ ref('wf_bl_ff_zj_journals_stg_stg_s_zj_journals') }}
),

journals_with_lookup as (
    select
        j.*,
        s.f0911_gldct as lkp_f0911_gldct,
        s.f0911_gldoc as lkp_f0911_gldoc,
        s.f0911_glkco as lkp_f0911_glkco,
        s.f0911_gllt as lkp_f0911_gllt,
        s.f0911_gljeln as lkp_f0911_gljeln
    from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_sorted') }} j
    left join staging_lookup s
        on j.gldct = s.f0911_gldct
        and j.gldoc = s.f0911_gldoc
        and j.glkco = s.f0911_glkco
        and j.gllt = s.f0911_gllt
        and j.gljeln = s.f0911_gljeln
)

select
    *,
    -- Flag logic: 'Y' if not found in staging, 'N' if found
    {{ staging_lookup_flag('lkp_f0911_gldct', 'lkp_f0911_gldoc', 'lkp_f0911_glkco', 'lkp_f0911_gllt', 'lkp_f0911_gljeln') }} as out_flag

from journals_with_lookup