-- DWD 层：创建清洗后的订单明细表
CREATE TABLE IF NOT EXISTS dwd_orders (
    order_id INT,
    user_id INT,
    amount DOUBLE,
    status STRING,
    order_time TIMESTAMP
)
STORED AS ORC;

-- 从 ODS 清洗并插入数据
INSERT OVERWRITE TABLE dwd_orders
SELECT 
    order_id,
    user_id,
    amount,
    status,
    FROM_UNIXTIME(UNIX_TIMESTAMP(order_time, 'yyyy-MM-dd HH:mm:ss')) AS order_time
FROM ods_orders
WHERE amount > 0 
  AND status IN ('paid','completed','cancelled')
  AND order_time IS NOT NULL;
