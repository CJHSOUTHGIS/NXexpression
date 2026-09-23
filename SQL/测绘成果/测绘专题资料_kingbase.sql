--********************************************************************************
-- 表：测绘专题资料 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_chxtzl (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    jsbh              VARCHAR(100),
    zlmc              VARCHAR(100),
    cdbh              VARCHAR(100),
    jsr               VARCHAR(100),
    jsrq              VARCHAR(30),
    hjdw              VARCHAR(100),
    hjrq              VARCHAR(30),
    bzsm              VARCHAR(1000),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_chxtzl PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_chxtzl_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_chxtzl_parentdocunid ON proj_chxtzl (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_chxtzl_zlmc ON proj_chxtzl (zlmc);
CREATE INDEX IF NOT EXISTS idx_proj_chxtzl_jid ON proj_chxtzl (jid);
CREATE INDEX IF NOT EXISTS idx_proj_chxtzl_sys_parentrid ON proj_chxtzl (sys_parentrid);

COMMENT ON TABLE proj_chxtzl IS '测绘专题资料';
COMMENT ON COLUMN proj_chxtzl.code IS '主键';
COMMENT ON COLUMN proj_chxtzl.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_chxtzl.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_chxtzl.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_chxtzl.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_chxtzl.jsbh IS '接收编号';
COMMENT ON COLUMN proj_chxtzl.zlmc IS '资料名称';
COMMENT ON COLUMN proj_chxtzl.cdbh IS '存档编号';
COMMENT ON COLUMN proj_chxtzl.jsr IS '接收人';
COMMENT ON COLUMN proj_chxtzl.jsrq IS '接收日期';
COMMENT ON COLUMN proj_chxtzl.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_chxtzl.hjrq IS '汇交时间';
COMMENT ON COLUMN proj_chxtzl.bzsm IS '备注说明';
COMMENT ON COLUMN proj_chxtzl.projectdocunid IS '汇交项目的ID';

--********************************************************************************
-- 表：测绘专题资料清单 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_chxtzlqd (
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
    CONSTRAINT pk_proj_chxtzlqd PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_chxtzlqd_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_chxtzlqd_parentdocunid ON proj_chxtzlqd (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_chxtzlqd_sys_parentrid ON proj_chxtzlqd (sys_parentrid);
CREATE INDEX IF NOT EXISTS idx_proj_chxtzlqd_zlmc ON proj_chxtzlqd (zlmc);

COMMENT ON TABLE proj_chxtzlqd IS '测绘专题资料清单';
COMMENT ON COLUMN proj_chxtzlqd.code IS '主键';
COMMENT ON COLUMN proj_chxtzlqd.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_chxtzlqd.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_chxtzlqd.sys_parentrid IS '父记录标识（关联 proj_chxtzl.rid）';
COMMENT ON COLUMN proj_chxtzlqd.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_chxtzlqd.sszlmc IS '所属资料名称';
COMMENT ON COLUMN proj_chxtzlqd.cdbh IS '存档编号';
COMMENT ON COLUMN proj_chxtzlqd.zlmc IS '资料名称';
COMMENT ON COLUMN proj_chxtzlqd.jsbh IS '接收编号';
COMMENT ON COLUMN proj_chxtzlqd.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_chxtzlqd.hjrq IS '汇交日期';
COMMENT ON COLUMN proj_chxtzlqd.jsr IS '接收人';
COMMENT ON COLUMN proj_chxtzlqd.jzlx IS '介质类型';
COMMENT ON COLUMN proj_chxtzlqd.ztxs IS '载体形式';
COMMENT ON COLUMN proj_chxtzlqd.sl IS '数量';
COMMENT ON COLUMN proj_chxtzlqd.sldw IS '数量单位';
COMMENT ON COLUMN proj_chxtzlqd.xsx IS '现势性';
COMMENT ON COLUMN proj_chxtzlqd.sjlx IS '数据类型';
COMMENT ON COLUMN proj_chxtzlqd.sjgs IS '数据格式';
COMMENT ON COLUMN proj_chxtzlqd.zbxt IS '坐标系统';
COMMENT ON COLUMN proj_chxtzlqd.blc IS '比例尺';
COMMENT ON COLUMN proj_chxtzlqd.fbl IS '分辨率';
COMMENT ON COLUMN proj_chxtzlqd.cffqwz IS '存放服务器位置';
COMMENT ON COLUMN proj_chxtzlqd.bzsm IS '备注说明';
COMMENT ON COLUMN proj_chxtzlqd.projectdocunid IS '汇交项目的ID';
