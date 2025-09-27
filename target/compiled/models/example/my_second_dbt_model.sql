
-- Use the `ref` function to select from other models

select *
from TPC_DI_RAW_DATA.DBT_INGEST.my_first_dbt_model
where id = 1