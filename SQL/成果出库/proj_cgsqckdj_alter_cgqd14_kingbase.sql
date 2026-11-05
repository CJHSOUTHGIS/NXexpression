-- 成果出库登记：其他成果清单 JSON 字段
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS cgqd14 TEXT;
COMMENT ON COLUMN proj_cgsqckdj.cgqd14 IS '成果清单-其他成果(JSON)';
