--********************************************************************************
-- 表：空间规划成果 (人大金仓)
-- 说明：基于基本地形图字段裁剪，新增成果类型/规划类型/成果名称
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_kjghcg (
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    projectdocunid    VARCHAR(100),
    parentdocunid     CHAR(32),
    ssxm              VARCHAR(200),
    cdbh              VARCHAR(80),
    cglx              VARCHAR(60),
    ghlx              VARCHAR(60),
    cgmc              VARCHAR(200),
    blc               VARCHAR(30),
    scnf              VARCHAR(10),
    zbxt              VARCHAR(100),
    ztxs              VARCHAR(30),
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
    dqbmh             VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_kjghcg PRIMARY KEY (rid)
);

CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_cgmc ON proj_kjghcg (cgmc);
CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_cglx ON proj_kjghcg (cglx);
CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_ghlx ON proj_kjghcg (ghlx);
CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_ssxm ON proj_kjghcg (ssxm);
CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_jid ON proj_kjghcg (jid);

COMMENT ON TABLE proj_kjghcg IS '空间规划成果';
COMMENT ON COLUMN proj_kjghcg.rid IS '记录标识';
COMMENT ON COLUMN proj_kjghcg.jid IS '业务受理号';
COMMENT ON COLUMN proj_kjghcg.sys_parentrid IS '子表单记录标识';
COMMENT ON COLUMN proj_kjghcg.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_kjghcg.parentdocunid IS '旧系统文档ID(DocUNID)，迁移保留，打印旧二维码用';
COMMENT ON COLUMN proj_kjghcg.ssxm IS '所属项目';
COMMENT ON COLUMN proj_kjghcg.cdbh IS '存档编号';
COMMENT ON COLUMN proj_kjghcg.cglx IS '成果类型';
COMMENT ON COLUMN proj_kjghcg.ghlx IS '规划类型';
COMMENT ON COLUMN proj_kjghcg.cgmc IS '成果名称';
COMMENT ON COLUMN proj_kjghcg.blc IS '比例尺';
COMMENT ON COLUMN proj_kjghcg.scnf IS '生产年份';
COMMENT ON COLUMN proj_kjghcg.zbxt IS '坐标系统';
COMMENT ON COLUMN proj_kjghcg.ztxs IS '载体形式';
COMMENT ON COLUMN proj_kjghcg.sjgs IS '数据格式';
COMMENT ON COLUMN proj_kjghcg.sjdx IS '数据大小';
COMMENT ON COLUMN proj_kjghcg.bgdw IS '保管单位';
COMMENT ON COLUMN proj_kjghcg.scdw IS '生产单位';
COMMENT ON COLUMN proj_kjghcg.bzsm IS '备注说明';
COMMENT ON COLUMN proj_kjghcg.tfzbfw IS '坐标范围';
COMMENT ON COLUMN proj_kjghcg.dzsj IS '电子数据';
COMMENT ON COLUMN proj_kjghcg.cffwqwz IS '存放服务器位置';
COMMENT ON COLUMN proj_kjghcg.zsl IS '总数量';
COMMENT ON COLUMN proj_kjghcg.kcl IS '库存量';
COMMENT ON COLUMN proj_kjghcg.dqbmh IS '当前保密号';
