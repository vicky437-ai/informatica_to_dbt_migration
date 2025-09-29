-- Source: wf_AP_FF_CITIBANK_VCA.XML
-- REQUIRED mart for target: FF_AP_CITIBANK_VCA
-- Target type: FlatFile
-- Fact table for Citibank VCA flat file export

select
    action_type as actiontype,
    record_id as recordid,
    issuer_id as issuerid,
    ica_nbr as icanumber,
    bank_nbr as banknumber,
    user_name as username,
    request_id as requestid,
    min_purchase_amt as minpurchaseamount,
    max_purchase_amt as maxpurchaseamount,
    purchase_currency as purchasecurrency,
    purchase_type as purchasetype,
    v_card_alias as vcardalias,
    supplier_name as suppliername,
    supplier_email as supplieremail,
    multi_use as multiuse,
    out_valid_from as validfrom,
    out_valid_to as validto,
    valid_for as validfor,
    cdf_payment_number as cdf_paymentnumber,
    cdf_payee_number as cdf_payeenumber,
    cdf_payment_amount as cdf_paymentamount,
    cdf_payment_date as cdf_paymentdate,
    cdf_payee_name as cdf_payeename,
    out_file_name as filename,
    current_timestamp as export_timestamp

from {{ ref('wf_ap_ff_citibank_vca_int_citibank_vca_formatted') }}