{% macro jde_amount_conversion(amount_field, implied_decimals=2) %}
    -- Macro to convert JDE amounts with implied decimals
    case 
        when {{ amount_field }} is null then 0
        else {{ amount_field }} / power(10, {{ implied_decimals }})
    end
{% endmacro %}