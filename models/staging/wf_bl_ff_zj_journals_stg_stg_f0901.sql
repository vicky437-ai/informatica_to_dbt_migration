-- Model: wf_bl_ff_zj_journals_stg_stg_f0901
-- Merged from 4 chunks

{{ config(materialized='view') }}

select
    gmaid,
    gmdl01
from {{ source('jde_source', 'f0901') }}