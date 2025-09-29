-- Macro to combine separate date and time fields into datetime
{% macro combine_date_time(date_field, time_field) %}
    case 
        when {{ date_field }} is not null then
            to_timestamp(
                substr(cast({{ date_field }} as string), 1, 10) || ' ' || 
                substr(cast({{ time_field }} as string), 12, 8),
                'YYYY-MM-DD HH24:MI:SS'
            )
        else null
    end
{% endmacro %}