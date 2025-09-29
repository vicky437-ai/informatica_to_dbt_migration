-- Model: wf_bl_ff_zj_journals_stg_int_journals_with_flags
-- Merged from 2 chunks

select * from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_with_replacements') }}
),

lookup_data as (
    select * from {{ ref('models/staging/wf_bl_ff_zj_journals_stg_stg_zj_journals_lookup') }}
),

flagged_records as (
    select 
        j.*,
        l.f0911_gldct as lkp_f0911_gldct,
        l.f0911_gldoc as lkp_f0911_gldoc,
        l.f0911_glkco as lkp_f0911_glkco,
        l.f0911_gllt as lkp_f0911_gllt,
        l.f0911_gljeln as lkp_f0911_gljeln,
        {{ generate_flag('l.f0911_gldct', 'j.gldct') }} as out_flag
    from journals_data j
    left join lookup_data l
        on j.gldct = l.f0911_gldct
        and j.gldoc = l.f0911_gldoc
        and j.glkco = l.f0911_glkco
        and j.gllt = l.f0911_gllt
        and j.gljeln = l.f0911_gljeln
)

select * from flagged_records