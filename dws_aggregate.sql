INSERT OVERWRITE TABLE dws_user_daily
SELECT 
    user_id,
    TO_DATE(order_time) AS dt,
    SUM(amount) AS daily_amount,
    COUNT(*) AS order_cnt
FROM dwd_orders
WHERE status IN ('paid','completed')
GROUP BY user_id, TO_DATE(order_time);
