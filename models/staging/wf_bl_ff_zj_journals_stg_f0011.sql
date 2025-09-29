-- Model: wf_bl_ff_zj_journals_stg_f0011
-- Merged from 2 chunks

select
    aban8 as address_number,
    abalph as alphabetic_name,
    abac01 as category_code_01,
    abac02 as category_code_02,
    abac03 as category_code_03
from {{ source('jde_system', 'f0011') }}