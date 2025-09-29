-- Source: wf_S_BP_ARURHD.XML
-- REQUIRED mart for target: S_BP_ARURHD
-- Target type: Database Table
-- Description: Fact table for BPCS ARURHD staging data

select
    -- Supplier information
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
    
    -- Financial measures
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
    
    -- Control flags
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
    
    -- Audit fields
    lhrldt,
    lhrltm,
    lhrlur,
    lhrlpg,
    
    -- ETL metadata
    etl_load_dte

from {{ ref('wf_s_bp_arurhd_int_arurhd_enhanced') }}