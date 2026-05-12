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
