-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for CE mark indicator lookup
select
    key_of_obj,
    char_value as ce_mark_ind_value
from {{ source('lookup_source', 'ce_mark_ind_lookup') }}