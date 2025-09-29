{% macro combine_datetime(date_field, time_field) %}
    -- Combine separate date and time fields into datetime
    CASE 
        WHEN {{ date_field }} IS NOT NULL THEN
            CAST(
                CONCAT(
                    DATE_FORMAT({{ date_field }}, '%Y-%m-%d'),
                    ' ',
                    TIME_FORMAT({{ time_field }}, '%H:%i:%s')
                ) AS DATETIME
            )
        ELSE NULL
    END
{% endmacro %}