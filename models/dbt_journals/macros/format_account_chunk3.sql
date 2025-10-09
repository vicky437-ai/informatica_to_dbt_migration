{% macro format_account(company, object, subsidiary) %}
    -- Macro to format JDE account numbers consistently
    concat(
        lpad(cast({{ company }} as string), 5, '0'),
        '.',
        lpad(cast({{ object }} as string), 6, '0'),
        '.',
        lpad(cast({{ subsidiary }} as string), 8, '0')
    )
{% endmacro %}