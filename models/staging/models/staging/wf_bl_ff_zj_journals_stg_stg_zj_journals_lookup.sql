-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging model for ZJ journals lookup table
-- Used for lookup transformations in the workflow

select
    f0911_gldct,
    f0911_gldoc,
    f0911_glkco,
    f0911_gllt,
    f0911_gljeln
from {{ source('staging_tables', 's_zj_journals') }}