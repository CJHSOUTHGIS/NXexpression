--********************************************************************************
-- 外部数据集成方案配置 + 出库表来源字段（Kingbase / PostgreSQL 兼容写法）
-- 执行前请确认 schema；MySQL 请使用 ext_integration_profile_mysql.sql
--********************************************************************************

-- 1. 出库登记表：第三方来源追溯
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS data_source VARCHAR(64);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS data_source_name VARCHAR(200);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS external_id VARCHAR(64);
ALTER TABLE proj_cgsqckdj ADD COLUMN IF NOT EXISTS external_sync_time VARCHAR(30);

COMMENT ON COLUMN proj_cgsqckdj.data_source IS '外部数据来源系统编码';
COMMENT ON COLUMN proj_cgsqckdj.data_source_name IS '外部数据来源系统名称';
COMMENT ON COLUMN proj_cgsqckdj.external_id IS '外部分发单主键';
COMMENT ON COLUMN proj_cgsqckdj.external_sync_time IS '最近外部同步时间';

CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_data_source_ext ON proj_cgsqckdj (data_source, external_id);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_data_source_ffbh ON proj_cgsqckdj (data_source, ffbh);

-- 2. 集成方案配置表（JSON 开放配置）
CREATE TABLE IF NOT EXISTS ext_integration_profile (
    rid               CHAR(36)      NOT NULL,
    profile_id        VARCHAR(64)   NOT NULL,
    profile_name      VARCHAR(200),
    enabled           SMALLINT      DEFAULT 1,
    config_json       TEXT          NOT NULL,
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_ext_integration_profile PRIMARY KEY (rid),
    CONSTRAINT uk_ext_integration_profile_id UNIQUE (profile_id)
);

CREATE INDEX IF NOT EXISTS idx_ext_integration_profile_enabled ON ext_integration_profile (enabled);

COMMENT ON TABLE ext_integration_profile IS '外部数据集成方案配置';
COMMENT ON COLUMN ext_integration_profile.profile_id IS '方案编码，如 zrzy-cgda-distribution';
COMMENT ON COLUMN ext_integration_profile.config_json IS '完整 JSON 配置（连接器、映射、tbname 等）';
