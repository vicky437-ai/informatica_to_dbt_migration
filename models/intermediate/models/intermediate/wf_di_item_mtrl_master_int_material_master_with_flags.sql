-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model to determine insert/update flags
-- Simulates the logic from exp_Insert_Update_Flag transformation

with enriched_data as (
    select * from {{ ref('wf_di_item_mtrl_master_int_material_master_enriched') }}
),

-- Simulate MD5 hash comparison for change detection
with_change_detection as (
    select
        *,
        -- Generate source MD5 hash from key fields
        md5(concat_ws('|',
            coalesce(product, ''),
            coalesce(product_description, ''),
            coalesce(base_unit, ''),
            coalesce(cast(net_weight as string), ''),
            coalesce(cast(gross_weight as string), ''),
            coalesce(last_changed_by_user, ''),
            coalesce(cast(last_change_date_time as string), '')
        )) as src_md5,
        
        -- Simulate target lookup (would be actual lookup in real implementation)
        null as tgt_md5,
        null as existing_product,
        
        -- Determine insert/update flag
        case 
            when existing_product is null then 'I'  -- Insert
            when src_md5 != coalesce(tgt_md5, '') then 'U'  -- Update
            else 'E'  -- Exists (no change)
        end as insert_update_flag
        
    from enriched_data
)

select * from with_change_detection