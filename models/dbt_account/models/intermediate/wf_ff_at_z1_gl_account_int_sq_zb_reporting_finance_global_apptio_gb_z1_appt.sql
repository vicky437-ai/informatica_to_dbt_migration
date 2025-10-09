-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Source Qualifier: sq_ZB_REPORTING_FINANCE_GLOBAL_APPTIO_GB_Z1_APPT
-- Applies source filtering and column selection for BW financial data

select 
    postingdateinthedocument,
    currencykey,
    costcenter,
    localcurrency,
    glaccountnumber,
    fiscalyear,
    fiscalperiod,
    purchasingdocumentnumber,
    accountingdocumentnumber,
    numoflineitemwithinaccountdoc,
    companycode,
    glaccountlongname,
    accountnumofvendororcreditor,
    supplierfullname,
    source_desc_long,
    invoice_reference,
    itemtext,
    wbs,
    projectdefinition,
    documenttype,
    amountinlocalcurrency,
    amountindocumentcurrency
from {{ ref('wf_ff_at_z1_gl_account_stg_zb_reporting_finance_global_apptio_gb_z1_appt') }}