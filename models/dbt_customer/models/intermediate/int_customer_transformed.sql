-- Intermediate model applying business transformation logic
-- Replicates Expression transformation logic from Informatica

select
    cust_nbr,
    attribute_9,
    name_1,
    city,
    region_key,
    po_cd,
    strt_1,
    strt_2,
    strt_3,
    ptnr_cust_nbr,
    central_ordr_blk,
    
    -- Business logic for central order block transformation
    {{ transform_order_block('central_ordr_blk') }} as transformed_order_block

from {{ ref('int_customer_joined') }}