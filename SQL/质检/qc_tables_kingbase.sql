-- 在线入库质检（第一阶段）— 人大金仓
-- 执行前请确认 schema；应用用户需具备 SELECT/INSERT/UPDATE/DELETE 权限

CREATE TABLE IF NOT EXISTS qc_rule_version (
    rid              CHAR(36)       NOT NULL,
    data_type        VARCHAR(20)    NOT NULL,
    version_no       VARCHAR(32)    NOT NULL,
    phase_label      VARCHAR(64)    DEFAULT 'PHASE1_NO_GDAL',
    rule_snapshot    TEXT,
    published_at     TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    published_by     VARCHAR(64),
    CONSTRAINT pk_qc_rule_version PRIMARY KEY (rid)
);

CREATE UNIQUE INDEX IF NOT EXISTS uk_qc_rule_version_type_ver
    ON qc_rule_version (data_type, version_no);

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
    manifest_json        TEXT,
    meta_json            TEXT,
    storage_dir          VARCHAR(500),
    error_message        VARCHAR(1000),
    parent_task_rid      CHAR(36),
    createtime           TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    createuser           VARCHAR(64),
    finishtime           TIMESTAMP,
    CONSTRAINT pk_qc_task PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_qc_task_biz ON qc_task (biz_type, biz_id);
CREATE INDEX IF NOT EXISTS idx_qc_task_status ON qc_task (status, createtime);
CREATE INDEX IF NOT EXISTS idx_qc_task_no ON qc_task (task_no);

CREATE TABLE IF NOT EXISTS qc_task_file (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    file_name        VARCHAR(500)   NOT NULL,
    relative_path    VARCHAR(500),
    file_size        BIGINT,
    file_ext         VARCHAR(32),
    sort_no          INT            DEFAULT 0,
    CONSTRAINT pk_qc_task_file PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_qc_task_file_task ON qc_task_file (task_rid);

CREATE TABLE IF NOT EXISTS qc_result_detail (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    rule_code        VARCHAR(64)    NOT NULL,
    rule_name        VARCHAR(200)   NOT NULL,
    category         VARCHAR(64),
    check_level      VARCHAR(20)    NOT NULL,
    passed           SMALLINT       NOT NULL,
    message          VARCHAR(2000),
    suggestion       VARCHAR(2000),
    duration_ms      BIGINT,
    sort_no          INT            DEFAULT 0,
    CONSTRAINT pk_qc_result_detail PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_qc_result_detail_task ON qc_result_detail (task_rid);

CREATE TABLE IF NOT EXISTS qc_report (
    rid              CHAR(36)       NOT NULL,
    task_rid         CHAR(36)       NOT NULL,
    report_format    VARCHAR(20)    DEFAULT 'HTML',
    report_content   TEXT,
    createtime       TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_qc_report PRIMARY KEY (rid)
);

CREATE UNIQUE INDEX IF NOT EXISTS uk_qc_report_task ON qc_report (task_rid);
