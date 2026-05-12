-- ADS 层报表1：每日 GMV
CREATE TABLE IF NOT EXISTS ads_daily_gmv (
    dt DATE,
    gmv DOUBLE
)
STORED AS ORC;

INSERT OVERWRITE TABLE ads_daily_gmv
SELECT 
    TO_DATE(order_time) AS dt,
    SUM(amount) AS gmv
FROM dwd_orders
WHERE status IN ('paid','completed')
GROUP BY TO_DATE(order_time)
ORDER BY dt;

-- ADS 层报表2：用户行为总结
CREATE TABLE IF NOT EXISTS ads_user_behavior (
    user_id INT,
    first_order_date DATE,
    last_order_date DATE,
    order_count INT,
    total_amount DOUBLE,
    avg_amount DOUBLE
)
STORED AS ORC;

INSERT OVERWRITE TABLE ads_user_behavior
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
