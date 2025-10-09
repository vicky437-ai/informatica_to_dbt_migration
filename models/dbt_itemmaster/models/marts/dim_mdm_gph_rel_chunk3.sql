-- Mart: MDM_GPH_REL
-- Final dimensional data for product group hierarchy relationships
-- Data flow: Sources -> Transformations -> dim_mdm_gph_rel

{{
    config(
        materialized='table',
        tags=['itemmaster', 'mart', 'dimension']
    )
}}

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
    lvl_7_cd,
    current_timestamp() as etl_load_dt
from {{ ref('int_final_mdm_gph_rel') }}