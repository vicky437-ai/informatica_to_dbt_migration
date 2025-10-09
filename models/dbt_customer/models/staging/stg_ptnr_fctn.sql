-- Staging model for partner function data
-- Source: STG_MDG_CUST.PTNR_FCTN

select
    cust_nbr,
    sales_org_id,
    dstrbtn_chnl,
    division,
    ptnr_fctn_id,
    ptnr_cntr,
    dflt_ptnr,
    ptnr_desc,
    ptnr_cust_nbr,
    vend_acct_nbr,
    cntct_prsn_nbr,
    prsnl_nbr,
    etl_load_dt

from {{ source('stg_mdg_cust', 'ptnr_fctn') }}