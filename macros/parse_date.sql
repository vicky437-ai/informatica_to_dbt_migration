-- Macro for parsing date strings to date format
-- General utility for date conversions

{% macro parse_date(date_column, format_string='YYYY-MM-DD') %}
    to_date({{ date_column }}, '{{ format_string }}')
{% endmacro %}