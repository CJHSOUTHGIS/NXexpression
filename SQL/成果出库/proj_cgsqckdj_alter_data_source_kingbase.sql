-- 第三方分发数据导入：来源追溯字段
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS data_source VARCHAR(64);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS data_source_name VARCHAR(200);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS external_id VARCHAR(64);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS external_sync_time VARCHAR(30);

COMMENT ON COLUMN proj_cgsqckdj.data_source IS '外部数据来源系统编码';
COMMENT ON COLUMN proj_cgsqckdj.data_source_name IS '外部数据来源系统名称';
COMMENT ON COLUMN proj_cgsqckdj.external_id IS '外部分发单主键';
COMMENT ON COLUMN proj_cgsqckdj.external_sync_time IS '最近外部同步时间';

CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_data_source_ext
    ON proj_cgsqckdj (data_source, external_id);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_data_source_ffbh
    ON proj_cgsqckdj (data_source, ffbh);
