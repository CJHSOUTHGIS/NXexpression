-- 成果预出库清单（按用户私有，可多张 draft）
CREATE TABLE IF NOT EXISTS proj_pre_outbound_list (
    rid                 CHAR(36)      NOT NULL,
    name                VARCHAR(200)  NOT NULL,
    createuserid        VARCHAR(50)   NOT NULL,
    createtime          DATETIME      DEFAULT CURRENT_TIMESTAMP,
    lastmodifytime      DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    lastmodifyuserid    VARCHAR(50),
    last_registration_rid CHAR(36),
    PRIMARY KEY (rid),
    KEY idx_pre_outbound_list_user (createuserid, lastmodifytime)
);

CREATE TABLE IF NOT EXISTS proj_pre_outbound_item (
    rid                   CHAR(36)    NOT NULL,
    list_rid              CHAR(36)    NOT NULL,
    source_form_code      VARCHAR(64) NOT NULL,
    source_rid            CHAR(36)    NOT NULL,
    outbound_type_index   INT         NOT NULL,
    row_json              TEXT        NOT NULL,
    dir_id                VARCHAR(36),
    module_id             VARCHAR(36),
    createtime            DATETIME    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rid),
    UNIQUE KEY uk_pre_outbound_item (list_rid, source_form_code, source_rid),
    KEY idx_pre_outbound_item_list (list_rid)
);
