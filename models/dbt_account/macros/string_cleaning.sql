{% macro clean_string_field(field_name) %}
    trim(replace({{ field_name }}, '"', ''))
{% endmacro %}

{% macro format_amount(amount_field, precision=3) %}
    cast(round({{ amount_field }}, {{ precision }}) as string)
{% endmacro %}