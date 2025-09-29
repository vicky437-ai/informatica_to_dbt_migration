-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for IBP scope indicator lookup
select
    key_of_obj,
    char_value as ibp_scope_ind_value
from {{ source('lookup_source', 'ibp_scope_ind_lookup') }}