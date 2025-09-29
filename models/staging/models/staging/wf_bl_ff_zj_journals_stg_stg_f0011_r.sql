-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Staging for F0011 Address Book Master (R pipeline)
select
    aban8 as address_number,
    trim(abalph) as alphabetic_name,
    trim(abac01) as category_code_01,
    trim(abac02) as category_code_02,
    trim(abac03) as category_code_03,
    trim(abac04) as category_code_04,
    trim(abac05) as category_code_05,
    trim(abac06) as category_code_06,
    trim(abac07) as category_code_07,
    trim(abac08) as category_code_08,
    trim(abac09) as category_code_09,
    trim(abac10) as category_code_10,
    concat_ws('|', 
        nullif(trim(abac01), ''),
        nullif(trim(abac02), ''),
        nullif(trim(abac03), ''),
        nullif(trim(abac04), ''),
        nullif(trim(abac05), ''),
        nullif(trim(abac06), ''),
        nullif(trim(abac07), ''),
        nullif(trim(abac08), ''),
        nullif(trim(abac09), ''),
        nullif(trim(abac10), '')
    ) as category_codes
from {{ source('zj_system', 'f0011') }}