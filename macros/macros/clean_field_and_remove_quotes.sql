-- Macro to clean fields by trimming whitespace and removing double quotes
-- Replicates the Informatica expression logic: IIF(ISNULL(LTRIM(RTRIM(field))),'',REPLACESTR(1,field,'"',''))

{% macro clean_field_and_remove_quotes(field_name) %}
    case 
        when trim({{ field_name }}) is null or trim({{ field_name }}) = '' 
        then ''
        else replace({{ field_name }}, '"', '')
    end
{% endmacro %}