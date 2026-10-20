-- SMAP 数据库备份记录（MySQL / 开发环境）

CREATE TABLE IF NOT EXISTS smap_db_backup_record (
    rid                 CHAR(36)       NOT NULL,
    status              VARCHAR(20)    NOT NULL,
    requested_mode      VARCHAR(20)    NULL,
    resolved_mode       VARCHAR(20)    NULL,
    phase               VARCHAR(32)    NULL,
    progress_percent    INT            DEFAULT 0,
    schemas_json        VARCHAR(1000)  NULL,
    file_name           VARCHAR(500)   NULL,
    file_size           BIGINT         NULL,
    file_format         VARCHAR(32)    NULL,
    sha256              CHAR(64)       NULL,
    local_path          VARCHAR(1000)  NULL,
    macro_path          VARCHAR(1000)  NULL,
    log_text            TEXT           NULL,
    error_message       VARCHAR(2000)  NULL,
    message             VARCHAR(500)   NULL,
    total_records       BIGINT         DEFAULT 0,
    processed_records   BIGINT         DEFAULT 0,
    current_table       VARCHAR(256)   NULL,
    started_at          DATETIME       NULL,
    finished_at         DATETIME       NULL,
    createtime          DATETIME       DEFAULT CURRENT_TIMESTAMP,
    createuser          VARCHAR(64)    NULL,
    PRIMARY KEY (rid),
    KEY idx_smap_db_backup_status_time (status, createtime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
