-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model with enriched material master data including lookups
with base_materials as (
    select * from {{ ref('wf_di_item_mtrl_master_stg_mtrl_master') }}
),

enriched_materials as (
    select
        base.*,
        
        -- IBP Scope Indicator lookup
        ibp_lkp.ibp_scope_ind_value,
        
        -- CE Mark Indicator lookup  
        ce_lkp.ce_mark_ind_value,
        
        -- FDA Product Code lookup
        fda_lkp.fda_prod_cd_value,
        
        -- Determine if record exists in target (for update strategy)
        case 
            when existing.mtrl_nbr is not null then 'UPDATE'
            else 'INSERT'
        end as dml_operation,
        
        -- Add current timestamp for ETL processing
        current_timestamp as process_timestamp
        
    from base_materials base
    
    -- Lookup joins
    left join {{ ref('models/staging/wf_di_item_mtrl_master_stg_ibp_scope_ind_lookup') }} ibp_lkp
        on ibp_lkp.key_of_obj = base.mtrl_nbr
        
    left join {{ ref('models/staging/wf_di_item_mtrl_master_stg_ce_mark_ind_lookup') }} ce_lkp
        on ce_lkp.key_of_obj = base.mtrl_nbr
        
    left join {{ ref('models/staging/wf_di_item_mtrl_master_stg_fda_prod_cd_lookup') }} fda_lkp
        on fda_lkp.key_of_obj = base.mtrl_nbr
        
    -- Self-join to determine if record exists (simulating lookup transformation)
    left join {{ ref('wf_di_item_mtrl_master_stg_mtrl_master') }} existing
        on existing.mtrl_nbr = base.mtrl_nbr
        and existing.etl_load_dt < base.etl_load_dt
)

select * from enriched_materials