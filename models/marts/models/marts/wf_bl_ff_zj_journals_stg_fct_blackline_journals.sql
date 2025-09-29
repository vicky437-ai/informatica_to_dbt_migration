-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- REQUIRED mart for Flat File target: Blackline journals export
-- Target type: FlatFile (FF_*)
-- Contains posted journal entries (GLPOST = 'P') for Blackline system

{{ config(
    materialized='table',
    indexes=[
      {'columns': ['out_glkco', 'out_gldgj'], 'type': 'btree'},
      {'columns': ['out_glpost'], 'type': 'btree'}
    ]
) }}

select
    out_glicu as glicu,
    out_glicut as glicut,
    out_icist as icist,
    out_icame as icame,
    out_gmdl01 as gmdl01,
    out_glkco as glkco,
    out_gldct as gldct,
    out_gldoc as gldoc,
    out_gldgj as gldgj,
    out_gljeln as gljeln,
    out_glextl as glextl,
    out_glpost as glpost,
    out_glco as glco,
    out_glani as glani,
    out_glsbl as glsbl,
    out_glsblt as glsblt,
    out_gllt as gllt,
    out_glcrcd as glcrcd,
    out_glaa as glaa,
    out_glre as glre,
    out_glexa as glexa,
    out_glexr as glexr,
    out_glasid as glasid,
    out_glrcnd as glrcnd,
    out_glpo as glpo,
    out_gluser as gluser,
    out_glupmj as glupmj,
    out_glupmt as glupmt,
    out_glcrrm as glcrrm,
    out_gldicj as gldicj,
    out_gltorg as gltorg,
    out_eaemal as eaemal,
    etl_load_dte
from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_routed') }}
where routing_group = 'Flat_File'  -- GLPOST = 'P'