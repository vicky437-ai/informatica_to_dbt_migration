-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Mart: S_ZJ_JOURNALS (Oracle database target)
-- Final analytical data ready for consumption in Oracle database
-- Data flow: stg_ff_bl_zj_journals_src -> int_journals_enriched -> fct_s_zj_journals

{{
    config(
        materialized='table',
        tags=['oracle', 'mart', 'journals']
    )
}}

select
    -- Map source fields to target Oracle table structure
    cast(batch_number as number(15,0)) as f0911_glicu,
    cast(batch_type as nchar(2)) as f0911_glicut,
    cast(document_type as nchar(2)) as f0911_gldct,
    cast(document_number as number(15,0)) as f0911_gldoc,
    cast(document_company as nchar(5)) as f0911_glkco,
    cast(gl_date as number(6,0)) as f0911_gldgj,
    cast(ledger_type as nchar(2)) as f0911_gllt,
    cast(explanation_alpha as nchar(30)) as f0911_glexa,
    cast(currency as nchar(3)) as f0911_glcrcd,
    cast(foreign_domestic as nchar(1)) as f0911_glcrrm,
    cast(gltorg_user_id as nchar(10)) as f0911_gltorg,
    cast(batch_date as number(6,0)) as f0911_gldicj,
    cast(amount_entered as number(15,0)) as f0011_icame,
    cast(batch_status as nchar(1)) as f0011_icist,
    cast(journal_entry_line_number as number(15,0)) as f0911_gljeln,
    cast(line_extension_code as nchar(2)) as f0911_glextl,
    cast(account_number as nchar(29)) as f0911_glani,
    cast(account_description as nchar(30)) as f0901_gmdl01,
    cast(company as nchar(5)) as f0911_glco,
    cast(amount as number(15,0)) as f0911_glaa,
    cast(explanation_remark as nchar(30)) as f0911_glexr,
    cast(subledger_type as nchar(1)) as f0911_glsblt,
    cast(subledger as nchar(8)) as f0911_glsbl,
    cast(gl_posted_code as nchar(1)) as f0911_glpost,
    cast(reverse_void as nchar(1)) as f0911_glre,
    cast(reconciled_code as nchar(1)) as f0911_glrcnd,
    cast(purchase_order as nchar(8)) as f0911_glpo,
    cast(asset_number as nchar(25)) as f0911_glasid,
    cast(gluser_user_id as nchar(10)) as f0911_gluser,
    cast(date_updated as number(6,0)) as f0911_glupmj,
    cast(time_last_updated as number(15,0)) as f0911_glupmt,
    cast(email as nvarchar2(256)) as f01151_eaemal,
    current_timestamp() as etl_load_dte
    
from {{ ref('wf_bl_ff_zj_journals_int_journals_enriched') }}