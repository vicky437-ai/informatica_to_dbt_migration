-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging model for F0092 user master
select
    uluser,
    ulan8
from {{ source('jde_source', 'f0092') }}