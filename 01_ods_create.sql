-- ODS 层建表（外部表，指向 HDFS 目录）
CREATE EXTERNAL TABLE IF NOT EXISTS ods_orders (
    order_id INT,
    user_id INT,
    amount DOUBLE,
    status STRING,
    order_time STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hive_data/ods_orders';      -- 指向目录，不包含文件名

CREATE EXTERNAL TABLE IF NOT EXISTS ods_user_info (
    user_id INT,
    level STRING,
    start_date STRING,
    end_date STRING
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/hive_data/ods_user_info';

