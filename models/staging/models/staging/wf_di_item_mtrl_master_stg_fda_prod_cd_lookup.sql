-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for FDA product code lookup
select
    key_of_obj,
    char_value as fda_prod_cd_value
from {{ source('lookup_source', 'fda_prod_cd_lookup') }}