-- 成果出库登记：与成果汇交一致的资料类型、包含成果
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS zllx VARCHAR(50);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS bhcg VARCHAR(500);
COMMENT ON COLUMN proj_cgsqckdj.zllx IS '资料类型';
COMMENT ON COLUMN proj_cgsqckdj.bhcg IS '包含成果';
