-- Model: wf_di_item_mtrl_master_int_material_master_update
-- Merged from 2 chunks

select *
from {{ ref('models/intermediate/wf_di_item_mtrl_master_int_material_master_with_flags') }}
where insert_update_flag = 'U'