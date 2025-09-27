
-- Informatica Pattern Macros for DBT

{% macro boolean_to_string(column_name, true_value='TRUE', false_value='FALSE') %}
  CASE 
    WHEN {{ column_name }} = 1 THEN '{{ true_value }}'
    WHEN {{ column_name }} = 0 THEN '{{ false_value }}'
    WHEN {{ column_name }} = true THEN '{{ true_value }}'
    WHEN {{ column_name }} = false THEN '{{ false_value }}'
    WHEN {{ column_name }} IS NULL THEN NULL
    ELSE CAST({{ column_name }} AS VARCHAR)
  END
{% endmacro %}

{% macro soft_delete_conversion(column_name) %}
  CASE 
    WHEN {{ column_name }} = 1 THEN 'Y'
    WHEN {{ column_name }} = 'X' THEN 'Y'
    WHEN {{ column_name }} = true THEN 'Y'
    WHEN {{ column_name }} = 0 THEN 'N'
    WHEN {{ column_name }} = false THEN 'N'
    WHEN {{ column_name }} IS NULL THEN 'N'
    ELSE 'N'
  END
{% endmacro %}

{% macro generate_md5_hash(columns) %}
  MD5(
    CONCAT_WS('|',
      {%- for column in columns -%}
        COALESCE(CAST({{ column }} AS VARCHAR), '')
        {%- if not loop.last -%},{%- endif -%}
      {%- endfor -%}
    )
  )
{% endmacro %}

{% macro generate_surrogate_key(fields) %}
  {{ dbt_utils.generate_surrogate_key(fields) }}
{% endmacro %}

{% macro informatica_lookup(lookup_table, lookup_key, return_field, default_value='NULL') %}
  COALESCE(
    (SELECT {{ return_field }} 
     FROM {{ ref(lookup_table) }} 
     WHERE {{ lookup_key }}
     LIMIT 1),
    {{ default_value }}
  )
{% endmacro %}

{% macro update_strategy(strategy_field) %}
  CASE 
    WHEN {{ strategy_field }} = 'DD_INSERT' THEN 'insert'
    WHEN {{ strategy_field }} = 'DD_UPDATE' THEN 'update'
    WHEN {{ strategy_field }} = 'DD_DELETE' THEN 'delete'
    ELSE 'ignore'
  END
{% endmacro %}

{% macro iif(condition, true_value, false_value) %}
  CASE 
    WHEN {{ condition }} THEN {{ true_value }}
    ELSE {{ false_value }}
  END
{% endmacro %}

{% macro decode(expression, search_values, result_values, default_value='NULL') %}
  CASE {{ expression }}
    {%- for i in range(search_values|length) %}
    WHEN {{ search_values[i] }} THEN {{ result_values[i] }}
    {%- endfor %}
    ELSE {{ default_value }}
  END
{% endmacro %}

{% macro nvl(column_name, replacement_value='0') %}
  COALESCE({{ column_name }}, {{ replacement_value }})
{% endmacro %}

{% macro boolean_to_string(column_name) %}
  {{ cast_boolean_to_string(column_name) }}
{% endmacro %}
