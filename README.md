Hive / HiveSQL, HDFS, Shell
本项目包含两个紧密关联的模块：电商离线数仓建设和用户行为漏斗分析。
;

## 项目结构
| 文件 | 模块 | 说明 |
|------|------|------|
| `01_ods_create.sql` | 项目A | ODS层建表 |
| `02_dwd_clean.sql` | 项目A | DWD层数据清洗 |
| `03_dws_aggregate.sql` | 项目A | DWS层轻度聚合 |
| `04_ads_report.sql` | 项目A | ADS层最终报表 |
| `05_funnel_analysis.sql` | 项目B | 用户行为漏斗分析 |

## 运行方式
```bash
hive -f 01_ods_create.sql
hive -f 02_dwd_clean.sql
hive -f 03_dws_aggregate.sql
hive -f 04_ads_report.sql
hive -f 05_funnel_analysis.sql
