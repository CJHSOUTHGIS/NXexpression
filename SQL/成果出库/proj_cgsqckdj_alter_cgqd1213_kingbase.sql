--********************************************************************************
-- 成果出库登记表：新增规划成果、实景三维清单字段（已有库升级）
--********************************************************************************
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS cgqd12 TEXT;
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS cgqd13 TEXT;

COMMENT ON COLUMN proj_cgsqckdj.cgqd12 IS '成果清单-规划成果(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd13 IS '成果清单-实景三维(JSON)';
