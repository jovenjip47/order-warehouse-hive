# 电商离线数仓与用户行为分析

## 项目简介
本项目包含两个模块：
- **项目A**：构建电商订单离线数仓（ODS → DWD → DWS → ADS），产出每日 GMV 和用户行为汇总表。
- **项目B**：基于用户行为日志，计算浏览→加购→支付转化率。

## 技术栈
- Hive (HiveQL)
- HDFS
- Shell

## 文件说明
| 文件 | 模块 | 说明 |
|------|------|------|
| `01_ods_create.sql` | 项目A | ODS 层外部表建表 |
| `02_dwd_clean.sql` | 项目A | DWD 层数据清洗 |
| `03_dws_aggregate.sql` | 项目A | DWS 层轻度聚合 |
| `04_ads_report.sql` | 项目A | ADS 层最终报表 |
| `05_funnel_analysis.sql` | 项目B | 用户行为漏斗分析 |

## 运行方式
执行以下命令（需提前将数据文件放到 HDFS 对应目录）：
```bash
hive -f 01_ods_create.sql
hive -f 02_dwd_clean.sql
hive -f 03_dws_aggregate.sql
hive -f 04_ads_report.sql
hive -f 05_funnel_analysis.sql
eof
