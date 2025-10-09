-- Intermediate model joining customer master, partner function, and address data
-- Replicates the Source Qualifier join logic from Informatica

select
    pf.ptnr_cust_nbr as cust_nbr,
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

from {{ ref('stg_ptnr_fctn') }} pf
inner join {{ ref('stg_cust_master') }} cm
    on pf.cust_nbr = cm.cust_nbr
inner join {{ ref('stg_cust_adrs') }} ca
    on cm.cust_nbr = ca.cust_nbr