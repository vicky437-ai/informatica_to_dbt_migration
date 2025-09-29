-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Base journal entries with account and currency information
{{ config(materialized='view') }}

with journal_entries as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0911') }}
),

account_master as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0901') }}
),

currency_master as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0011') }}
),

user_master as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f0092') }}
),

email_addresses as (
    select * from {{ ref('wf_bl_ff_zj_journals_stg_stg_f01151') }}
),

-- Join journal entries with account master
journal_with_accounts as (
    select 
        j.*,
        a.gmdl01 as account_description
    from journal_entries j
    left join account_master a 
        on j.glaid = a.gmaid
),

-- Add currency information
journal_with_currency as (
    select 
        j.*,
        c.icame,
        c.icist
    from journal_with_accounts j
    left join currency_master c 
        on j.glicut = c.icicut 
        and j.glicu = c.icicu
),

-- Add user email information
journal_with_email as (
    select 
        j.*,
        u.ulan8,
        e.eaemal,
        e.eaetp
    from journal_with_currency j
    left join user_master u 
        on j.gltorg = u.uluser
    left join email_addresses e 
        on u.ulan8 = e.eaan8
)

select * from journal_with_email