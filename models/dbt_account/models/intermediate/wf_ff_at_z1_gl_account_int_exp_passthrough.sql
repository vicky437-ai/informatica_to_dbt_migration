-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Expression: exp_PASSTHROUGH
-- Applies business logic transformations for data cleansing and formatting
-- Trims whitespace, removes quotes, and converts data types

select
    -- Carry forward all existing columns with transformations
    trim(postingdateinthedocument) as out_posting_date,
    trim(fiscalyear) as out_fiscal_year,
    trim(fiscalperiod) as out_fiscalperiod,
    trim(accountingdocumentnumber) as out_accountingdocumentnumber,
    trim(numoflineitemwithinaccountdoc) as out_numoflineitemwithinaccdoc,
    replace(trim(itemtext), '"', '') as out_itemtext,
    trim(glaccountnumber) as out_glaccountnumber,
    replace(trim(glaccountlongname), '"', '') as out_glaccountlongname,
    trim(costcenter) as out_costcenter,
    trim(companycode) as out_companycode,
    trim(accountnumofvendororcreditor) as out_accountnumofvendororcreditor,
    replace(trim(supplierfullname), '"', '') as out_supplierfullname,
    trim(purchasingdocumentnumber) as out_purchasingdocumentnumber,
    trim(invoice_reference) as out_invoice_reference,
    cast(round(amountindocumentcurrency, 3) as string) as out_amountindocumentcurrency,
    trim(currencykey) as out_currencykey,
    cast(round(amountinlocalcurrency, 3) as string) as out_amountinlocalcurrency,
    trim(localcurrency) as out_localcurrency,
    trim(source_desc_long) as out_source_desc_long,
    trim(projectdefinition) as out_projectdefinition,
    trim(wbs) as out_wbs,
    trim(documenttype) as out_documenttype
from {{ ref('wf_ff_at_z1_gl_account_int_sq_zb_reporting_finance_global_apptio_gb_z1_appt') }}