--********************************************************************************
-- 表：卫星影像 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_weipian (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    zlmc              VARCHAR(100),
    sjlx              VARCHAR(100),
    wpbh              VARCHAR(100),
    fbl               VARCHAR(100),
    blc               VARCHAR(100),
    ztxs              VARCHAR(100),
    sjgs              VARCHAR(100),
    sjdx              VARCHAR(100),
    psdw              VARCHAR(100),
    pssj              VARCHAR(30),
    wxlx              VARCHAR(100),
    color             VARCHAR(100),
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
    CONSTRAINT pk_proj_weipian PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_weipian_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

COMMENT ON TABLE proj_weipian IS '卫星影像';
COMMENT ON COLUMN proj_weipian.zlmc IS '资料名称';
COMMENT ON COLUMN proj_weipian.sjlx IS '数据类型';
COMMENT ON COLUMN proj_weipian.wpbh IS '影像编号';
COMMENT ON COLUMN proj_weipian.fbl IS '精度';
COMMENT ON COLUMN proj_weipian.blc IS '比例尺';
COMMENT ON COLUMN proj_weipian.wxlx IS '卫星类型';
COMMENT ON COLUMN proj_weipian.dzsj IS '电子数据';
COMMENT ON COLUMN proj_weipian.rangedata IS '范围坐标';
COMMENT ON COLUMN proj_weipian.dqbmh IS '当前保密号';

--********************************************************************************
-- 视图：卫星影像 (人大金仓)
-- 参考：V_PROJ_JBDXT
--********************************************************************************
CREATE OR REPLACE VIEW VIEW_WEIPIAN AS
SELECT
    rec.zlmc              AS "资料名称",
    rec.sjlx              AS "数据类型",
    rec.wpbh              AS "影像编号",
    rec.fbl               AS "精度",
    rec.blc               AS "比例尺",
    rec.ztxs              AS "载体形式",
    rec.sjgs              AS "数据格式",
    rec.sjdx              AS "数据大小",
    rec.psdw              AS "拍摄单位",
    rec.pssj              AS "拍摄时间",
    rec.wxlx              AS "卫星类型",
    rec.color             AS "色彩",
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
FROM proj_weipian rec;

GRANT SELECT ON VIEW_WEIPIAN TO public;

-- 已有库升级：增加电子数据字段
ALTER TABLE proj_weipian ADD COLUMN IF NOT EXISTS dzsj TEXT;
COMMENT ON COLUMN proj_weipian.dzsj IS '电子数据';
