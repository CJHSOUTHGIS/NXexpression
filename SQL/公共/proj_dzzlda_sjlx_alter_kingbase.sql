-- 地质资料档案：数据类型（码表 DZCGLX）
ALTER TABLE proj_dzzlda ADD COLUMN IF NOT EXISTS sjlx VARCHAR(100);
COMMENT ON COLUMN proj_dzzlda.sjlx IS '数据类型';
