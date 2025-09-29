-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model joining materials with English descriptions
select
    m.product,
    m.product_type,
    m.cross_plant_status,
    m.cross_plant_status_validity_date,
    m.creation_date,
    m.created_by_user,
    m.last_change_date,
    m.last_changed_by_user,
    m.last_change_date_time,
    m.product_old_id,
    m.gross_weight,
    m.net_weight,
    m.material_volume,
    m.base_unit,
    m.weight_unit,
    m.volume_unit,
    m.purchase_order_quantity_unit,
    m.product_group,
    m.item_category_group,
    m.product_hierarchy,
    m.division,
    m.industry_sector,
    m.size_or_dimension_text,
    m.unit_specific_product_length,
    m.unit_specific_product_width,
    m.unit_specific_product_height,
    m.product_measurement_unit,
    m.is_marked_for_deletion,
    m.is_batch_management_required,
    m.product_is_configurable,
    m.manufacturer_number,
    m.product_manufacturer_number,
    m.manufacturer_part_profile,
    m.warehouse_product_group,
    m.warehouse_storage_condition,
    m.standard_handling_unit_type,
    m.handling_unit_type,
    m.quality_inspection_group,
    m.authorization_group,
    m.hazardous_material_number,
    m.packaging_material_type,
    m.container_requirement,
    m.total_shelf_life,
    m.minimum_remaining_shelf_life,
    m.storage_percentage,
    m.label_type,
    m.label_form,
    m.basic_material,
    m.country_of_origin,
    m.country_of_origin_material,
    m.maintenance_status,
    m.commodity,
    
    -- Join English description
    d.product_description,
    
    m.loaded_at

from {{ ref('wf_di_item_mtrl_master_stg_xml_md_material_attr_txt') }} m
left join (
    select 
        product,
        product_description
    from {{ ref('models/staging/wf_di_item_mtrl_master_stg_material_descriptions') }}
    where language = 'EN'
) d on m.product = d.product