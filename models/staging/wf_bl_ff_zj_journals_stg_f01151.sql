-- Model: wf_bl_ff_zj_journals_stg_f01151
-- Merged from 2 chunks

select
    ccco as company,
    ccdl01 as description_line_1,
    cccrcd as currency_code,
    ccfy as fiscal_year
from {{ source('jde_system', 'f01151') }}