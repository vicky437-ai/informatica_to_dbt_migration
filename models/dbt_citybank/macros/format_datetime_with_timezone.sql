{% macro format_datetime_with_timezone(column_name) %}
    -- Macro to format datetime columns with timezone suffix
    -- Replicates Informatica expression: to_char(VALID_FROM,'YYYY-MM-DD HH24:MI:SS')||'.00'||' +0000'
    
    {% set datetime_format = var('datetime_format', 'YYYY-MM-DD HH24:MI:SS') %}
    {% set timezone_suffix = var('timezone_suffix', '.00 +0000') %}
    
    to_char({{ column_name }}, '{{ datetime_format }}') || '{{ timezone_suffix }}'
{% endmacro %}