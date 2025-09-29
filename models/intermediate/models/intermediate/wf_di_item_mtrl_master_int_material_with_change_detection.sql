-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model with change detection logic
-- Determines insert vs update strategy based on existing records

with enriched_material as (
    select * from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_with_lookups') }}
),

existing_records as (
    select * from {{ ref('models/staging/wf_di_item_mtrl_master_stg_mtrl_master_lookup') }}
),

material_with_flags as (
    select
        em.*,
        er.material_id as existing_material_id,
        er.record_hash as existing_hash,
        
        -- Generate MD5 hash for change detection
        {{ generate_md5_hash([
            'em.material_id',
            'em.material_desc',
            'em.disposable_ind',
            'em.expiry_ind',
            'em.sterile_ind',
            'em.serialized_ind'
        ]) }} as new_record_hash,
        
        -- Determine operation type
        case
            when er.material_id is null then 'INSERT'
            when er.record_hash != {{ generate_md5_hash([
                'em.material_id',
                'em.material_desc',
                'em.disposable_ind',
                'em.expiry_ind',
                'em.sterile_ind',
                'em.serialized_ind'
            ]) }} then 'UPDATE'
            else 'NO_CHANGE'
        end as operation_type
        
    from enriched_material em
    left join existing_records er
        on em.material_id = er.material_id
)

select * from material_with_flags
where operation_type in ('INSERT', 'UPDATE')