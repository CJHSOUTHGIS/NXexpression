-- 成果预出库清单（按用户私有，可多张 draft）
CREATE TABLE IF NOT EXISTS proj_pre_outbound_list (
    rid                   CHAR(36)      NOT NULL,
    name                  VARCHAR(200)  NOT NULL,
    createuserid          VARCHAR(50)   NOT NULL,
    createtime            TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifytime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuserid      VARCHAR(50),
    last_registration_rid CHAR(36),
    CONSTRAINT pk_proj_pre_outbound_list PRIMARY KEY (rid)
);
CREATE INDEX IF NOT EXISTS idx_pre_outbound_list_user ON proj_pre_outbound_list (createuserid, lastmodifytime);

CREATE TABLE IF NOT EXISTS proj_pre_outbound_item (
    rid                   CHAR(36)    NOT NULL,
    list_rid              CHAR(36)    NOT NULL,
    source_form_code      VARCHAR(64) NOT NULL,
    source_rid            CHAR(36)    NOT NULL,
    outbound_type_index   INT         NOT NULL,
    row_json              TEXT        NOT NULL,
    dir_id                VARCHAR(36),
    module_id             VARCHAR(36),
    createtime            TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_proj_pre_outbound_item PRIMARY KEY (rid),
    CONSTRAINT uk_pre_outbound_item UNIQUE (list_rid, source_form_code, source_rid)
);
CREATE INDEX IF NOT EXISTS idx_pre_outbound_item_list ON proj_pre_outbound_item (list_rid);
