-- Model: wf_bl_ff_zj_journals_stg_stg_f0092
-- Merged from 4 chunks

{{ config(materialized='view') }}

select
    crcrcd as currency_code_from,
    crcrr as exchange_rate,
    creftb as effective_date,
    current_timestamp as load_timestamp
from {{ source('lookup_system', 'f0092') }}