{% macro test_currency_codes() %}
    select *
    from {{ ref('wf_ff_at_z1_gl_account_fct_ff_at_z1_gl_account') }}
    where currency_code_document is null 
       or currency_code_local is null
       or length(currency_code_document) != 3
       or length(currency_code_local) != 3
{% endmacro %}

{% macro test_amount_consistency() %}
    select *
    from {{ ref('wf_ff_at_z1_gl_account_fct_ff_at_z1_gl_account') }}
    where (amount_in_document_currency is not null and currency_code_document is null)
       or (amount_in_local_currency is not null and currency_code_local is null)
{% endmacro %}