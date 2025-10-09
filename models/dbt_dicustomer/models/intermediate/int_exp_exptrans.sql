-- Expression: exp_EXPTRANS
-- Applies initial business logic transformations

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
    -- Transform central order block logic
    case 
        when central_ordr_blk = '01' or central_ordr_blk = 'ZB' then 'I'
        when central_ordr_blk is null then 'A'
        else central_ordr_blk
    end as o_central_ordr_blk
from {{ ref('int_sq_customer') }}