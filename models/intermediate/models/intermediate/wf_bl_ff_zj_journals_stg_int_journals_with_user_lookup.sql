-- Source: wf_BL_FF_ZJ_JOURNALS_STG.XML
-- Intermediate model adding user lookup data
-- Replicates lkp_F0092_R and lkp_F01151_R transformations

with user_lookup as (
    select
        uluser,
        ulan8
    from {{ ref('models/staging/wf_bl_ff_zj_journals_stg_stg_f0092_users') }}
),

email_lookup as (
    select
        eaan8,
        eaetp,
        eaemal,
        row_number() over (partition by eaan8 order by eaidln) as rn
    from {{ ref('models/staging/wf_bl_ff_zj_journals_stg_stg_f01151_electronic_address') }}
),

journals_with_users as (
    select
        j.*,
        u.ulan8,
        e.eaetp,
        case 
            when e.eaemal is null then null
            else e.eaemal
        end as out_eaemal
    from {{ ref('models/intermediate/wf_bl_ff_zj_journals_stg_int_journals_cleaned') }} j
    left join user_lookup u on u.uluser = j.out_gltorg
    left join email_lookup e on e.eaan8 = u.ulan8 and e.rn = 1
)

select
    *,
    -- Add foreign currency flag
    {{ flag_foreign_currency('out_glcrcd', 'out_gllt') }} as out_flag
from journals_with_users