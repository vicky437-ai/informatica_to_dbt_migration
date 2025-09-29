-- Macro to format SAP date fields to YYYYMMDD string format
-- Replicates TO_CHAR(date_field, 'YYYYMMDD') from Informatica

{% macro format_sap_date(date_field) %}
    case 
        when {{ date_field }} is not null 
        then to_char({{ date_field }}, '{{ var("sap_date_format") }}')
        else null 
    end
{% endmacro %}