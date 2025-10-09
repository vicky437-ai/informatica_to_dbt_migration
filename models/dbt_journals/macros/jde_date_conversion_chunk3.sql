{% macro jde_date_conversion(julian_date_field) %}
    -- Macro to convert JDE Julian dates to standard dates
    -- JDE uses a modified Julian date format starting from 1900-01-01
    case 
        when {{ julian_date_field }} = 0 then null
        when {{ julian_date_field }} < 1000000 then 
            date_add('1900-01-01', interval {{ julian_date_field }} - 1 day)
        else 
            -- Handle century dates (1YYDDD format)
            date_add(
                date(concat('20', substr(cast({{ julian_date_field }} as string), 2, 2), '-01-01')), 
                interval cast(substr(cast({{ julian_date_field }} as string), 4, 3)) - 1 day
            )
    end
{% endmacro %}