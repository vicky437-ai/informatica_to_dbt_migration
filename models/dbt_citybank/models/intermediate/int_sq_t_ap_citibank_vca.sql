-- Source Qualifier: sq_T_AP_CITIBANK_VCA
-- Applies source filtering and column selection for Citibank VCA data

{{
    config(
        tags=['source_qualifier', 'citibank']
    )
}}

select 
    action_type,
    record_id,
    issuer_id,
    ica_nbr,
    bank_nbr,
    user_name,
    request_id,
    min_purchase_amt,
    max_purchase_amt,
    purchase_currency,
    purchase_type,
    v_card_alias,
    supplier_name,
    supplier_email,
    multi_use,
    valid_from,
    valid_to,
    valid_for,
    cdf_payment_number,
    cdf_payee_number,
    cdf_payment_amount,
    cdf_payment_date,
    cdf_payee_name,
    etl_load_dte
from {{ ref('stg_t_ap_citibank_vca') }}
-- Add any source-level filtering here if needed
-- where condition can be added based on business requirements