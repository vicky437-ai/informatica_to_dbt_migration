-- Model: wf_bl_ff_zj_journals_stg_stg_f0911
-- Merged from 4 chunks

{{ config(materialized='view') }}

select
    glicu,
    glicut,
    gldct,
    gldoc,
    glkco,
    gldgj,
    gljeln,
    glextl,
    glpost,
    glco,
    glani,
    glsbl,
    glsblt,
    gllt,
    glcrcd,
    glaa,
    glre,
    glexa,
    glexr,
    glasid,
    glrcnd,
    glpo,
    gluser,
    glupmj,
    glupmt,
    glcrrm,
    gldicj,
    gltorg
from {{ source('crpdta', 'f0911') }}