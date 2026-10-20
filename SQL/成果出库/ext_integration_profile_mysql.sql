--********************************************************************************
-- 外部数据集成方案配置 + 出库表来源字段（MySQL）
--********************************************************************************

ALTER TABLE proj_cgsqckdj ADD COLUMN data_source VARCHAR(64) NULL COMMENT '外部数据来源系统编码';
ALTER TABLE proj_cgsqckdj ADD COLUMN data_source_name VARCHAR(200) NULL COMMENT '外部数据来源系统名称';
ALTER TABLE proj_cgsqckdj ADD COLUMN external_id VARCHAR(64) NULL COMMENT '外部分发单主键';
ALTER TABLE proj_cgsqckdj ADD COLUMN external_sync_time VARCHAR(30) NULL COMMENT '最近外部同步时间';

CREATE INDEX idx_proj_cgsqckdj_data_source_ext ON proj_cgsqckdj (data_source, external_id);
CREATE INDEX idx_proj_cgsqckdj_data_source_ffbh ON proj_cgsqckdj (data_source, ffbh);

CREATE TABLE IF NOT EXISTS ext_integration_profile (
    rid               CHAR(36)      NOT NULL,
    profile_id        VARCHAR(64)   NOT NULL,
    profile_name      VARCHAR(200)  NULL,
    enabled           SMALLINT      DEFAULT 1,
    config_json       LONGTEXT      NOT NULL,
    createtime        TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50)   NULL,
    lastmodifytime    TIMESTAMP     NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50)   NULL,
    PRIMARY KEY (rid),
    UNIQUE KEY uk_ext_integration_profile_id (profile_id),
    KEY idx_ext_integration_profile_enabled (enabled)
) COMMENT='外部数据集成方案配置';
