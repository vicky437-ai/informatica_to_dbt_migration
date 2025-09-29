-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model: Non-posted journals for staging table
-- Implements Router transformation: Staging_Table group (GLPOST != 'P')

select
    glicu as out_glicu3,
    glicut as out_glicut3,
    icist as out_icist3,
    icame as out_icame3,
    gmdl01 as out_gmdl013,
    glkco as out_glkco3,
    gldct as out_gldct3,
    gldoc as out_gldoc3,
    gldgj as out_gldgj3,
    gljeln as out_gljeln3,
    glextl as out_glextl3,
    glpost as out_glpost3,
    glco as out_glco3,
    glani as out_glani3,
    glsbl as out_glsbl3,
    glsblt as out_glsblt3,
    gllt as out_gllt3,
    glcrcd as out_glcrcd3,
    glaa as out_glaa3,
    glre as out_glre3,
    glexa as out_glexa3,
    glexr as out_glexr3,
    glasid as out_glasid3,
    glrcnd as out_glrcnd3,
    glpo as out_glpo3,
    gluser as out_gluser3,
    glupmj as out_glupmj3,
    glupmt as out_glupmt3,
    glcrrm as out_glcrrm3,
    gldicj as out_gldicj3,
    gltorg as out_gltorg3,
    eaemal as out_eaemal3,
    etl_load_dte as etl_load_dte3

from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_new_records') }}

where glpost != 'P'