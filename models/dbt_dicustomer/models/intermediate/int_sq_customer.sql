-- Source Qualifier: sq_CUSTOMER
-- Combines customer data from multiple source tables
-- Applies source filtering and column selection

select 
    cm.cust_nbr,
    cm.attribute_9,
    ca.name_1,
    ca.city,
    ca.region_key,
    ca.po_cd,
    ca.strt_1,
    ca.strt_2,
    ca.strt_3,
    pf.ptnr_cust_nbr,
    cm.central_ordr_blk
from {{ ref('stg_cust_master') }} cm
inner join {{ ref('stg_cust_adrs') }} ca
    on cm.cust_nbr = ca.cust_nbr
inner join {{ ref('stg_ptnr_fctn') }} pf
    on cm.cust_nbr = pf.cust_nbr