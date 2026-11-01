CREATE TABLE IF NOT EXISTS mycatalog..silver_account (
  `customer_id` string,
  `customer_name` string,
  `customer_contact_number` string,
  `customer_mobile_number` bigint
)
USING DELTA
TBLPROPERTIES (
  'delta.enableChangeDataFeed' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.columnMapping.mode' = 'name',
  'layer' = 'silver'
);

ALTER TABLE mycatalog..silver_account SET TAGS ('source_system' = 'redshift', 'source_table' = 'account', 'data_layer' = 'silver', 'owner' = 'data-engineering');
