-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging: F0011 Address Book Master
-- Source: JDE F0011 table
-- Address book master data from JD Edwards

select
    ican8 as f0011_ican8,
    icame as f0011_icame,
    icist as f0011_icist
from {{ source('jde_source', 'f0011') }}