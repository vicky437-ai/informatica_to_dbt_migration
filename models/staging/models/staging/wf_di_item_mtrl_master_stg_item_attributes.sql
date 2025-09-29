-- Source: wf_DI_ITEM_MTRL_MASTER.XML
-- Staging model for item attributes lookup table
-- Consolidates all attribute lookups into a single normalized table

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'HAZARDOUS_IND' AS attribute_name
FROM {{ source('lookup_source', 'hazardous_ind_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'PTO_RELEVANT_QNTY' AS attribute_name
FROM {{ source('lookup_source', 'pto_relevant_qnty_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'PTO_RELEVANT' AS attribute_name
FROM {{ source('lookup_source', 'pto_relevant_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'ECCN_NBR' AS attribute_name
FROM {{ source('lookup_source', 'eccn_nbr_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'DPS_GENERIC_LOT' AS attribute_name
FROM {{ source('lookup_source', 'dps_generic_lot_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'DPS_UOM_QTY' AS attribute_name
FROM {{ source('lookup_source', 'dps_uom_qty_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'REBOX_ID' AS attribute_name
FROM {{ source('lookup_source', 'rebox_id_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'INSTRMNT_IND' AS attribute_name
FROM {{ source('lookup_source', 'instrument_ind_lookup') }}

UNION ALL

SELECT
    key_of_obj AS item_number,
    char_value AS attribute_value,
    'DEHP_FREE_IND' AS attribute_name
FROM {{ source('lookup_source', 'dehp_free_ind_lookup') }}