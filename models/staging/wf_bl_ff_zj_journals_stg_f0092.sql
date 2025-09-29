-- Model: wf_bl_ff_zj_journals_stg_f0092
-- Merged from 2 chunks

select
    drsy as system_code,
    drrt as record_type,
    drky as user_defined_code,
    drdl01 as description_01,
    drdl02 as description_02
from {{ source('jde_system', 'f0092') }}