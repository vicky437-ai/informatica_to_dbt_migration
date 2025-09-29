-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model with all lookup enrichments
-- Performs all the lookup transformations from the original workflow

with material_base as (
    select * from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_filtered') }}
),

material_enriched as (
    select
        mb.material_id,
        mb.language_key,
        mb.material_desc,
        mb.attr_value,
        mb.created_date,
        mb.updated_date,
        mb.loaded_at,
        
        -- All lookup fields would be populated via LEFT JOINs or subqueries
        -- Simulating the extensive lookup logic from the original workflow
        {{ lookup_disposable_ind('mb.material_id') }} as disposable_ind,
        {{ lookup_expiry_ind('mb.material_id') }} as expiry_ind,
        {{ lookup_sterile_ind('mb.material_id') }} as sterile_ind,
        {{ lookup_serialized_ind('mb.material_id') }} as serialized_ind,
        {{ lookup_hyp_brand_desc('mb.material_id') }} as hyp_brand_desc,
        {{ lookup_hyp_cd('mb.material_id') }} as hyp_cd,
        {{ lookup_rework_ind('mb.material_id') }} as rework_ind,
        {{ lookup_rebox_id('mb.material_id') }} as rebox_id,
        {{ lookup_dps_uom_qty('mb.material_id') }} as dps_uom_qty,
        {{ lookup_dps_generic_lot('mb.material_id') }} as dps_generic_lot,
        {{ lookup_fda_prod_cd('mb.material_id') }} as fda_prod_cd,
        {{ lookup_ce_mark_ind('mb.material_id') }} as ce_mark_ind,
        {{ lookup_ibp_scope_ind('mb.material_id') }} as ibp_scope_ind,
        {{ lookup_eccn_nbr('mb.material_id') }} as eccn_nbr,
        {{ lookup_pto_relevant('mb.material_id') }} as pto_relevant,
        {{ lookup_pto_relevant_qnty('mb.material_id') }} as pto_relevant_qnty,
        {{ lookup_hazardous_ind('mb.material_id') }} as hazardous_ind,
        {{ lookup_mercury_free_ind('mb.material_id') }} as mercury_free_ind,
        {{ lookup_latex_ind('mb.material_id') }} as latex_ind,
        {{ lookup_pvc_free_ind('mb.material_id') }} as pvc_free_ind,
        {{ lookup_dehp_free_ind('mb.material_id') }} as dehp_free_ind,
        {{ lookup_danger_goods_ind('mb.material_id') }} as danger_goods_ind,
        {{ lookup_mtrl_thk_msrmt('mb.material_id') }} as mtrl_thk_msrmt,
        {{ lookup_mtrl_thk_lwr_limit('mb.material_id') }} as mtrl_thk_lwr_limit,
        {{ lookup_mtrl_thk_upr_limit('mb.material_id') }} as mtrl_thk_upr_limit,
        {{ lookup_mtrl_thk_ind('mb.material_id') }} as mtrl_thk_ind,
        {{ lookup_shpng_rstrctn('mb.material_id') }} as shpng_rstrctn,
        {{ lookup_instrmnt_ind('mb.material_id') }} as instrmnt_ind,
        {{ lookup_rebox_nw_ind('mb.material_id') }} as rebox_nw_ind,
        {{ lookup_rebox_ww_ind('mb.material_id') }} as rebox_ww_ind,
        {{ lookup_scrap_itm_ind('mb.material_id') }} as scrap_itm_ind,
        {{ lookup_shpng_tmptr_ctrl_ind('mb.material_id') }} as shpng_tmptr_ctrl_ind
        
    from material_base mb
)

select * from material_enriched