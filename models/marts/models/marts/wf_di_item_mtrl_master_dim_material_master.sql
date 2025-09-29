-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Material master dimension table
-- Target type: Database Table
{{ config(
    materialized='table',
    indexes=[
      {'columns': ['product'], 'unique': True},
      {'columns': ['product_type']},
      {'columns': ['product_group']}
    ]
) }}

select
    -- Primary key
    product as material_key,
    
    -- Product identification
    product,
    product_type,
    product_old_id,
    product_description,
    
    -- Classification
    product_group,
    item_category_group,
    product_hierarchy,
    division,
    industry_sector,
    
    -- Physical properties
    gross_weight,
    net_weight,
    material_volume,
    size_or_dimension_text,
    unit_specific_product_length,
    unit_specific_product_width,
    unit_specific_product_height,
    
    -- Units of measure
    base_unit,
    weight_unit,
    volume_unit,
    purchase_order_quantity_unit,
    product_measurement_unit,
    
    -- Status indicators
    cross_plant_status,
    cross_plant_status_validity_date,
    case 
        when is_marked_for_deletion = '1' then 'Y'
        else 'N'
    end as is_deleted,
    case 
        when is_batch_management_required = '1' then 'Y'
        else 'N'
    end as batch_managed,
    case 
        when product_is_configurable = '1' then 'Y'
        else 'N'
    end as is_configurable,
    
    -- Manufacturing
    manufacturer_number,
    product_manufacturer_number,
    manufacturer_part_profile,
    
    -- Storage and handling
    warehouse_product_group,
    warehouse_storage_condition,
    standard_handling_unit_type,
    handling_unit_type,
    
    -- Quality and compliance
    quality_inspection_group,
    authorization_group,
    hazardous_material_number,
    
    -- Packaging
    packaging_material_type,
    container_requirement,
    
    -- Shelf life
    total_shelf_life,
    minimum_remaining_shelf_life,
    storage_percentage,
    
    -- Labels and documentation
    label_type,
    label_form,
    basic_material,
    
    -- Country and origin
    country_of_origin,
    country_of_origin_material,
    
    -- Maintenance
    maintenance_status,
    commodity,
    
    -- Material characteristics
    disposable_ind,
    expiry_ind,
    sterile_ind,
    serialized_ind,
    pvc_free_ind,
    danger_goods_ind,
    rework_ind,
    hyp_cd,
    hyp_brand_desc,
    material_thickness_ind,
    cast(material_thickness_upper_limit as decimal(6,2)) as material_thickness_upper_limit,
    cast(material_thickness_lower_limit as decimal(6,2)) as material_thickness_lower_limit,
    material_thickness_measurement,
    shipping_restriction,
    shipping_temperature_control_ind,
    scrap_item_ind,
    rebox_ww_ind,
    
    -- Audit fields
    creation_date,
    created_by_user,
    last_change_date,
    last_changed_by_user,
    last_change_date_time,
    loaded_at,
    current_timestamp as processed_at

from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_with_characteristics') }}