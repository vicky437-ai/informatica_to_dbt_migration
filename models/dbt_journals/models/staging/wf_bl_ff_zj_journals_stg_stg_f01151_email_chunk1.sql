-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging: F01151 Electronic Address
-- Source: JDE F01151 table
-- Email address data from JD Edwards

select
    eaan8 as f01151_eaan8,
    eaemal as f01151_eaemal
from {{ source('jde_source', 'f01151') }}