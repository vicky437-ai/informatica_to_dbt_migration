-- Source: wf_S_BP_ARURHD.XML
-- Intermediate model for ARURHD with business logic enhancements
-- Adds calculated fields and data quality improvements

select
    -- Primary keys and identifiers
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
    
    -- Financial amounts (original)
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
    
    -- Date conversions using macro
    {{ convert_numeric_date('lhrcdt') }} as record_date,
    {{ convert_numeric_date('lhrsdt') }} as result_date,
    {{ convert_numeric_date('lhtded') }} as transaction_date,
    {{ convert_numeric_date('lhsedt') }} as settlement_date,
    {{ convert_numeric_date('lhrldt') }} as release_date,
    
    -- Original numeric dates
    lhrcdt,
    lhrsdt,
    lhtded,
    lhsedt,
    lhrldt,
    lhrltm,
    
    -- Flags and indicators with descriptions
    lhpayk,
    case 
        when lhpayk = 'Y' then 'Yes'
        when lhpayk = 'N' then 'No'
        else 'Unknown'
    end as payment_key_desc,
    
    lhdlkb,
    case 
        when lhdlkb = 'Y' then 'Deleted'
        when lhdlkb = 'N' then 'Active'
        else 'Unknown'
    end as delete_status,
    
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
    
    -- Calculated fields
    case 
        when lhspnd > 0 then 'Positive'
        when lhspnd < 0 then 'Negative'
        else 'Zero'
    end as spend_category,
    
    case 
        when lhtaxm > 0 then 'Taxable'
        else 'Non-Taxable'
    end as tax_status,
    
    -- ETL metadata
    etl_load_dte

from {{ ref('wf_s_bp_arurhd_stg_bpcs_arurhd') }}