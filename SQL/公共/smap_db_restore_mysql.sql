-- SMAP 数据库还原记录（MySQL）

CREATE TABLE IF NOT EXISTS smap_db_restore_record (
    rid                 CHAR(36)       NOT NULL,
    backup_rid          CHAR(36)       NOT NULL,
    status              VARCHAR(20)    NOT NULL,
    restore_mode        VARCHAR(32)    NOT NULL,
    target_schema       VARCHAR(128),
    source_format       VARCHAR(32),
    phase               VARCHAR(32),
    progress_percent    INT            DEFAULT 0,
    message             VARCHAR(500),
    error_message       VARCHAR(2000),
    log_text            TEXT,
    total_records       BIGINT         DEFAULT 0,
    processed_records   BIGINT         DEFAULT 0,
    current_table       VARCHAR(256),
    started_at          DATETIME,
    finished_at         DATETIME,
    createtime          DATETIME       DEFAULT CURRENT_TIMESTAMP,
    createuser          VARCHAR(64),
    PRIMARY KEY (rid),
    KEY idx_smap_db_restore_backup (backup_rid, createtime)
);
