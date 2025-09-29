-- Macro to format datetime with timezone suffix
-- Replicates Informatica expression: to_char(VALID_FROM,'YYYY-MM-DD HH24:MI:SS')||'.00'||' +0000'

{% macro format_datetime_with_timezone(date_column) %}
    to_char({{ date_column }}, '{{ var("default_date_format") }}') || '{{ var("timezone_suffix") }}'
{% endmacro %}