-- 在线入库质检（第一阶段）— MySQL / MariaDB

CREATE TABLE IF NOT EXISTS qc_rule_version (
    rid              CHAR(36)       NOT NULL,
    data_type        VARCHAR(20)    NOT NULL,
    version_no       VARCHAR(32)    NOT NULL,
    phase_label      VARCHAR(64)    DEFAULT 'PHASE1_NO_GDAL',
    rule_snapshot    LONGTEXT,
    published_at     DATETIME       DEFAULT CURRENT_TIMESTAMP,
    published_by     VARCHAR(64),
    PRIMARY KEY (rid),
    UNIQUE KEY uk_qc_rule_version_type_ver (data_type, version_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS qc_task (
    rid                  CHAR(36)       NOT NULL,
    task_no              VARCHAR(40)    NOT NULL,
    data_type            VARCHAR(20)    NOT NULL,
    biz_type             VARCHAR(64),
    biz_id               VARCHAR(128),
    rule_version_rid     CHAR(36),
    rule_version_no      VARCHAR(32),
    status               VARCHAR(20)    NOT NULL,
    progress             INT            DEFAULT 0,
    progress_message     VARCHAR(500),
    conclusion           VARCHAR(20),
    manifest_json        LONGTEXT,
    meta_json            LONGTEXT,
    storage_dir          VARCHAR(500),
    error_message        VARCHAR(1000),
    parent_task_rid      CHAR(36),
    createtime           DATETIME       DEFAULT CURRENT_TIMESTAMP,
    createuser           VARCHAR(64),
    finishtime           DATETIME,
    PRIMARY KEY (rid),
    KEY idx_qc_task_biz (biz_type, biz_id),
    KEY idx_qc_task_status (status, createtime),
    KEY idx_qc_task_no (task_no)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS qc_task_file (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    file_name        VARCHAR(500)   NOT NULL,
    relative_path    VARCHAR(500),
    file_size        BIGINT,
    file_ext         VARCHAR(32),
    sort_no          INT            DEFAULT 0,
    PRIMARY KEY (rid),
    KEY idx_qc_task_file_task (task_rid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS qc_result_detail (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    rule_code        VARCHAR(64)    NOT NULL,
    rule_name        VARCHAR(200)   NOT NULL,
    category         VARCHAR(64),
    check_level      VARCHAR(20)    NOT NULL,
    passed           TINYINT        NOT NULL,
    message          VARCHAR(2000),
    suggestion       VARCHAR(2000),
    duration_ms      BIGINT,
    sort_no          INT            DEFAULT 0,
    PRIMARY KEY (rid),
    KEY idx_qc_result_detail_task (task_rid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS qc_report (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    report_format    VARCHAR(20)    DEFAULT 'HTML',
    report_content   LONGTEXT,
    createtime       DATETIME       DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rid),
    UNIQUE KEY uk_qc_report_task (task_rid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
