-- Model: wf_di_item_mtrl_master_stg_xml_md_material_attr_txt
-- Merged from 2 chunks

select
    -- Product identification
    product,
    product_type,
    cross_plant_status,
    cross_plant_status_validity_date,
    
    -- Audit fields
    creation_date,
    created_by_user,
    last_change_date,
    last_changed_by_user,
    last_change_date_time,
    
    -- Product attributes
    product_old_id,
    gross_weight,
    net_weight,
    material_volume,
    base_unit,
    weight_unit,
    volume_unit,
    purchase_order_quantity_unit,
    
    -- Classification
    product_group,
    item_category_group,
    product_hierarchy,
    division,
    industry_sector,
    
    -- Physical properties
    size_or_dimension_text,
    unit_specific_product_length,
    unit_specific_product_width,
    unit_specific_product_height,
    product_measurement_unit,
    
    -- Status and control
    is_marked_for_deletion,
    is_batch_management_required,
    product_is_configurable,
    
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
    hazard_mat_num as hazardous_material_number,
    
    -- Packaging
    pckg_mater_typ as packaging_material_type,
    container_req as container_requirement,
    
    -- Shelf life
    ttl_shelf_life as total_shelf_life,
    min_rem_shelf as minimum_remaining_shelf_life,
    strg_perc as storage_percentage,
    
    -- Labels and documentation
    label_type,
    label_form,
    basic_material,
    
    -- Country and origin
    country_of_origin,
    country_of_origin_material,
    
    -- Maintenance and status
    maint_st as maintenance_status,
    commodity,
    
    -- Timestamps for processing
    current_timestamp as loaded_at

from {{ source('xml_file', 'xml_md_material_attr_txt') }}