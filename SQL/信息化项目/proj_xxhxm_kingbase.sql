--********************************************************************************

-- 表：信息化项目登记表 (人大金仓)

--********************************************************************************

CREATE TABLE IF NOT EXISTS proj_xxhxm (

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

    CONSTRAINT pk_proj_xxhxm PRIMARY KEY (rid)

);



CREATE SEQUENCE IF NOT EXISTS proj_xxhxm_code_seq

    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;



CREATE INDEX IF NOT EXISTS idx_proj_xxhxm_parentdocunid ON proj_xxhxm (parentdocunid);

CREATE INDEX IF NOT EXISTS idx_proj_xxhxm_zlmc ON proj_xxhxm (zlmc);

CREATE INDEX IF NOT EXISTS idx_proj_xxhxm_jid ON proj_xxhxm (jid);

CREATE INDEX IF NOT EXISTS idx_proj_xxhxm_sys_parentrid ON proj_xxhxm (sys_parentrid);



COMMENT ON TABLE proj_xxhxm IS '信息化项目登记表';

COMMENT ON COLUMN proj_xxhxm.code IS '主键';

COMMENT ON COLUMN proj_xxhxm.rid IS '记录唯一标识';

COMMENT ON COLUMN proj_xxhxm.jid IS '工作流实例ID';

COMMENT ON COLUMN proj_xxhxm.sys_parentrid IS '父记录标识';

COMMENT ON COLUMN proj_xxhxm.parentdocunid IS '所属文档对象的ID';

COMMENT ON COLUMN proj_xxhxm.jsbh IS '接收编号';

COMMENT ON COLUMN proj_xxhxm.zlmc IS '资料名称';

COMMENT ON COLUMN proj_xxhxm.cdbh IS '存档编号';

COMMENT ON COLUMN proj_xxhxm.jsr IS '接收人';

COMMENT ON COLUMN proj_xxhxm.jsrq IS '接收日期';

COMMENT ON COLUMN proj_xxhxm.hjdw IS '汇交单位';

COMMENT ON COLUMN proj_xxhxm.hjrq IS '汇交时间';

COMMENT ON COLUMN proj_xxhxm.bzsm IS '备注说明';

COMMENT ON COLUMN proj_xxhxm.hjqd IS '汇交清单';

COMMENT ON COLUMN proj_xxhxm.projectdocunid IS '汇交项目的ID';

ALTER TABLE proj_xxhxm ADD COLUMN IF NOT EXISTS hjqd TEXT;

COMMENT ON COLUMN proj_xxhxm.hjqd IS '汇交清单';



--********************************************************************************

-- 表：信息化项目清单 (人大金仓)

--********************************************************************************

CREATE TABLE IF NOT EXISTS proj_xxhxmqd (

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

    CONSTRAINT pk_proj_xxhxmqd PRIMARY KEY (rid)

);



CREATE SEQUENCE IF NOT EXISTS proj_xxhxmqd_code_seq

    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;



CREATE INDEX IF NOT EXISTS idx_proj_xxhxmqd_parentdocunid ON proj_xxhxmqd (parentdocunid);

CREATE INDEX IF NOT EXISTS idx_proj_xxhxmqd_sys_parentrid ON proj_xxhxmqd (sys_parentrid);

CREATE INDEX IF NOT EXISTS idx_proj_xxhxmqd_zlmc ON proj_xxhxmqd (zlmc);



COMMENT ON TABLE proj_xxhxmqd IS '信息化项目清单';

COMMENT ON COLUMN proj_xxhxmqd.code IS '主键';

COMMENT ON COLUMN proj_xxhxmqd.rid IS '记录唯一标识';

COMMENT ON COLUMN proj_xxhxmqd.jid IS '工作流实例ID';

COMMENT ON COLUMN proj_xxhxmqd.sys_parentrid IS '父记录标识（关联 proj_xxhxm.rid）';

COMMENT ON COLUMN proj_xxhxmqd.parentdocunid IS '所属文档对象的ID';

COMMENT ON COLUMN proj_xxhxmqd.sszlmc IS '所属资料名称';

COMMENT ON COLUMN proj_xxhxmqd.cdbh IS '存档编号';

COMMENT ON COLUMN proj_xxhxmqd.zlmc IS '资料名称';

COMMENT ON COLUMN proj_xxhxmqd.jsbh IS '接收编号';

COMMENT ON COLUMN proj_xxhxmqd.hjdw IS '汇交单位';

COMMENT ON COLUMN proj_xxhxmqd.hjrq IS '汇交日期';

COMMENT ON COLUMN proj_xxhxmqd.jsr IS '接收人';

COMMENT ON COLUMN proj_xxhxmqd.jzlx IS '介质类型';

COMMENT ON COLUMN proj_xxhxmqd.ztxs IS '载体形式';

COMMENT ON COLUMN proj_xxhxmqd.sl IS '数量';

COMMENT ON COLUMN proj_xxhxmqd.sldw IS '数量单位';

COMMENT ON COLUMN proj_xxhxmqd.xsx IS '现势性';

COMMENT ON COLUMN proj_xxhxmqd.sjlx IS '数据类型';

COMMENT ON COLUMN proj_xxhxmqd.sjgs IS '数据格式';

COMMENT ON COLUMN proj_xxhxmqd.zbxt IS '坐标系统';

COMMENT ON COLUMN proj_xxhxmqd.blc IS '比例尺';

COMMENT ON COLUMN proj_xxhxmqd.fbl IS '分辨率';

COMMENT ON COLUMN proj_xxhxmqd.cffqwz IS '存放服务器位置';

COMMENT ON COLUMN proj_xxhxmqd.bzsm IS '备注说明';

COMMENT ON COLUMN proj_xxhxmqd.projectdocunid IS '汇交项目的ID';


