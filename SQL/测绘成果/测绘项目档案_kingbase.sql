--********************************************************************************
-- 表：测绘项目档案 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_chxmda (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    xmlb              VARCHAR(100),
    jsbh              VARCHAR(100),
    cdbh              VARCHAR(100),
    hjdw              VARCHAR(100),
    jsr               VARCHAR(100),
    jsrq              VARCHAR(30),
    xmmc              VARCHAR(100),
    bzsm              VARCHAR(1000),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_chxmda PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_chxmda_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_chxmda_parentdocunid ON proj_chxmda (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_chxmda_xmlb ON proj_chxmda (xmlb);
CREATE INDEX IF NOT EXISTS idx_proj_chxmda_xmmc ON proj_chxmda (xmmc);
CREATE INDEX IF NOT EXISTS idx_proj_chxmda_jid ON proj_chxmda (jid);
CREATE INDEX IF NOT EXISTS idx_proj_chxmda_sys_parentrid ON proj_chxmda (sys_parentrid);

COMMENT ON TABLE proj_chxmda IS '测绘项目档案';
COMMENT ON COLUMN proj_chxmda.code IS '主键';
COMMENT ON COLUMN proj_chxmda.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_chxmda.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_chxmda.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_chxmda.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_chxmda.xmlb IS '项目类别';
COMMENT ON COLUMN proj_chxmda.jsbh IS '接收编号';
COMMENT ON COLUMN proj_chxmda.cdbh IS '存档编号';
COMMENT ON COLUMN proj_chxmda.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_chxmda.jsr IS '接收人';
COMMENT ON COLUMN proj_chxmda.jsrq IS '接收日期';
COMMENT ON COLUMN proj_chxmda.xmmc IS '项目名称';
COMMENT ON COLUMN proj_chxmda.bzsm IS '备注说明';
COMMENT ON COLUMN proj_chxmda.projectdocunid IS '汇交项目的ID';

--********************************************************************************
-- 表：测绘项目资料清单 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_chxmzl (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    sszlmc            VARCHAR(100),
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
    CONSTRAINT pk_proj_chxmzl PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_chxmzl_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_chxmzl_parentdocunid ON proj_chxmzl (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_chxmzl_sys_parentrid ON proj_chxmzl (sys_parentrid);
CREATE INDEX IF NOT EXISTS idx_proj_chxmzl_zlmc ON proj_chxmzl (zlmc);

COMMENT ON TABLE proj_chxmzl IS '测绘项目资料清单';
COMMENT ON COLUMN proj_chxmzl.code IS '主键';
COMMENT ON COLUMN proj_chxmzl.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_chxmzl.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_chxmzl.sys_parentrid IS '父记录标识（关联 proj_chxmda.rid）';
COMMENT ON COLUMN proj_chxmzl.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_chxmzl.sszlmc IS '所属项目名称';
COMMENT ON COLUMN proj_chxmzl.cdbh IS '存档编号';
COMMENT ON COLUMN proj_chxmzl.zlmc IS '资料名称';
COMMENT ON COLUMN proj_chxmzl.jsbh IS '接收编号';
COMMENT ON COLUMN proj_chxmzl.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_chxmzl.hjrq IS '汇交日期';
COMMENT ON COLUMN proj_chxmzl.jsr IS '接收人';
COMMENT ON COLUMN proj_chxmzl.jzlx IS '介质类型';
COMMENT ON COLUMN proj_chxmzl.ztxs IS '载体形式';
COMMENT ON COLUMN proj_chxmzl.sl IS '数量';
COMMENT ON COLUMN proj_chxmzl.sldw IS '数量单位';
COMMENT ON COLUMN proj_chxmzl.xsx IS '现势性';
COMMENT ON COLUMN proj_chxmzl.sjlx IS '数据类型';
COMMENT ON COLUMN proj_chxmzl.sjgs IS '数据格式';
COMMENT ON COLUMN proj_chxmzl.zbxt IS '坐标系统';
COMMENT ON COLUMN proj_chxmzl.blc IS '比例尺';
COMMENT ON COLUMN proj_chxmzl.fbl IS '分辨率';
COMMENT ON COLUMN proj_chxmzl.cffqwz IS '存放服务器位置';
COMMENT ON COLUMN proj_chxmzl.bzsm IS '备注说明';
COMMENT ON COLUMN proj_chxmzl.projectdocunid IS '汇交项目的ID';
