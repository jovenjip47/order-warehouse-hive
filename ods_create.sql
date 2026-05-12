CREATE EXTERNAL TABLE ods_orders (
    order_id INT,
    user_id INT,
    amount DOUBLE,
    status STRING,
    order_time STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hive_data/ods_orders';

CREATE EXTERNAL TABLE ods_user_info (
    user_id INT,
    level STRING,
    start_date STRING,
    end_date STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hive_data/ods_user_info';
