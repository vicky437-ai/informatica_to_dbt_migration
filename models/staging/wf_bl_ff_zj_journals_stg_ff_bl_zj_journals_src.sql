-- Model: wf_bl_ff_zj_journals_stg_ff_bl_zj_journals_src
-- Merged from 2 chunks

select
    filename
from {{ source('file_system', 'ff_bl_zj_journals_src') }}