-- 旧表若含保留字列 level（或建表失败后的半成品），可手工修复后重启服务

-- 1) 若表不存在：请直接执行 qc_tables_kingbase.sql

-- 2) 若存在错误列名 level（双引号创建）：
-- ALTER TABLE qc_result_detail RENAME COLUMN "level" TO check_level;

-- 3) 若表已存在但缺少 check_level：
-- ALTER TABLE qc_result_detail ADD COLUMN IF NOT EXISTS check_level VARCHAR(20);
-- UPDATE qc_result_detail SET check_level = 'PASS' WHERE check_level IS NULL;
-- ALTER TABLE qc_result_detail ALTER COLUMN check_level SET NOT NULL;
