-- Source: wf_AP_FF_CITIBANK_VCA.XML
-- Intermediate model for Citibank VCA with formatted dates and file naming
-- Applies transformations from exp_SET_COLUMNS

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
    
    -- Format valid_from date using macro
    {{ format_datetime_with_timezone('valid_from') }} as out_valid_from,
    
    -- Format valid_to date using macro
    {{ format_datetime_with_timezone('valid_to') }} as out_valid_to,
    
    valid_for,
    cdf_payment_number,
    cdf_payee_number,
    cdf_payment_amount,
    cdf_payment_date,
    cdf_payee_name,
    
    -- Generate output filename with timestamp
    {{ generate_citibank_filename() }} as out_file_name,
    
    etl_load_dte

from {{ ref('wf_ap_ff_citibank_vca_stg_t_ap_citibank_vca') }}