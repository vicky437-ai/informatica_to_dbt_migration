-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging: F0011 Intercompany Constants
-- Source: CRPDTA.F0011
-- Raw data from JDE Intercompany Constants table

select
    icicut,
    icicu,
    icist,
    iciapp,
    icaicu,
    icuser,
    icdicj,
    icndo,
    icbal,
    icbalj,
    icame,
    icdocn,
    icausr,
    icpob,
    iciboi,
    icaipt,
    icoffp,
    icpid,
    icjobn,
    icupmj,
    icupmt,
    icdrsp,
    ic52pp,
    iccbp
from {{ source('crpdta', 'f0011') }}