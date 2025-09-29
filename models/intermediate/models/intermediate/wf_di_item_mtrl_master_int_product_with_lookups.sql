-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model combining product data with characteristic lookups
-- Applies all lookup transformations from the Informatica workflow

with product_base as (
    select * from {{ ref('models/staging/wf_di_item_mtrl_master_stg_product_type_data') }}
),

product_with_characteristics as (
    select
        p.*,
        -- Lookup transformations using macro
        {{ lookup_characteristic('stg_lookup_disposable_ind', 'p.product', "'N'") }} as disposable_ind,
        {{ lookup_characteristic('stg_lookup_expiry_ind', 'p.product', "'N'") }} as expiry_ind,
        {{ lookup_characteristic('stg_lookup_sterile_ind', 'p.product', "'N'") }} as sterile_ind,
        {{ lookup_characteristic('stg_lookup_serialized_ind', 'p.product', "'N'") }} as serialized_ind,
        {{ lookup_characteristic('stg_lookup_pvc_free_ind', 'p.product') }} as pvc_free_ind,
        {{ lookup_characteristic('stg_lookup_rework_ind', 'p.product') }} as rework_ind,
        {{ lookup_characteristic('stg_lookup_hyp_cd', 'p.product') }} as hyp_cd,
        {{ lookup_characteristic('stg_lookup_hyp_brand_desc', 'p.product') }} as hyp_brand_desc,
        {{ lookup_characteristic('stg_lookup_danger_goods_ind', 'p.product', "'N'") }} as danger_goods_ind,
        {{ lookup_characteristic('stg_lookup_mtrl_thk_ind', 'p.product') }} as mtrl_thk_ind,
        
        -- Convert indicator fields to flags
        {{ convert_indicator_to_flag('p.cad_indicator') }} as cad_indicator_flag,
        {{ convert_indicator_to_flag('p.envrmt_relevant') }} as envrmt_relevant_flag,
        {{ convert_indicator_to_flag('p.indi_highly_viscous') }} as indi_highly_viscous_flag,
        {{ convert_indicator_to_flag('p.indi_in_bulk_liquid') }} as indi_in_bulk_liquid_flag,
        {{ convert_indicator_to_flag('p.approved_batch_rec_req') }} as approved_batch_rec_req_flag,
        
        -- Date/time transformations
        cast(p.time_of_creation as timestamp) as creation_datetime,
        cast(p.cross_plant_status_validity_date as timestamp) as last_change_datetime
        
    from product_base p
)

select * from product_with_characteristics