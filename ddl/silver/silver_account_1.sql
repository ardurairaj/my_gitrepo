CREATE TABLE IF NOT EXISTS mycatalog..silver_account_1 (
  `customer_id` string COMMENT 'This column likely represents a unique identifier for a customer account in the system.update',
  `customer_name` string COMMENT 'This column likely represents the name of the customer associated with an account in the development data set.',
  `customer_contact_number` string COMMENT 'customer contact number',
  `customer_mobile_number` string
)
USING DELTA
TBLPROPERTIES (
  'delta.enableChangeDataFeed' = 'true',
  'delta.autoOptimize.optimizeWrite' = 'true',
  'delta.autoOptimize.autoCompact' = 'true',
  'delta.columnMapping.mode' = 'name',
  'layer' = 'silver'
);

ALTER TABLE mycatalog..silver_account_1 SET TAGS ('source_system' = 'redshift', 'source_table' = 'account_1', 'data_layer' = 'silver', 'owner' = 'data-engineering');
