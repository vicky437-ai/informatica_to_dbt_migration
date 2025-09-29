-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- REQUIRED mart for target: MTRL_MASTER
-- Target type: Table
-- Fact table for material master data with all business transformations

{{ config(
    materialized='table',
    indexes=[
      {'columns': ['product'], 'unique': true},
      {'columns': ['product_type']},
      {'columns': ['material_status']},
      {'columns': ['etl_load_dt']}
    ]
) }}

with material_data as (
    select * from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_enriched') }}
),

final_material_master as (
    select
        -- Primary keys
        product as material_id,
        product_type,
        
        -- Descriptive fields
        english_description as material_description,
        cross_plant_status,
        material_status,
        material_category,
        
        -- Dates
        effective_creation_date as creation_date,
        last_change_date,
        validity_start_date,
        
        -- Physical attributes
        gross_weight,
        net_weight,
        tare_weight,
        weight_unit,
        material_volume,
        volume_unit,
        
        -- Units and measurements
        base_unit,
        purchase_order_quantity_unit,
        preferred_unit_of_measure,
        
        -- Classification
        product_group,
        product_hierarchy,
        item_category_group,
        division,
        brand,
        
        -- Manufacturing
        manufacturer_number,
        manufacturer_part_profile,
        serial_number_profile,
        
        -- Quality and compliance
        quality_inspection_group,
        batch_managed_flag,
        configurable_flag,
        pilferable_flag,
        
        -- Packaging
        maximum_packaging_length,
        maximum_packaging_width,
        maximum_packaging_height,
        unit_for_max_packaging_dimensions,
        
        -- Warehouse
        warehouse_product_group,
        warehouse_storage_condition,
        standard_handling_unit_type,
        
        -- Procurement
        source_of_supply,
        procurement_rule,
        country_of_origin,
        
        -- Flags and indicators
        case when is_marked_for_deletion = true then 'Y' else 'N' end as deletion_flag,
        case when is_relevant_for_hzds_substances = true then 'Y' else 'N' end as hazardous_flag,
        case when has_variable_tare_weight = true then 'Y' else 'N' end as variable_tare_flag,
        
        -- Metadata
        record_hash,
        processing_timestamp,
        current_timestamp as etl_load_dt
        
    from material_data
    where product is not null
)

select * from final_material_master