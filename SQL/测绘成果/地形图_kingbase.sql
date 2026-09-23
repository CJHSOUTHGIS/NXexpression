--********************************************************************************
-- 表：基本地形图 (人大金仓)
-- 说明：字段与用户提供的 mappupil.proj_jbdxt 一致，并补充 smap 通用审计字段
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_jbdxt (
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    projectdocunid    VARCHAR(100),
    parentdocunid     CHAR(32),
    ssxm              VARCHAR(200),
    cdbh              VARCHAR(80),
    sjlx              VARCHAR(60),
    blc               VARCHAR(30),
    scnf              VARCHAR(100),
    xth               VARCHAR(30),
    jth               VARCHAR(30),
    tm                VARCHAR(150),
    zbxt              VARCHAR(100),
    gcjz              VARCHAR(100),
    ztxs              VARCHAR(30),
    tsbb              VARCHAR(30),
    tfdgj             VARCHAR(30),
    sjgs              VARCHAR(30),
    sjdx              VARCHAR(50),
    bgdw              VARCHAR(200),
    scdw              VARCHAR(200),
    bzsm              VARCHAR(255),
    tfzbfw            TEXT,
    dzsj              TEXT,
    cffwqwz           VARCHAR(255),
    zsl               VARCHAR(30),
    kcl               VARCHAR(30),
    pc                VARCHAR(30),
    dqbmh             VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_jbdxt PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_xth ON proj_jbdxt (xth);
CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_jth ON proj_jbdxt (jth);
CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_tm ON proj_jbdxt (tm);
CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_ssxm ON proj_jbdxt (ssxm);
CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_jid ON proj_jbdxt (jid);

COMMENT ON TABLE proj_jbdxt IS '基本地形图';
COMMENT ON COLUMN proj_jbdxt.rid IS '记录标识';
COMMENT ON COLUMN proj_jbdxt.jid IS '业务受理号';
COMMENT ON COLUMN proj_jbdxt.sys_parentrid IS '子表单记录标识';
COMMENT ON COLUMN proj_jbdxt.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_jbdxt.parentdocunid IS '旧系统文档ID(DocUNID)，迁移保留，打印旧二维码用';
COMMENT ON COLUMN proj_jbdxt.ssxm IS '所属项目';
COMMENT ON COLUMN proj_jbdxt.cdbh IS '存档编号';
COMMENT ON COLUMN proj_jbdxt.sjlx IS '数据类型';
COMMENT ON COLUMN proj_jbdxt.blc IS '比例尺';
COMMENT ON COLUMN proj_jbdxt.scnf IS '生产年份';
COMMENT ON COLUMN proj_jbdxt.xth IS '新图号';
COMMENT ON COLUMN proj_jbdxt.jth IS '旧图号';
COMMENT ON COLUMN proj_jbdxt.tm IS '图名';
COMMENT ON COLUMN proj_jbdxt.zbxt IS '坐标系统';
COMMENT ON COLUMN proj_jbdxt.gcjz IS '高程基准';
COMMENT ON COLUMN proj_jbdxt.ztxs IS '载体形式';
COMMENT ON COLUMN proj_jbdxt.tsbb IS '图式版本';
COMMENT ON COLUMN proj_jbdxt.tfdgj IS '图幅等高距';
COMMENT ON COLUMN proj_jbdxt.sjgs IS '数据格式';
COMMENT ON COLUMN proj_jbdxt.sjdx IS '数据大小';
COMMENT ON COLUMN proj_jbdxt.bgdw IS '保管单位';
COMMENT ON COLUMN proj_jbdxt.scdw IS '生产单位';
COMMENT ON COLUMN proj_jbdxt.bzsm IS '备注说明';
COMMENT ON COLUMN proj_jbdxt.tfzbfw IS '图幅坐标范围';
COMMENT ON COLUMN proj_jbdxt.dzsj IS '电子数据';
COMMENT ON COLUMN proj_jbdxt.cffwqwz IS '存放服务器位置';
COMMENT ON COLUMN proj_jbdxt.zsl IS '总数量';
COMMENT ON COLUMN proj_jbdxt.kcl IS '库存量';
COMMENT ON COLUMN proj_jbdxt.pc IS '批次';
COMMENT ON COLUMN proj_jbdxt.dqbmh IS '当前保密号';
