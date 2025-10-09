-- Source: wf_BL_FF_ZJ_JOURNALS.XML
-- Staging: Combined F0011, F0911, F0901 tables
-- Source: JDE tables for journal processing
-- Performs join of F0011, F0911 and F0901, filtering records based on condition

{{ config(
    materialized='view',
    tags=['staging', 'jde']
) }}

select distinct
    -- F0911 fields
    f0911.glicu,
    f0911.glicut,
    f0911.gldct,
    f0911.gldoc,
    f0911.glkco,
    f0911.gldgj,
    f0911.gllt,
    f0911.glexa,
    f0911.glcrcd,
    f0911.glcrrm,
    f0911.gltorg,
    f0911.gldicj,
    f0911.gljeln,
    f0911.glextl,
    f0911.glani,
    f0911.glco,
    f0911.glaa,
    f0911.glexr,
    f0911.glsblt,
    f0911.glsbl,
    f0911.glpost,
    f0911.glre,
    f0911.glrcnd,
    f0911.glpo,
    f0911.glasid,
    f0911.gluser,
    f0911.glupmj,
    f0911.glupmt,
    
    -- F0011 fields
    f0011.icame,
    f0011.icist,
    f0011.icicu,
    f0011.icicut,
    
    -- F0901 fields
    f0901.gmdl01,
    f0901.gmaid,
    
    -- Lookup field placeholder
    cast(null as varchar(256)) as eaemal

from {{ source('jde_system', 'f0911') }} f0911
inner join {{ source('jde_system', 'f0011') }} f0011
    on f0911.glkco = f0011.icicu
    and f0911.glicut = f0011.icicut
left join {{ source('jde_system', 'f0901') }} f0901
    on f0911.glaid = f0901.gmaid

-- Apply source filtering if needed
where 1=1
    {% if var('source_filter', '') != '' %}
    and {{ var('source_filter') }}
    {% endif %}