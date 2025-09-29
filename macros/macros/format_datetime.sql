-- Macro for consistent datetime formatting
-- Handles various datetime formats from source systems

{% macro format_datetime(datetime_column) %}
    case
        when {{ datetime_column }} is not null then
            cast({{ datetime_column }} as timestamp)
        else null
    end
{% endmacro %}