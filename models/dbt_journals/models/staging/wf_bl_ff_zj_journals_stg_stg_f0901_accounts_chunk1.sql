-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging: F0901 Account Master
-- Source: JDE F0901 table
-- Account master data from JD Edwards

select
    gmco as f0901_gmco,
    gmobj as f0901_gmobj,
    gmdl01 as f0901_gmdl01
from {{ source('jde_source', 'f0901') }}