-- 第三方分发数据导入：来源追溯字段（MySQL）
ALTER TABLE proj_cgsqckdj ADD COLUMN data_source VARCHAR(64) NULL COMMENT '外部数据来源系统编码';
ALTER TABLE proj_cgsqckdj ADD COLUMN data_source_name VARCHAR(200) NULL COMMENT '外部数据来源系统名称';
ALTER TABLE proj_cgsqckdj ADD COLUMN external_id VARCHAR(64) NULL COMMENT '外部分发单主键';
ALTER TABLE proj_cgsqckdj ADD COLUMN external_sync_time VARCHAR(30) NULL COMMENT '最近外部同步时间';

CREATE INDEX idx_proj_cgsqckdj_data_source_ext ON proj_cgsqckdj (data_source, external_id);
CREATE INDEX idx_proj_cgsqckdj_data_source_ffbh ON proj_cgsqckdj (data_source, ffbh);
