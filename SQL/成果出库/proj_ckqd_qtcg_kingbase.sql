-- 其他成果出库清单（cgqd14）
CREATE TABLE IF NOT EXISTS proj_ckqd_qtcg (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    cdbh              VARCHAR(50),
    hjdw              VARCHAR(60),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_qtcg PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_qtcg_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_qtcg_parent ON proj_ckqd_qtcg (parent_rid);
COMMENT ON TABLE proj_ckqd_qtcg IS '其他成果出库清单';
