-- Expression: exp_SET_COLUMNS
-- Applies business logic transformations including date formatting and filename generation

{{
    config(
        tags=['expression', 'date_formatting', 'filename_generation']
    )
}}

select
    -- Pass through all existing columns
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
    valid_for,
    cdf_payment_number,
    cdf_payee_number,
    cdf_payment_amount,
    cdf_payment_date,
    cdf_payee_name,
    
    -- Transform date fields to required format with timezone
    {{ format_datetime_with_timezone('valid_from') }} as out_valid_from,
    {{ format_datetime_with_timezone('valid_to') }} as out_valid_to,
    
    -- Generate dynamic filename with timestamp
    {{ generate_citibank_filename() }} as out_file_name,
    
    etl_load_dte
from {{ ref('int_sq_t_ap_citibank_vca') }}