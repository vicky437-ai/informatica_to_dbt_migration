-- Model: wf_di_item_mtrl_master_int_material_master_enriched
-- Merged from 3 chunks

select * from {{ ref('wf_di_item_mtrl_master_stg_material_attr_txt') }}
),

material_enriched as (
    select
        *,
        -- Create composite keys and derived fields
        concat(product, '_', coalesce(division, 'NODIV')) as product_division_key,
        
        -- Calculate material volume with unit conversion
        {{ material_volume_conversion('material_volume', 'volume_unit') }} as material_volume_std,
        
        -- Standardize weight calculations
        {{ weight_conversion('gross_weight', 'weight_unit') }} as gross_weight_kg,
        {{ weight_conversion('net_weight', 'weight_unit') }} as net_weight_kg,
        
        -- Business rule flags
        case 
            when hazardmatnum is not null and hazardmatnum != '' then true 
            else false 
        end as is_hazardous_material,
        
        case 
            when cross_plant_status in ('01', '02') then 'ACTIVE'
            when cross_plant_status in ('03', '04') then 'BLOCKED'
            else 'UNKNOWN'
        end as material_status_category,
        
        -- Dimension calculations
        case 
            when unit_specific_product_length > 0 
                and unit_specific_product_width > 0 
                and unit_specific_product_height > 0 
            then unit_specific_product_length * unit_specific_product_width * unit_specific_product_height
            else null
        end as calculated_volume,
        
        -- Shelf life categorization
        case 
            when ttlshelflife is null or ttlshelflife = 0 then 'NO_EXPIRY'
            when ttlshelflife <= 30 then 'SHORT_SHELF_LIFE'
            when ttlshelflife <= 365 then 'MEDIUM_SHELF_LIFE'
            else 'LONG_SHELF_LIFE'
        end as shelf_life_category,
        
        -- Quality management flags
        case 
            when is_batch_management_required 
                and approved_batch_rec_req 
            then 'FULL_QM'
            when is_batch_management_required 
            then 'BATCH_ONLY'
            when approved_batch_rec_req 
            then 'APPROVAL_ONLY'
            else 'NO_QM'
        end as quality_management_level,
        
        -- Current timestamp for processing
        current_timestamp as processed_at
        
    from material_base
)

select * from material_enriched