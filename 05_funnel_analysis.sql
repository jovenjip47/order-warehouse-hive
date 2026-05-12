-- 项目B：用户行为漏斗分析
-- 计算浏览→加购→支付各环节转化率
;
WITH user_funnel AS (
    SELECT 
        user_id,
        MIN(CASE WHEN action_type = 'view' THEN action_time END) AS view_time,
        MIN(CASE WHEN action_type = 'cart' THEN action_time END) AS cart_time,
        MIN(CASE WHEN action_type = 'pay' THEN action_time END) AS pay_time
    FROM ods_user_actions
    GROUP BY user_id
)
SELECT 
    COUNT(*) AS total_users,
    SUM(CASE WHEN view_time IS NOT NULL THEN 1 ELSE 0 END) AS view_cnt,
    SUM(CASE WHEN cart_time IS NOT NULL THEN 1 ELSE 0 END) AS cart_cnt,
    SUM(CASE WHEN pay_time IS NOT NULL THEN 1 ELSE 0 END) AS pay_cnt,
    ROUND(SUM(CASE WHEN cart_time IS NOT NULL THEN 1 ELSE 0 END) / 
          NULLIF(SUM(CASE WHEN view_time IS NOT NULL THEN 1 ELSE 0 END), 0), 2) AS view_to_cart_rate,
    ROUND(SUM(CASE WHEN pay_time IS NOT NULL THEN 1 ELSE 0 END) / 
          NULLIF(SUM(CASE WHEN cart_time IS NOT NULL THEN 1 ELSE 0 END), 0), 2) AS cart_to_pay_rate
FROM user_funnel;
