-- Macro to generate Citibank VCA filename with timestamp
-- Replicates Informatica expression: 'ZIMMERVCAI_FPCRULX_US_'||TO_CHAR(SYSDATE,'YYYYMMDD')||'_'||TO_CHAR(SYSDATE,'HHMISS')||'.csv'

{% macro generate_citibank_filename() %}
    'ZIMMERVCAI_FPCRULX_US_' || 
    to_char(current_timestamp, 'YYYYMMDD') || 
    '_' || 
    to_char(current_timestamp, 'HH24MISS') || 
    '.csv'
{% endmacro %}