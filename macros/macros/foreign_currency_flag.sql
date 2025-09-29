{% macro foreign_currency_flag(currency_field) %}
    case 
        when {{ currency_field }} is not null and {{ currency_field }} != 'USD' 
        then 'Y' 
        else 'N' 
    end
{% endmacro %}