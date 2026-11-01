CREATE OR REPLACE TEMPORARY VIEW temp_account_1 AS
SELECT
  `customer_id` AS `customer_id`,
  `customer_name` AS `customer_name`,
  `customer_contact_number` AS `customer_contact_number`,
  `customer_mobile_number` AS `customer_mobile_number`
FROM pluto_bronze_dev.src_data.account_1
WHERE `sys_modified_timestamp` >= (SELECT MAX(`sys_modified_timestamp`) - INTERVAL 1 DAY FROM pluto_bronze_dev.src_data.account_1);

MERGE INTO mycatalog..silver_account_1 AS t
USING temp_account_1 AS s
ON FALSE /* TODO: set business keys */
WHEN MATCHED THEN UPDATE SET t.`customer_id` = s.`customer_id`, t.`customer_name` = s.`customer_name`, t.`customer_contact_number` = s.`customer_contact_number`, t.`customer_mobile_number` = s.`customer_mobile_number`
WHEN NOT MATCHED THEN INSERT (`customer_id`, `customer_name`, `customer_contact_number`, `customer_mobile_number`) VALUES (s.`customer_id`, s.`customer_name`, s.`customer_contact_number`, s.`customer_mobile_number`);
