--********************************************************************************
-- 表：航摄影像 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_hangpian (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    zlmc              VARCHAR(100),
    sjlx              VARCHAR(100),
    hpbh              VARCHAR(100),
    fbl               VARCHAR(100),
    blc               VARCHAR(100),
    ztxs              VARCHAR(100),
    sjgs              VARCHAR(100),
    sjdx              VARCHAR(100),
    dxdm              VARCHAR(100),
    jdhg              VARCHAR(100),
    color             VARCHAR(100),
    psdw              VARCHAR(100),
    pssj              VARCHAR(30),
    bgdw              VARCHAR(100),
    jzlx              VARCHAR(100),
    bzsm              VARCHAR(1000),
    dzsj              TEXT,
    rangedata         VARCHAR(4000),
    minx              VARCHAR(100),
    maxx              VARCHAR(100),
    miny              VARCHAR(100),
    maxy              VARCHAR(100),
    pc                VARCHAR(100),
    zsl               VARCHAR(100),
    kcl               VARCHAR(100),
    dqbmh             VARCHAR(200),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_hangpian PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_hangpian_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

COMMENT ON TABLE proj_hangpian IS '航摄影像';
COMMENT ON COLUMN proj_hangpian.zlmc IS '资料名称';
COMMENT ON COLUMN proj_hangpian.sjlx IS '数据类型';
COMMENT ON COLUMN proj_hangpian.hpbh IS '影像编号';
COMMENT ON COLUMN proj_hangpian.fbl IS '精度';
COMMENT ON COLUMN proj_hangpian.blc IS '比例尺';
COMMENT ON COLUMN proj_hangpian.ztxs IS '载体形式';
COMMENT ON COLUMN proj_hangpian.sjgs IS '数据格式';
COMMENT ON COLUMN proj_hangpian.sjdx IS '数据大小';
COMMENT ON COLUMN proj_hangpian.dxdm IS '地形地貌';
COMMENT ON COLUMN proj_hangpian.jdhg IS '绝对航高';
COMMENT ON COLUMN proj_hangpian.color IS '色彩';
COMMENT ON COLUMN proj_hangpian.psdw IS '拍摄单位';
COMMENT ON COLUMN proj_hangpian.pssj IS '拍摄时间';
COMMENT ON COLUMN proj_hangpian.bgdw IS '保管单位';
COMMENT ON COLUMN proj_hangpian.jzlx IS '介质类型';
COMMENT ON COLUMN proj_hangpian.bzsm IS '备注说明';
COMMENT ON COLUMN proj_hangpian.dzsj IS '电子数据';
COMMENT ON COLUMN proj_hangpian.rangedata IS '范围坐标';
COMMENT ON COLUMN proj_hangpian.dqbmh IS '当前保密号';

--********************************************************************************
-- 视图：航摄影像 (人大金仓)
-- 参考：V_PROJ_JBDXT
--********************************************************************************
CREATE OR REPLACE VIEW VIEW_HANGPIAN AS
SELECT
    rec.zlmc              AS "资料名称",
    rec.sjlx              AS "数据类型",
    rec.hpbh              AS "影像编号",
    rec.fbl               AS "精度",
    rec.blc               AS "比例尺",
    rec.ztxs              AS "载体形式",
    rec.sjgs              AS "数据格式",
    rec.sjdx              AS "数据大小",
    rec.dxdm              AS "地形地貌",
    rec.jdhg              AS "绝对航高",
    rec.color             AS "色彩",
    rec.psdw              AS "拍摄单位",
    rec.pssj              AS "拍摄时间",
    rec.bgdw              AS "保管单位",
    rec.jzlx              AS "介质类型",
    rec.bzsm              AS "备注说明",
    rec.rangedata         AS "RANGEDATA",
    rec.minx              AS "MINX",
    rec.maxx              AS "MAXX",
    rec.miny              AS "MINY",
    rec.maxy              AS "MAXY",
    rec.pc                AS "批次",
    rec.zsl               AS "总数量",
    rec.kcl               AS "库存量",
    rec.dqbmh             AS "当前保密号",
    rec.rid               AS "RID",
    rec.jid               AS "JID",
    rec.sys_parentrid     AS "SYS_PARENTRID",
    rec.projectdocunid    AS "PROJECTDOCUNID"
FROM proj_hangpian rec;

GRANT SELECT ON VIEW_HANGPIAN TO public;

-- 已有库升级：增加电子数据字段
ALTER TABLE proj_hangpian ADD COLUMN IF NOT EXISTS dzsj TEXT;
COMMENT ON COLUMN proj_hangpian.dzsj IS '电子数据';
