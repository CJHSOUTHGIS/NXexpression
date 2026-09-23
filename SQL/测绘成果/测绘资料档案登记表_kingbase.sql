--********************************************************************************
-- 表：测绘资料档案登记表 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_chzlda (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    zlmc              VARCHAR(300),
    dalx              VARCHAR(100),
    dahmc             VARCHAR(100),
    zzdawz            VARCHAR(200),
    dzdawz            VARCHAR(200),
    xsmc              VARCHAR(256),
    scdw              VARCHAR(100),
    scsj              VARCHAR(100),
    kcl               VARCHAR(100),
    blc               VARCHAR(100),
    dtbs              VARCHAR(100),
    pf                VARCHAR(100),
    bz                VARCHAR(1000),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_chzlda PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_chzlda_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_chzlda_parentdocunid ON proj_chzlda (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_chzlda_zlmc ON proj_chzlda (zlmc);
CREATE INDEX IF NOT EXISTS idx_proj_chzlda_dalx ON proj_chzlda (dalx);
CREATE INDEX IF NOT EXISTS idx_proj_chzlda_dahmc ON proj_chzlda (dahmc);
CREATE INDEX IF NOT EXISTS idx_proj_chzlda_jid ON proj_chzlda (jid);
CREATE INDEX IF NOT EXISTS idx_proj_chzlda_sys_parentrid ON proj_chzlda (sys_parentrid);

COMMENT ON TABLE proj_chzlda IS '测绘资料档案登记表';
COMMENT ON COLUMN proj_chzlda.code IS '主键';
COMMENT ON COLUMN proj_chzlda.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_chzlda.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_chzlda.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_chzlda.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_chzlda.zlmc IS '资料名称';
COMMENT ON COLUMN proj_chzlda.dalx IS '档案类型';
COMMENT ON COLUMN proj_chzlda.dahmc IS '档案盒名称';
COMMENT ON COLUMN proj_chzlda.zzdawz IS '纸质档案位置';
COMMENT ON COLUMN proj_chzlda.dzdawz IS '电子档案位置';
COMMENT ON COLUMN proj_chzlda.xsmc IS '显示名称';
COMMENT ON COLUMN proj_chzlda.scdw IS '生产单位';
COMMENT ON COLUMN proj_chzlda.scsj IS '生产时间';
COMMENT ON COLUMN proj_chzlda.kcl IS '库存量';
COMMENT ON COLUMN proj_chzlda.blc IS '比例尺';
COMMENT ON COLUMN proj_chzlda.dtbs IS '地图版式';
COMMENT ON COLUMN proj_chzlda.pf IS '拼幅';
COMMENT ON COLUMN proj_chzlda.bz IS '备注';
COMMENT ON COLUMN proj_chzlda.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_chzlda.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_chzlda.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_chzlda.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_chzlda.lastmodifyuser IS '最近修改用户';
