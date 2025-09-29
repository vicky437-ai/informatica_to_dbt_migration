-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Consolidate all material indicator flags into structured format
select
    product,
    
    -- Safety and compliance flags
    case when hazardmatnum is not null and hazardmatnum != '' then true else false end as danger_goods_ind,
    indi_in_bulk_liquid as bulk_liquid_ind,
    indi_highly_viscous as highly_viscous_ind,
    envrmnt_relevant as environment_relevant_ind,
    
    -- Material characteristics from connectors
    coalesce({{ extract_flag('DEHP_FREE_IND') }}, false) as dehp_free_ind,
    coalesce({{ extract_flag('MERCURY_FREE_IND') }}, false) as mercury_free_ind,
    coalesce({{ extract_flag('LATEX_IND') }}, false) as latex_ind,
    coalesce({{ extract_flag('PVC_FREE_IND') }}, false) as pvc_free_ind,
    coalesce({{ extract_flag('CE_MARK_IND') }}, false) as ce_mark_ind,
    coalesce({{ extract_flag('STERILE_IND') }}, false) as sterile_ind,
    coalesce({{ extract_flag('DISPOSABLE_IND') }}, false) as disposable_ind,
    coalesce({{ extract_flag('SERIALIZED_IND') }}, false) as serialized_ind,
    coalesce({{ extract_flag('EXPIRY_IND') }}, false) as expiry_ind,
    coalesce({{ extract_flag('REWORK_IND') }}, false) as rework_ind,
    coalesce({{ extract_flag('SCRAP_ITM_IND') }}, false) as scrap_item_ind,
    coalesce({{ extract_flag('INSTRMNT_IND') }}, false) as instrument_ind,
    coalesce({{ extract_flag('HAZARDOUS_IND') }}, false) as hazardous_ind,
    
    -- Shipping and handling flags
    coalesce({{ extract_flag('SHPNG_RSTRCTN') }}, false) as shipping_restriction_ind,
    coalesce({{ extract_flag('SHPNG_TMPTR_CTRL_IND') }}, false) as shipping_temp_control_ind,
    coalesce({{ extract_flag('REBOX_NW_IND') }}, false) as rebox_nw_ind,
    coalesce({{ extract_flag('REBOX_WW_IND') }}, false) as rebox_ww_ind,
    
    -- Material thickness indicators
    coalesce({{ extract_flag('MTRL_THK_IND') }}, false) as material_thickness_ind,
    
    -- PTO (Plan to Order) flags
    coalesce({{ extract_flag('PTO_RELEVANT') }}, false) as pto_relevant_ind,
    
    -- Quality management
    is_batch_management_required,
    approved_batch_rec_req,
    
    -- Status flags
    is_marked_for_deletion,
    
    current_timestamp as flags_processed_at
    
from {{ ref('wf_di_item_mtrl_master_stg_material_attr_txt') }}