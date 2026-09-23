--********************************************************************************
-- 表：科学技术奖推荐书 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_kxjsjtj (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    xmlb              VARCHAR(100),
    xmbh              VARCHAR(100),
    tjsj              VARCHAR(30),
    sbdw              VARCHAR(100),
    sbr               VARCHAR(100),
    tjdw              VARCHAR(100),
    xmmc              VARCHAR(100),
    sqjx              VARCHAR(100),
    ztc               VARCHAR(100),
    bzsm              VARCHAR(1000),
    jsbh              VARCHAR(100),
    jsrq              VARCHAR(30),
    jsr               VARCHAR(100),
    hjdw              VARCHAR(100),
    hjr               VARCHAR(100),
    cdbh              VARCHAR(100),
    zzdawz            VARCHAR(200),
    dzdawz            VARCHAR(200),
    dzsj              TEXT,
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_kxjsjtj PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_kxjsjtj_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_kxjsjtj_parentdocunid ON proj_kxjsjtj (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_kxjsjtj_xmmc ON proj_kxjsjtj (xmmc);
CREATE INDEX IF NOT EXISTS idx_proj_kxjsjtj_jid ON proj_kxjsjtj (jid);
CREATE INDEX IF NOT EXISTS idx_proj_kxjsjtj_sys_parentrid ON proj_kxjsjtj (sys_parentrid);

COMMENT ON TABLE proj_kxjsjtj IS '科学技术奖推荐书';
COMMENT ON COLUMN proj_kxjsjtj.code IS '序号';
COMMENT ON COLUMN proj_kxjsjtj.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_kxjsjtj.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_kxjsjtj.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_kxjsjtj.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_kxjsjtj.xmlb IS '项目类别';
COMMENT ON COLUMN proj_kxjsjtj.xmbh IS '项目编号';
COMMENT ON COLUMN proj_kxjsjtj.tjsj IS '推荐时间';
COMMENT ON COLUMN proj_kxjsjtj.sbdw IS '申报单位';
COMMENT ON COLUMN proj_kxjsjtj.sbr IS '申报人';
COMMENT ON COLUMN proj_kxjsjtj.tjdw IS '推荐单位';
COMMENT ON COLUMN proj_kxjsjtj.xmmc IS '项目名称';
COMMENT ON COLUMN proj_kxjsjtj.sqjx IS '申请奖项';
COMMENT ON COLUMN proj_kxjsjtj.ztc IS '主题词';
COMMENT ON COLUMN proj_kxjsjtj.bzsm IS '备注说明';
COMMENT ON COLUMN proj_kxjsjtj.jsbh IS '接收编号';
COMMENT ON COLUMN proj_kxjsjtj.jsrq IS '接收日期';
COMMENT ON COLUMN proj_kxjsjtj.jsr IS '接收人';
COMMENT ON COLUMN proj_kxjsjtj.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_kxjsjtj.hjr IS '汇交人';
COMMENT ON COLUMN proj_kxjsjtj.cdbh IS '存档编号';
COMMENT ON COLUMN proj_kxjsjtj.zzdawz IS '纸质档案位置';
COMMENT ON COLUMN proj_kxjsjtj.dzdawz IS '电子档案位置';
COMMENT ON COLUMN proj_kxjsjtj.dzsj IS '电子资料数据';
COMMENT ON COLUMN proj_kxjsjtj.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_kxjsjtj.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_kxjsjtj.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_kxjsjtj.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_kxjsjtj.lastmodifyuser IS '最近修改用户';
