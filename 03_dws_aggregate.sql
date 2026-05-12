-- DWS 层：用户+日期轻度聚合
CREATE TABLE IF NOT EXISTS dws_user_daily (
    user_id INT,
    dt DATE,
    daily_amount DOUBLE,
    order_cnt INT
)
STORED AS ORC;

INSERT OVERWRITE TABLE dws_user_daily
SELECT 
    user_id,
    TO_DATE(order_time) AS dt,
    SUM(amount) AS daily_amount,
    COUNT(*) AS order_cnt
FROM dwd_orders
WHERE status IN ('paid','completed')
GROUP BY user_id, TO_DATE(order_time);
