-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Intermediate model combining material data with descriptions
-- Filters for English language descriptions and joins material attributes

with material_base as (
    select * from {{ ref('wf_di_item_mtrl_master_stg_xml_md_material_attr_txt') }}
),

english_descriptions as (
    select 
        product,
        product_description
    from material_base
    where language = 'EN'
      and product_description is not null
),

material_with_desc as (
    select 
        m.*,
        d.product_description as english_description
    from material_base m
    left join english_descriptions d
        on m.product = d.product
)

select * from material_with_desc