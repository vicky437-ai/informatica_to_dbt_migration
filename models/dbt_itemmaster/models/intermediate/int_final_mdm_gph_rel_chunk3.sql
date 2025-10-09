-- Intermediate: Final processing for MDM_GPH_REL
-- Prepares data for the MDM product group hierarchy dimension

select
    product_grp_desc,
    product_grp_cd,
    market_seg_desc,
    market_seg_cd,
    product_tp_desc,
    product_tp_cd,
    product_cat_desc,
    product_cat_cd,
    brand_gen_desc,
    brand_gen_cd,
    brand_sales_rpting_desc,
    brand_sales_rpting_cd,
    item_family_desc,
    item_family_cd,
    lvl_7_cd
from {{ ref('int_previous_transformation') }}
-- Note: This should reference the actual last transformation in the chain from previous chunks