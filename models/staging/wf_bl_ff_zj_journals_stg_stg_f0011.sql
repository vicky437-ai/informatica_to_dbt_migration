-- Model: wf_bl_ff_zj_journals_stg_stg_f0011
-- Merged from 4 chunks

{{ config(materialized='view') }}

select
    icicu,
    icist,
    icicut,
    icame
from {{ source('jde_source', 'f0011') }}