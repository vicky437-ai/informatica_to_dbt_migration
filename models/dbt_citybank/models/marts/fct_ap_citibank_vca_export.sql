-- Mart: FF_AP_CITIBANK_VCA (Flat file export)
-- Final analytical data ready for consumption and file export
-- Data flow: stg_t_ap_citibank_vca -> int_sq_t_ap_citibank_vca -> int_exp_set_columns -> fct_ap_citibank_vca_export

{{
    config(
        materialized='table',
        tags=['ap', 'citibank', 'export', 'flatfile']
    )
}}

select
    -- Map to target field names as defined in the flat file target
    action_type as action_type,
    record_id as record_id,
    issuer_id as issuer_id,
    ica_nbr as ica_number,
    bank_nbr as bank_number,
    user_name as user_name,
    request_id as request_id,
    min_purchase_amt as min_purchase_amount,
    max_purchase_amt as max_purchase_amount,
    purchase_currency as purchase_currency,
    purchase_type as purchase_type,
    v_card_alias as v_card_alias,
    supplier_name as supplier_name,
    supplier_email as supplier_email,
    multi_use as multi_use,
    out_valid_from as valid_from,
    out_valid_to as valid_to,
    valid_for as valid_for,
    cdf_payment_number as cdf_payment_number,
    cdf_payee_number as cdf_payee_number,
    cdf_payment_amount as cdf_payment_amount,
    cdf_payment_date as cdf_payment_date,
    cdf_payee_name as cdf_payee_name,
    out_file_name as file_name,
    current_timestamp() as loaded_at
from {{ ref('int_exp_set_columns') }}