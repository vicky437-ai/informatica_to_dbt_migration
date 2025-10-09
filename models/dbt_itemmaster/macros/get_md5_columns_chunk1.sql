{% macro get_md5_columns(start_col=1, end_col=200) %}
  {#- 
    Macro: get_md5_columns
    Description: Generates a list of column names from COL_1 to COL_200
    Used for MD5 hash calculation
    
    Parameters:
    - start_col: starting column number (default: 1)
    - end_col: ending column number (default: 200)
  -#}
  
  {% set columns = [] %}
  {% for i in range(start_col, end_col + 1) %}
    {% do columns.append('COL_' ~ i) %}
  {% endfor %}
  
  {{ return(columns) }}
  
{% endmacro %}