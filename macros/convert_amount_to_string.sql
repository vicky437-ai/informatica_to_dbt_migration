-- Macro for converting decimal amounts to string format
-- Replicates TO_CHAR(TO_DECIMAL(amount,3)) functionality

{% macro convert_amount_to_string(column_name) %}
    cast({{ column_name }} as string)
{% endmacro %}