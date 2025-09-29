-- Macro to trim journal fields consistently
-- Used in exp_TRIM transformations

{% macro trim_journal_fields(field_list) %}
    {% for field in field_list %}
        trim({{ field }}) as {{ field }}
        {%- if not loop.last -%},{%- endif %}
    {% endfor %}
{% endmacro %}