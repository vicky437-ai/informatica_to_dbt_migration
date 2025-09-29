-- Source: wf_S_BP_ARURHD.XML
-- Staging model for ARURHD table from Japan BPCS
-- Source: BPCS Japan system, ARURHD table
-- Description: Staging table S_BP_ARURHD from Japan BPCS (ARURHD)

select
    -- Supplier information
    lhspcd,
    lhspno,
    lhsptk,
    lhsptp,
    lhspnk,
    
    -- Transaction details
    lhtrbk,
    lhegcd,
    lhedsq,
    lhcscd,
    lhhpcd,
    lhtacd,
    
    -- Financial amounts
    lhspnd,
    lhnyyd,
    lhspat,
    lhtaxm,
    lhaskm,
    lhrsam,
    lhctax,
    lhchom,
    lhrcrm,
    lhtaxh,
    
    -- Dates
    lhrcdt,
    lhrsdt,
    lhtded,
    lhsedt,
    lhrldt,
    lhrltm,
    
    -- Flags and indicators
    lhpayk,
    lhdlkb,
    lhnksf,
    lhnyuf,
    lhtaxf,
    lhsefg,
    lhhryu,
    lhdltf,
    
    -- Additional data
    lhdda1,
    lhdda2,
    lhtden,
    lhodno,
    lhkhst,
    lhslcd,
    lhrlur,
    lhrlpg,
    
    -- ETL metadata
    {{ get_current_timestamp() }} as etl_load_dte

from {{ source('bpcs_japan', 'arurhd') }}