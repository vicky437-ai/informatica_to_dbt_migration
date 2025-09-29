-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model with enriched material data and calculated fields
-- Applies business logic and lookups for material master processing

with material_data as (
    select * from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_with_descriptions') }}
),

enriched_materials as (
    select 
        *,
        
        -- Calculate MD5 hash for change detection
        {{ generate_md5_hash([
            'product', 'product_type', 'cross_plant_status', 'creation_date',
            'gross_weight', 'net_weight', 'base_unit', 'product_group'
        ]) }} as record_hash,
        
        -- Business logic transformations
        case 
            when is_marked_for_deletion = true then 'INACTIVE'
            when cross_plant_status is not null then 'ACTIVE'
            else 'UNKNOWN'
        end as material_status,
        
        -- Weight calculations
        case 
            when gross_weight > 0 and net_weight > 0 
            then gross_weight - net_weight 
            else 0 
        end as tare_weight,
        
        -- Categorization
        case 
            when product_type in ('FERT', 'HALB') then 'FINISHED_GOODS'
            when product_type in ('ROH', 'HIBE') then 'RAW_MATERIALS'
            else 'OTHER'
        end as material_category,
        
        -- Date standardization
        coalesce(creation_date, current_date) as effective_creation_date,
        
        -- Flag calculations
        case when is_batch_management_required = true then 'Y' else 'N' end as batch_managed_flag,
        case when product_is_configurable = true then 'Y' else 'N' end as configurable_flag,
        case when is_pilferable = true then 'Y' else 'N' end as pilferable_flag,
        
        current_timestamp as processing_timestamp
        
    from material_data
)

select * from enriched_materials