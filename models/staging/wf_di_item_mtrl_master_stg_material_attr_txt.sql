-- Model: models/staging/wf_di_item_mtrl_master_stg_material_attr_txt.sql
-- Merged from 2 chunks

{{ config(
    materialized='view',
    tags=['staging', 'material_master']
) }}

select
        -- Core material fields
        material_number,
        language_key,
        material_description,
        material_type,
        base_unit_of_measure,
        material_group,
        plant,
        storage_location,
        
        -- Audit fields
        created_date,
        created_by,
        changed_date,
        changed_by,
        
        -- ETL metadata
        current_timestamp as load_timestamp,
        '{{ invocation_id }}' as batch_id
        
    from {{ source('xml_source', 'material_attr_txt') }}
    
    -- Basic data quality filters
    where material_number is not null
      and trim(material_number) != ''
)

select * from source_data