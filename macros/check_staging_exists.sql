-- Model: check_staging_exists
-- Merged from 2 chunks

select 1 
            from {{ ref('wf_bl_ff_zj_journals_stg_stg_s_zj_journals') }} s
            where s.gldct = {{ gldct }}
              and s.gldoc = {{ gldoc }}
              and s.glkco = {{ glkco }}
              and s.gllt = {{ gllt }}
              and s.gljeln = {{ gljeln }}
        ) then 'N'
        else 'Y'
    end
{% endmacro %}