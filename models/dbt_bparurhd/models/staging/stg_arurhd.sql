-- Staging: ARURHD
-- Source: Japan BPCS ARURHD table
-- Raw data from source system with basic cleansing

select
    lhspcd,
    lhspno,
    lhsptk,
    lhtrbk,
    lhegcd,
    lhedsq,
    lhcscd,
    lhhpcd,
    lhsptp,
    lhtacd,
    lhspnd,
    lhnyyd,
    lhrcdt,
    lhpayk,
    lhdda1,
    lhdda2,
    lhspat,
    lhtaxm,
    lhaskm,
    lhrsdt,
    lhtaxh,
    lhrsam,
    lhslcd,
    lhctax,
    lhchom,
    lhtden,
    lhtded,
    lhrcrm,
    lhdlkb,
    lhodno,
    lhkhst,
    lhnksf,
    lhspnk,
    lhnyuf,
    lhtaxf,
    lhsefg,
    lhsedt,
    lhhryu,
    lhdltf,
    lhrldt,
    lhrltm,
    lhrlur,
    lhrlpg
from {{ source('bpcs_japan', 'ARURHD') }}
{% if var('param_sq_filter', '') != '' %}
where {{ var('param_sq_filter') }}
{% endif %}