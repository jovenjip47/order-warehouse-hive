CREATE TABLE ads_daily_gmv AS
SELECT 
    TO_DATE(order_time) AS dt,
    SUM(amount) AS gmv
FROM dwd_orders
WHERE status IN ('paid','completed')
GROUP BY TO_DATE(order_time)
ORDER BY dt;

CREATE TABLE ads_user_behavior AS
SELECT 
    user_id,
    MIN(TO_DATE(order_time)) AS first_order_date,
    MAX(TO_DATE(order_time)) AS last_order_date,
    COUNT(*) AS order_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS avg_amount
FROM dwd_orders
WHERE status IN ('paid','completed')
GROUP BY user_id;
