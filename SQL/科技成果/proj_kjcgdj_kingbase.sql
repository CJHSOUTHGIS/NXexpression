--********************************************************************************
-- 表：科技成果登记表 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_kjcgdj (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    cgmc              VARCHAR(100),
    djsj              VARCHAR(30),
    wcdw              VARCHAR(100),
    tjdw              VARCHAR(100),
    yjqssj            VARCHAR(30),
    yjzzsj            VARCHAR(30),
    ktlxbh            VARCHAR(100),
    sjxmjf            VARCHAR(30),
    gjc               VARCHAR(100),
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
    CONSTRAINT pk_proj_kjcgdj PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_kjcgdj_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_kjcgdj_parentdocunid ON proj_kjcgdj (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_kjcgdj_cgmc ON proj_kjcgdj (cgmc);
CREATE INDEX IF NOT EXISTS idx_proj_kjcgdj_jid ON proj_kjcgdj (jid);
CREATE INDEX IF NOT EXISTS idx_proj_kjcgdj_sys_parentrid ON proj_kjcgdj (sys_parentrid);

COMMENT ON TABLE proj_kjcgdj IS '科技成果登记表';
COMMENT ON COLUMN proj_kjcgdj.code IS '序号';
COMMENT ON COLUMN proj_kjcgdj.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_kjcgdj.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_kjcgdj.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_kjcgdj.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_kjcgdj.cgmc IS '成果名称';
COMMENT ON COLUMN proj_kjcgdj.djsj IS '登记时间';
COMMENT ON COLUMN proj_kjcgdj.wcdw IS '完成单位';
COMMENT ON COLUMN proj_kjcgdj.tjdw IS '推荐单位';
COMMENT ON COLUMN proj_kjcgdj.yjqssj IS '研究起始时间';
COMMENT ON COLUMN proj_kjcgdj.yjzzsj IS '研究终止时间';
COMMENT ON COLUMN proj_kjcgdj.ktlxbh IS '课题立项编号';
COMMENT ON COLUMN proj_kjcgdj.sjxmjf IS '实际项目经费';
COMMENT ON COLUMN proj_kjcgdj.gjc IS '关键词';
COMMENT ON COLUMN proj_kjcgdj.bzsm IS '备注说明';
COMMENT ON COLUMN proj_kjcgdj.jsbh IS '接收编号';
COMMENT ON COLUMN proj_kjcgdj.jsrq IS '接收日期';
COMMENT ON COLUMN proj_kjcgdj.jsr IS '接收人';
COMMENT ON COLUMN proj_kjcgdj.hjdw IS '汇交单位';
COMMENT ON COLUMN proj_kjcgdj.hjr IS '汇交人';
COMMENT ON COLUMN proj_kjcgdj.cdbh IS '存档编号';
COMMENT ON COLUMN proj_kjcgdj.zzdawz IS '纸质档案位置';
COMMENT ON COLUMN proj_kjcgdj.dzdawz IS '电子档案位置';
COMMENT ON COLUMN proj_kjcgdj.dzsj IS '电子资料数据';
COMMENT ON COLUMN proj_kjcgdj.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_kjcgdj.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_kjcgdj.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_kjcgdj.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_kjcgdj.lastmodifyuser IS '最近修改用户';
