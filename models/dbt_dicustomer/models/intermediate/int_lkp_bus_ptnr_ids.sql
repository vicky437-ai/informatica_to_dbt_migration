-- Lookup: lkp_BUS_PTNR_IDS
-- Enriches customer data with business partner ID information

select
    a.*,
    b.bus_ptnr_nbr,
    b.bus_id_tp,
    b.bus_id_nbr,
    b.etl_load_dt as lookup_etl_load_dt
from {{ ref('int_exp_exptrans') }} a
left join {{ source('stg_mdg_cust', 'bus_ptnr_ids') }} b
    on a.cust_nbr = b.bus_ptnr_nbr