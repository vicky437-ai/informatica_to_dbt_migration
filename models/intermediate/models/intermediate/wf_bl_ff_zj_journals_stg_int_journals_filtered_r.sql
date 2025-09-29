-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model for R (Restatement) records after filtering
-- Replicates flt_STG_R and flt_condition_R filters

with flagged_data as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_int_journals_with_flags') }}
),

filtered_r_records as (
    select *
    from flagged_data
    where out_flag = 'R'
      and glpost is not null
      and gldgj is not null
)

select * from filtered_r_records