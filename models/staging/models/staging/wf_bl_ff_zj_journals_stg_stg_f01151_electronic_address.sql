-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging model for F01151 electronic address
select
    eaan8,
    eaidln,
    eaetp,
    eaemal
from {{ source('jde_source', 'f01151') }}
where eaetp = 'E' -- Email addresses only