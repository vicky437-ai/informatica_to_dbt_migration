{% macro generate_md5_hash(columns, null_replacement='col_') %}
  {#- 
    Macro: generate_md5_hash
    Description: Calculates MD5 hash by concatenating up to 200 columns
    Replaces NULL values with 'col_n' where n is the column position
    
    Parameters:
    - columns: list of column names to include in hash
    - null_replacement: prefix for null replacement (default: 'col_')
  -#}
  
  {% set concat_parts = [] %}
  
  {% for column in columns %}
    {% set col_index = loop.index %}
    {% set null_value = null_replacement ~ col_index %}
    {% set coalesce_expr = "coalesce(cast(" ~ column ~ " as string), '" ~ null_value ~ "')" %}
    {% do concat_parts.append(coalesce_expr) %}
  {% endfor %}
  
  md5({{ concat_parts | join(' || ') }})
  
{% endmacro %}