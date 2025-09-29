-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for product master data
-- Handles data type conversions and basic transformations

SELECT
    -- Primary key
    TRIM(product) AS product,
    
    -- Basic product information
    mater_grp_pckg_mater AS material_group_packaging,
    product_group,
    weight_unit,
    volume_unit,
    {{ decimal_conversion('material_volume') }} AS material_volume,
    size_or_dimension_text,
    product_hierarchy,
    product_old_id,
    {{ decimal_conversion('net_weight') }} AS net_weight,
    labdsgnoffc AS lab_design_office,
    product_standard_id,
    {{ decimal_conversion('gross_weight') }} AS gross_weight,
    item_category_group,
    external_product_group,
    division,
    cross_plant_status_validity_date,
    cross_plant_status,
    international_article_number_cat,
    authorization_group,
    product_type,
    industry_sector,
    pgenumdocwitho_doc_manasys AS page_num_doc_without_doc_mgmt,
    industry_standard_name,
    docverwitho_doc_manasys AS doc_version_without_doc_mgmt,
    doctypwitho_doc_manasys AS doc_type_without_doc_mgmt,
    docchngenumwithodocumanasys AS doc_change_num_without_doc_mgmt,
    
    -- Boolean conversions
    {{ boolean_string_conversion('in_cad_indicator') }} AS cad_indicator,
    basic_material,
    pge_format_produc_memo AS page_format_product_memo,
    {{ boolean_string_conversion('in_indi_in_bulk_liquid') }} AS bulk_liquid_indicator,
    {{ boolean_string_conversion('in_indi_highly_viscous') }} AS highly_viscous_indicator,
    {{ boolean_string_conversion('in_envrmnt_relevant') }} AS environment_relevant,
    docnumwithodocmanagsys AS doc_num_without_doc_mgmt,
    pack_code,
    {{ boolean_string_conversion('in_approved_batch_rec_req') }} AS approved_batch_rec_req,
    
    -- Shelf life and storage
    ttlshelflife AS total_shelf_life,
    temppcondindi AS temp_condition_indicator,
    strgperc AS storage_percentage,
    strcond AS storage_condition,
    roundrlcal_sled AS round_rule_calc_sled,
    hazardmatnum AS hazard_material_number,
    contnrreq AS container_requirement,
    prd_indi_exp_dt AS product_indicator_exp_date,
    {{ decimal_conversion('quant_grgiprnt') }} AS quantity_gross_print,
    {{ decimal_conversion('min_rem_shelf') }} AS min_remaining_shelf,
    label_type,
    label_form,
    serial_no_explicitness_level,
    manufacturer_number,
    varbl_pur_ord_unit_is_active AS variable_purchase_order_unit_active,
    purchng_val_key AS purchasing_value_key,
    materqualdisckind AS material_quality_disc_kind,
    purchase_order_quantity_unit,
    manufacturer_part_profile,
    product_manufacturer_number,
    material_frieght_group,
    
    -- Audit fields
    created_by_user,
    {{ combine_datetime('creation_date', 'time_of_creation') }} AS creation_datetime,
    last_changed_by_user,
    {{ combine_datetime('last_change_date', 'last_change_date_time') }} AS last_change_datetime,
    
    -- Base unit and batch management
    base_unit,
    {{ boolean_string_conversion('in_is_batch_management_required') }} AS batch_management_required,
    
    -- Maintenance and origin
    maint_st AS maintenance_status,
    commodity,
    country_of_origin_material,
    product_description,
    
    -- Packaging and dimensions
    pckg_matertyp AS packaging_material_type,
    handling_unit_type,
    {{ decimal_conversion('unit_specific_product_length') }} AS unit_specific_product_length,
    {{ decimal_conversion('unit_specific_product_width') }} AS unit_specific_product_width,
    {{ decimal_conversion('unit_specific_product_height') }} AS unit_specific_product_height,
    product_measurement_unit,
    
    -- Soft delete indicator
    {{ soft_delete_conversion('in_is_marked_for_deletion') }} AS is_marked_for_deletion,
    
    -- ETL metadata
    CURRENT_TIMESTAMP AS etl_load_datetime

FROM {{ source('sap_source', 'product_master') }}