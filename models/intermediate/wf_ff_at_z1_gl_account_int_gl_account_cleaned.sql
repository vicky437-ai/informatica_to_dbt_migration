-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Intermediate model applying data cleaning transformations
-- Replicates the exp_PASSTHROUGH transformation logic

select
    -- Apply trim and clean transformations using macros
    {{ clean_and_trim('postingdateinthedocument') }} as posting_date,
    {{ clean_and_trim('fiscalyear') }} as fiscal_year,
    {{ clean_and_trim('fiscalperiod') }} as fiscal_period,
    {{ clean_and_trim('accountingdocumentnumber') }} as doc_num,
    {{ clean_and_trim('numoflineitemwithinaccountdoc') }} as doc_line,
    
    -- Clean text fields by removing quotes
    {{ clean_text_field('itemtext') }} as journal_line_description,
    
    {{ clean_and_trim('glaccountnumber') }} as account,
    {{ clean_text_field('glaccountlongname') }} as account_description,
    {{ clean_and_trim('costcenter') }} as cost_center,
    {{ clean_and_trim('companycode') }} as company_code,
    {{ clean_and_trim('accountnumofvendororcreditor') }} as vendor_id,
    
    -- Clean supplier name
    {{ clean_text_field('supplierfullname') }} as vendor_name,
    
    {{ clean_and_trim('purchasingdocumentnumber') }} as purchase_order,
    {{ clean_and_trim('invoice_reference') }} as invoice,
    
    -- Convert amounts to string with proper decimal handling
    {{ convert_amount_to_string('amountindocumentcurrency') }} as amount_in_document_currency,
    {{ clean_and_trim('currencykey') }} as currency_code_document,
    {{ convert_amount_to_string('amountinlocalcurrency') }} as amount_in_local_currency,
    {{ clean_and_trim('localcurrency') }} as currency_code_local,
    {{ clean_and_trim('source_desc_long') }} as source_erp,
    {{ clean_and_trim('wbs') }} as wbs,
    {{ clean_and_trim('projectdefinition') }} as project_definition,
    {{ clean_and_trim('documenttype') }} as document_type,
    
    -- Pass through fields
    debitcreditindicator

from {{ ref('wf_ff_at_z1_gl_account_stg_gbi__gb_z1_appt1') }}