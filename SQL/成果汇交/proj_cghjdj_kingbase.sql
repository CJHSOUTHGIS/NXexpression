--********************************************************************************
-- 表：成果汇交登记表 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_cghjdj (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    jsbh              VARCHAR(30),
    zlmc              VARCHAR(100),
    hjrq              VARCHAR(30),
    hjdw              VARCHAR(100),
    jsr               VARCHAR(100),
    jsrq              VARCHAR(30),
    cdbh              VARCHAR(100),
    zllx              VARCHAR(50),
    bhcg              VARCHAR(200),
    bzsm              VARCHAR(1000),
    zlqd              TEXT,
    hjqdsc            TEXT,
    zzdawz            VARCHAR(200),
    dzdawz            VARCHAR(200),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_cghjdj PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_cghjdj_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_cghjdj_parentdocunid ON proj_cghjdj (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_cghjdj_jsbh ON proj_cghjdj (jsbh);
CREATE INDEX IF NOT EXISTS idx_proj_cghjdj_zlmc ON proj_cghjdj (zlmc);
CREATE INDEX IF NOT EXISTS idx_proj_cghjdj_jid ON proj_cghjdj (jid);
CREATE INDEX IF NOT EXISTS idx_proj_cghjdj_sys_parentrid ON proj_cghjdj (sys_parentrid);

COMMENT ON TABLE proj_cghjdj IS '成果汇交登记表';
COMMENT ON COLUMN proj_cghjdj.code IS '主键序号';
COMMENT ON COLUMN proj_cghjdj.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_cghjdj.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_cghjdj.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_cghjdj.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_cghjdj.jsbh IS '接收编号';
COMMENT ON COLUMN proj_cghjdj.zlmc IS '资料名称';
COMMENT ON COLUMN proj_cghjdj.hjrq IS '汇交日期';
COMMENT ON COLUMN proj_cghjdj.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_cghjdj.jsr IS '接收人';
COMMENT ON COLUMN proj_cghjdj.jsrq IS '接收日期';
COMMENT ON COLUMN proj_cghjdj.cdbh IS '存档编号';
COMMENT ON COLUMN proj_cghjdj.zllx IS '资料类型';
COMMENT ON COLUMN proj_cghjdj.bhcg IS '包含成果';
COMMENT ON COLUMN proj_cghjdj.bzsm IS '备注说明';
COMMENT ON COLUMN proj_cghjdj.zlqd IS '接收资料清单(JSON)';
COMMENT ON COLUMN proj_cghjdj.hjqdsc IS '汇交清单上传';
COMMENT ON COLUMN proj_cghjdj.zzdawz IS '纸质档案位置';
COMMENT ON COLUMN proj_cghjdj.dzdawz IS '电子档案位置';
COMMENT ON COLUMN proj_cghjdj.projectdocunid IS '汇交项目ID';
COMMENT ON COLUMN proj_cghjdj.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_cghjdj.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_cghjdj.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_cghjdj.lastmodifyuser IS '最近修改用户';
