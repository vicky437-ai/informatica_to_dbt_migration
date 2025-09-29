-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model with material characteristics lookups
select
    m.*,
    
    -- Material characteristic indicators using lookup macros
    {{ lookup_material_characteristic('m.product', 'DISPOSABLE_IND') }} as disposable_ind,
    {{ lookup_material_characteristic('m.product', 'EXPIRY_IND') }} as expiry_ind,
    {{ lookup_material_characteristic('m.product', 'STERILE_IND') }} as sterile_ind,
    {{ lookup_material_characteristic('m.product', 'SERIALIZED_IND') }} as serialized_ind,
    {{ lookup_material_characteristic('m.product', 'PVC_FREE_IND') }} as pvc_free_ind,
    {{ lookup_material_characteristic('m.product', 'DANGER_GOODS_IND') }} as danger_goods_ind,
    {{ lookup_material_characteristic('m.product', 'REWORK_IND') }} as rework_ind,
    {{ lookup_material_characteristic('m.product', 'HYP_CD') }} as hyp_cd,
    {{ lookup_material_characteristic('m.product', 'HYP_BRAND_DESC') }} as hyp_brand_desc,
    {{ lookup_material_characteristic('m.product', 'MTRL_THK_IND') }} as material_thickness_ind,
    {{ lookup_material_characteristic('m.product', 'MTRL_THK_UPR_LIMIT') }} as material_thickness_upper_limit,
    {{ lookup_material_characteristic('m.product', 'MTRL_THK_LWR_LIMIT') }} as material_thickness_lower_limit,
    {{ lookup_material_characteristic('m.product', 'MTRL_THK_MSRMT') }} as material_thickness_measurement,
    {{ lookup_material_characteristic('m.product', 'SHPNG_RSTRCTN') }} as shipping_restriction,
    {{ lookup_material_characteristic('m.product', 'SHPNG_TMPTR_CTRL_IND') }} as shipping_temperature_control_ind,
    {{ lookup_material_characteristic('m.product', 'SCRAP_ITM_IND') }} as scrap_item_ind,
    {{ lookup_material_characteristic('m.product', 'REBOX_WW_IND') }} as rebox_ww_ind

from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_with_english_descriptions') }} m