-- Macro to generate flags based on lookup results
-- Used in exp_Flag_STG transformations

{% macro generate_flag(lookup_field, source_field) %}
    case 
        when {{ lookup_field }} is not null then 'R'
        else 'NR'
    end
{% endmacro %}