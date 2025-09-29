-- Macro to clean text fields by removing double quotes
-- Replicates REPLACESTR(1,field,CHR(34),NULL) from Informatica

{% macro clean_text_field(field_name, max_length=null) %}
    {% if max_length %}
        left(replace({{ field_name }}, '"', ''), {{ max_length }})
    {% else %}
        replace({{ field_name }}, '"', '')
    {% endif %}
{% endmacro %}