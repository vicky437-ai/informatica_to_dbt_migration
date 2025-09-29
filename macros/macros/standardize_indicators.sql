-- Macro to standardize indicator fields
-- Converts various indicator formats to consistent Y/N

{% macro standardize_indicators(indicator_column) %}
    case
        when upper(trim({{ indicator_column }})) in ('X', '1', 'TRUE', 'YES', 'Y') then 'Y'
        when upper(trim({{ indicator_column }})) in ('', '0', 'FALSE', 'NO', 'N') then 'N'
        else 'N'
    end
{% endmacro %}