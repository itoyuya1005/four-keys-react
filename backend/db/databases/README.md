### 概要
CIで利用するTestunit用テーブルダンプの説明

### Dumpコマンド
```
mysqldump --no-tablespaces --skip-column-statistics -d -h local-db.cj4enm8xzu30.ap-northeast-1.rds.amazonaws.com -u stag_mk01_admin -p four_keys > db/test_databases/four_keys.sql
```
