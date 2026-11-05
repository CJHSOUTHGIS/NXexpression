-- 表：其他成果清单 (人大金仓)

CREATE TABLE IF NOT EXISTS proj_qtcgqd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    cdbh              VARCHAR(100),
    zlmc              VARCHAR(100),
    jsbh              VARCHAR(100),
    hjdw              VARCHAR(100),
    hjrq              VARCHAR(30),
    jsr               VARCHAR(100),
    jzlx              VARCHAR(100),
    ztxs              VARCHAR(100),
    sl                VARCHAR(30),
    sldw              VARCHAR(100),
    xsx               VARCHAR(20),
    sjlx              VARCHAR(100),
    sjgs              VARCHAR(100),
    zbxt              VARCHAR(100),
    blc               VARCHAR(100),
    fbl               VARCHAR(100),
    cffqwz            VARCHAR(100),
    bzsm              VARCHAR(1000),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_qtcgqd PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_qtcgqd_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_qtcgqd_parentdocunid ON proj_qtcgqd (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_qtcgqd_sys_parentrid ON proj_qtcgqd (sys_parentrid);
CREATE INDEX IF NOT EXISTS idx_proj_qtcgqd_zlmc ON proj_qtcgqd (zlmc);

COMMENT ON TABLE proj_qtcgqd IS '其他成果清单';
COMMENT ON COLUMN proj_qtcgqd.sys_parentrid IS '父记录标识（关联成果汇交 proj_cghjdj.rid）';
COMMENT ON COLUMN proj_qtcgqd.sjlx IS '数据类型（码表 QTCGLX）';

-- 档案列表视图见同目录 proj_qtcgqd.sql（v_proj_qtcgqd）
-- 应用库用户无序列权限时，由 DBA 执行 proj_qtcgqd_kingbase_grant.sql
-- GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE proj_qtcgqd TO <应用用户>;
-- GRANT USAGE, SELECT ON SEQUENCE proj_qtcgqd_code_seq TO <应用用户>;
