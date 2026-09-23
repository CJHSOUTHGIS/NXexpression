--********************************************************************************

-- 表：土地资料登记表 (人大金仓)

--********************************************************************************

CREATE TABLE IF NOT EXISTS proj_tdzl (

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

    hjqd              TEXT,

    projectdocunid    VARCHAR(100),

    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,

    createuser        VARCHAR(50),

    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,

    lastmodifyuser    VARCHAR(50),

    CONSTRAINT pk_proj_tdzl PRIMARY KEY (rid)

);



CREATE SEQUENCE IF NOT EXISTS proj_tdzl_code_seq

    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;



CREATE INDEX IF NOT EXISTS idx_proj_tdzl_parentdocunid ON proj_tdzl (parentdocunid);

CREATE INDEX IF NOT EXISTS idx_proj_tdzl_zlmc ON proj_tdzl (zlmc);

CREATE INDEX IF NOT EXISTS idx_proj_tdzl_jid ON proj_tdzl (jid);

CREATE INDEX IF NOT EXISTS idx_proj_tdzl_sys_parentrid ON proj_tdzl (sys_parentrid);



COMMENT ON TABLE proj_tdzl IS '土地资料登记表';

COMMENT ON COLUMN proj_tdzl.code IS '主键';

COMMENT ON COLUMN proj_tdzl.rid IS '记录唯一标识';

COMMENT ON COLUMN proj_tdzl.jid IS '工作流实例ID';

COMMENT ON COLUMN proj_tdzl.sys_parentrid IS '父记录标识';

COMMENT ON COLUMN proj_tdzl.parentdocunid IS '所属文档对象的ID';

COMMENT ON COLUMN proj_tdzl.jsbh IS '接收编号';

COMMENT ON COLUMN proj_tdzl.zlmc IS '资料名称';

COMMENT ON COLUMN proj_tdzl.cdbh IS '存档编号';

COMMENT ON COLUMN proj_tdzl.jsr IS '接收人';

COMMENT ON COLUMN proj_tdzl.jsrq IS '接收日期';

COMMENT ON COLUMN proj_tdzl.hjdw IS '汇交单位';

COMMENT ON COLUMN proj_tdzl.hjrq IS '汇交时间';

COMMENT ON COLUMN proj_tdzl.bzsm IS '备注说明';

COMMENT ON COLUMN proj_tdzl.hjqd IS '汇交清单';

COMMENT ON COLUMN proj_tdzl.projectdocunid IS '汇交项目的ID';

ALTER TABLE proj_tdzl ADD COLUMN IF NOT EXISTS hjqd TEXT;

COMMENT ON COLUMN proj_tdzl.hjqd IS '汇交清单';



--********************************************************************************

-- 表：土地资料清单 (人大金仓)

--********************************************************************************

CREATE TABLE IF NOT EXISTS proj_tdzlqd (

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

    CONSTRAINT pk_proj_tdzlqd PRIMARY KEY (rid)

);



CREATE SEQUENCE IF NOT EXISTS proj_tdzlqd_code_seq

    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;



CREATE INDEX IF NOT EXISTS idx_proj_tdzlqd_parentdocunid ON proj_tdzlqd (parentdocunid);

CREATE INDEX IF NOT EXISTS idx_proj_tdzlqd_sys_parentrid ON proj_tdzlqd (sys_parentrid);

CREATE INDEX IF NOT EXISTS idx_proj_tdzlqd_zlmc ON proj_tdzlqd (zlmc);



COMMENT ON TABLE proj_tdzlqd IS '土地资料清单';

COMMENT ON COLUMN proj_tdzlqd.code IS '主键';

COMMENT ON COLUMN proj_tdzlqd.rid IS '记录唯一标识';

COMMENT ON COLUMN proj_tdzlqd.jid IS '工作流实例ID';

COMMENT ON COLUMN proj_tdzlqd.sys_parentrid IS '父记录标识（关联 proj_tdzl.rid）';

COMMENT ON COLUMN proj_tdzlqd.parentdocunid IS '所属文档对象的ID';

COMMENT ON COLUMN proj_tdzlqd.sszlmc IS '所属资料名称';

COMMENT ON COLUMN proj_tdzlqd.cdbh IS '存档编号';

COMMENT ON COLUMN proj_tdzlqd.zlmc IS '资料名称';

COMMENT ON COLUMN proj_tdzlqd.jsbh IS '接收编号';

COMMENT ON COLUMN proj_tdzlqd.hjdw IS '汇交单位';

COMMENT ON COLUMN proj_tdzlqd.hjrq IS '汇交日期';

COMMENT ON COLUMN proj_tdzlqd.jsr IS '接收人';

COMMENT ON COLUMN proj_tdzlqd.jzlx IS '介质类型';

COMMENT ON COLUMN proj_tdzlqd.ztxs IS '载体形式';

COMMENT ON COLUMN proj_tdzlqd.sl IS '数量';

COMMENT ON COLUMN proj_tdzlqd.sldw IS '数量单位';

COMMENT ON COLUMN proj_tdzlqd.xsx IS '现势性';

COMMENT ON COLUMN proj_tdzlqd.sjlx IS '数据类型';

COMMENT ON COLUMN proj_tdzlqd.sjgs IS '数据格式';

COMMENT ON COLUMN proj_tdzlqd.zbxt IS '坐标系统';

COMMENT ON COLUMN proj_tdzlqd.blc IS '比例尺';

COMMENT ON COLUMN proj_tdzlqd.fbl IS '分辨率';

COMMENT ON COLUMN proj_tdzlqd.cffqwz IS '存放服务器位置';

COMMENT ON COLUMN proj_tdzlqd.bzsm IS '备注说明';

COMMENT ON COLUMN proj_tdzlqd.projectdocunid IS '汇交项目的ID';


