-- Source: wf_FF_AT_Z1_GL_ACCOUNT.XML
-- Staging model for GL Account data from BW source
-- Source: ZB_REPORTING.FINANCE.GLOBAL.APPTIO/GB_Z1_APPT1

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

from {{ source('gbi', 'gb_z1_appt1') }}