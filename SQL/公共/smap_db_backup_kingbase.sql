-- SMAP 数据库备份记录（人大金仓）
-- 执行前请确认 schema 与 infosvrsmap 应用 datasource 一致

CREATE TABLE IF NOT EXISTS smap_db_backup_record (
    rid                 CHAR(36)       NOT NULL,
    status              VARCHAR(20)    NOT NULL,
    requested_mode      VARCHAR(20),
    resolved_mode       VARCHAR(20),
    phase               VARCHAR(32),
    progress_percent    INT            DEFAULT 0,
    schemas_json        VARCHAR(1000),
    file_name           VARCHAR(500),
    file_size           BIGINT,
    file_format         VARCHAR(32),
    sha256              CHAR(64),
    local_path          VARCHAR(1000),
    macro_path          VARCHAR(1000),
    log_text            TEXT,
    error_message       VARCHAR(2000),
    message             VARCHAR(500),
    total_records       BIGINT         DEFAULT 0,
    processed_records   BIGINT         DEFAULT 0,
    current_table       VARCHAR(256),
    started_at          TIMESTAMP,
    finished_at         TIMESTAMP,
    createtime          TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    createuser          VARCHAR(64),
    CONSTRAINT pk_smap_db_backup_record PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_smap_db_backup_status_time
    ON smap_db_backup_record (status, createtime DESC);
