-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model for NR (Non-Restatement) records after filtering
-- Replicates flt_STG_NR and flt_condition_NR filters

with flagged_data as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_int_journals_with_flags') }}
),

filtered_nr_records as (
    select *
    from flagged_data
    where out_flag = 'NR'
      and glpost is not null
      and gldgj is not null
)

select * from filtered_nr_records