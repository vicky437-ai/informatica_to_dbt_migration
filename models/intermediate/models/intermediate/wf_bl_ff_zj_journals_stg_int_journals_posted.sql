-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Posted journals for flat file export
-- Implements Router transformation: Flat_File group (GLPOST = 'P')

select
    glicu as out_glicu1,
    glicut as out_glicut1,
    icist as out_icist1,
    icame as out_icame1,
    gmdl01 as out_gmdl011,
    glkco as out_glkco1,
    gldct as out_gldct1,
    gldoc as out_gldoc1,
    gldgj as out_gldgj1,
    gljeln as out_gljeln1,
    glextl as out_glextl1,
    glpost as out_glpost1,
    glco as out_glco1,
    glani as out_glani1,
    glsbl as out_glsbl1,
    glsblt as out_glsblt1,
    gllt as out_gllt1,
    glcrcd as out_glcrcd1,
    glaa as out_glaa1,
    glre as out_glre1,
    glexa as out_glexa1,
    glexr as out_glexr1,
    glasid as out_glasid1,
    glrcnd as out_glrcnd1,
    glpo as out_glpo1,
    gluser as out_gluser1,
    glupmj as out_glupmj1,
    glupmt as out_glupmt1,
    glcrrm as out_glcrrm1,
    gldicj as out_gldicj1,
    gltorg as out_gltorg1,
    eaemal as out_eaemal1,
    etl_load_dte as etl_load_dte1

from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_new_records') }}

where glpost = 'P'