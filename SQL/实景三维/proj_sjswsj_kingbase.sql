--********************************************************************************
-- 表：实景三维数据 (人大金仓)
-- 说明：基于空间规划成果字段裁剪，新增三维业务字段与 3D Tiles 预览地址
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_sjswsj (
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    projectdocunid    VARCHAR(100),
    parentdocunid     CHAR(32),
    ssxm              VARCHAR(200),
    cdbh              VARCHAR(80),
    sjmc              VARCHAR(200),
    sjlx              VARCHAR(60),
    cglx              VARCHAR(60),
    fbl               VARCHAR(30),
    blc               VARCHAR(30),
    scnf              VARCHAR(10),
    scsj              VARCHAR(20),
    zbxt              VARCHAR(100),
    gcjz              VARCHAR(100),
    ztxs              VARCHAR(30),
    sjgs              VARCHAR(30),
    sjdx              VARCHAR(50),
    bgdw              VARCHAR(200),
    scdw              VARCHAR(200),
    bzsm              VARCHAR(255),
    tfzbfw            TEXT,
    dzsj              TEXT,
    cffwqwz           VARCHAR(255),
    sjlj              VARCHAR(500),
    swfwdz            VARCHAR(500),
    zsl               VARCHAR(30),
    kcl               VARCHAR(30),
    dqbmh             VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_sjswsj PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_proj_sjswsj_sjmc ON proj_sjswsj (sjmc);
CREATE INDEX IF NOT EXISTS idx_proj_sjswsj_sjlx ON proj_sjswsj (sjlx);
CREATE INDEX IF NOT EXISTS idx_proj_sjswsj_cglx ON proj_sjswsj (cglx);
CREATE INDEX IF NOT EXISTS idx_proj_sjswsj_ssxm ON proj_sjswsj (ssxm);
CREATE INDEX IF NOT EXISTS idx_proj_sjswsj_jid ON proj_sjswsj (jid);

COMMENT ON TABLE proj_sjswsj IS '实景三维数据';
COMMENT ON COLUMN proj_sjswsj.rid IS '记录标识';
COMMENT ON COLUMN proj_sjswsj.jid IS '业务受理号';
COMMENT ON COLUMN proj_sjswsj.sys_parentrid IS '子表单记录标识';
COMMENT ON COLUMN proj_sjswsj.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_sjswsj.parentdocunid IS '旧系统文档ID(DocUNID)，迁移保留，打印旧二维码用';
COMMENT ON COLUMN proj_sjswsj.ssxm IS '所属项目';
COMMENT ON COLUMN proj_sjswsj.cdbh IS '存档编号';
COMMENT ON COLUMN proj_sjswsj.sjmc IS '数据名称';
COMMENT ON COLUMN proj_sjswsj.sjlx IS '数据类型';
COMMENT ON COLUMN proj_sjswsj.cglx IS '成果类型';
COMMENT ON COLUMN proj_sjswsj.fbl IS '精度';
COMMENT ON COLUMN proj_sjswsj.blc IS '比例尺';
COMMENT ON COLUMN proj_sjswsj.scnf IS '生产年份';
COMMENT ON COLUMN proj_sjswsj.scsj IS '生产/采集时间';
COMMENT ON COLUMN proj_sjswsj.zbxt IS '坐标系统';
COMMENT ON COLUMN proj_sjswsj.gcjz IS '高程基准';
COMMENT ON COLUMN proj_sjswsj.ztxs IS '载体形式';
COMMENT ON COLUMN proj_sjswsj.sjgs IS '数据格式';
COMMENT ON COLUMN proj_sjswsj.sjdx IS '数据大小';
COMMENT ON COLUMN proj_sjswsj.bgdw IS '保管单位';
COMMENT ON COLUMN proj_sjswsj.scdw IS '生产单位';
COMMENT ON COLUMN proj_sjswsj.bzsm IS '备注说明';
COMMENT ON COLUMN proj_sjswsj.tfzbfw IS '坐标范围';
COMMENT ON COLUMN proj_sjswsj.dzsj IS '电子数据';
COMMENT ON COLUMN proj_sjswsj.cffwqwz IS '存放服务器位置';
COMMENT ON COLUMN proj_sjswsj.sjlj IS '数据路径(3D Tiles tileset)';
COMMENT ON COLUMN proj_sjswsj.swfwdz IS '三维服务地址';
COMMENT ON COLUMN proj_sjswsj.zsl IS '总数量';
COMMENT ON COLUMN proj_sjswsj.kcl IS '库存量';
COMMENT ON COLUMN proj_sjswsj.dqbmh IS '当前保密号';
