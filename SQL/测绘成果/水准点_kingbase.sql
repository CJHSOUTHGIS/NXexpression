--********************************************************************************
-- 表：水准点 (人大金仓 - 大小写敏感，标识符统一小写)
--********************************************************************************
CREATE TABLE proj_szd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(100),
    parentdocunid     CHAR(32),
    dh                VARCHAR(100),
    dm                VARCHAR(100),
    ydm               VARCHAR(100),
    lxmc              VARCHAR(100),
    gcjz              VARCHAR(100),
    hbgc              VARCHAR(100),
    dj                VARCHAR(100),
    gjdm              VARCHAR(100),
    chnf              VARCHAR(30),
    bslx              VARCHAR(100),
    bszk              VARCHAR(100),
    cblx              VARCHAR(100),
    scdw              VARCHAR(100),
    scnd              VARCHAR(30),
    x                 VARCHAR(100),
    y                 VARCHAR(100),
    sztfh             VARCHAR(100),
    bgdw              VARCHAR(100),
    sjbs              VARCHAR(100),
    szd               VARCHAR(1000),
    bzsm              VARCHAR(1000),
    dzjwj             VARCHAR(500),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_szd PRIMARY KEY (code),
    CONSTRAINT uk_proj_szd_rid UNIQUE (rid)
);

CREATE INDEX idx_proj_szd_dh ON proj_szd (dh);
CREATE INDEX idx_proj_szd_dm ON proj_szd (dm);
CREATE INDEX idx_proj_szd_jid ON proj_szd (jid);
CREATE INDEX idx_proj_szd_sys_parentrid ON proj_szd (sys_parentrid);

CREATE SEQUENCE proj_szd_code_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999999999
    MINVALUE 1
    NO CYCLE
    CACHE 5;

COMMENT ON TABLE proj_szd IS '水准点';
COMMENT ON COLUMN proj_szd.code IS '主键';
COMMENT ON COLUMN proj_szd.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_szd.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_szd.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_szd.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_szd.dh IS '点号';
COMMENT ON COLUMN proj_szd.dm IS '点名';
COMMENT ON COLUMN proj_szd.ydm IS '原点名';
COMMENT ON COLUMN proj_szd.lxmc IS '路线名称';
COMMENT ON COLUMN proj_szd.gcjz IS '高程基准';
COMMENT ON COLUMN proj_szd.hbgc IS '海拔高程';
COMMENT ON COLUMN proj_szd.dj IS '等级';
COMMENT ON COLUMN proj_szd.gjdm IS '国际代码';
COMMENT ON COLUMN proj_szd.chnf IS '建造年代';
COMMENT ON COLUMN proj_szd.bslx IS '标石类型';
COMMENT ON COLUMN proj_szd.bszk IS '标石状况';
COMMENT ON COLUMN proj_szd.cblx IS '测标类型';
COMMENT ON COLUMN proj_szd.scdw IS '施测单位';
COMMENT ON COLUMN proj_szd.scnd IS '施测年代';
COMMENT ON COLUMN proj_szd.x IS '经度';
COMMENT ON COLUMN proj_szd.y IS '纬度';
COMMENT ON COLUMN proj_szd.sztfh IS '所在图幅号';
COMMENT ON COLUMN proj_szd.bgdw IS '保管单位';
COMMENT ON COLUMN proj_szd.sjbs IS '数据标识';
COMMENT ON COLUMN proj_szd.szd IS '坐落描述';
COMMENT ON COLUMN proj_szd.bzsm IS '备注说明';
COMMENT ON COLUMN proj_szd.dzjwj IS '点之记文件';
COMMENT ON COLUMN proj_szd.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_szd.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_szd.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_szd.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_szd.lastmodifyuser IS '最近修改用户';
