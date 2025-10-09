-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Staging: ZB_REPORTING_FINANCE_GLOBAL_APPTIO_GB_Z1_APPT
-- Source: GBI._SYS_BIC.ZB_REPORTING_FINANCE_GLOBAL_APPTIO_GB_Z1_APPT
-- Raw data from BW datasource for GL Account reporting

select
    postingdateinthedocument,
    costcenter,
    localcurrency,
    glaccountnumber,
    fiscalyear,
    purchasingdocumentnumber,
    accountingdocumentnumber,
    numoflineitemwithinaccountdoc,
    companycode,
    glaccountlongname,
    accountnumofvendororcreditor,
    supplierfullname,
    debitcreditindicator,
    invoice_reference,
    itemtext,
    currencykey,
    projectdefinition,
    wbs,
    documenttype,
    source_desc_long,
    fiscalperiod,
    amountinlocalcurrency,
    amountindocumentcurrency,
    amount_dc,
    amount_lc
from {{ source('gbi_system', 'zb_reporting_finance_global_apptio_gb_z1_appt') }}