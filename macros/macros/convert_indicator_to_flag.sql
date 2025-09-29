-- Macro to convert small integer indicators to Y/N flags
-- Used for various indicator fields

{% macro convert_indicator_to_flag(indicator_field) %}
    case 
        when {{ indicator_field }} = 1 then 'Y'
        when {{ indicator_field }} = 0 then 'N'
        else null
    end
{% endmacro %}