--********************************************************************************
-- 表：GPS控制点 (人大金仓 - 大小写敏感，标识符统一小写)
--********************************************************************************
CREATE TABLE proj_gpsd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(100),
    parentdocunid     CHAR(32),
    dh                VARCHAR(30),
    dm                VARCHAR(100),
    ydm               VARCHAR(100),
    dj                VARCHAR(100),
    sztfh             VARCHAR(100),
    chnf              VARCHAR(30),
    bslx              VARCHAR(100),
    bszk              VARCHAR(100),
    scdw              VARCHAR(100),
    scnd              VARCHAR(30),
    cblx              VARCHAR(100),
    gjdm              VARCHAR(100),
    zbxt1             VARCHAR(100),
    x6_1              VARCHAR(100),
    y6_1              VARCHAR(100),
    x3_1              VARCHAR(100),
    y3_1              VARCHAR(100),
    jd1               VARCHAR(100),
    wd1               VARCHAR(100),
    zbxt2             VARCHAR(100),
    x6_2              VARCHAR(100),
    y6_2              VARCHAR(100),
    x3_2              VARCHAR(100),
    y3_2              VARCHAR(100),
    jd2               VARCHAR(100),
    wd2               VARCHAR(100),
    zbxt3             VARCHAR(100),
    x6_3              VARCHAR(100),
    y6_3              VARCHAR(100),
    x3_3              VARCHAR(100),
    y3_3              VARCHAR(100),
    jd3               VARCHAR(100),
    wd3               VARCHAR(100),
    zbxt4             VARCHAR(100),
    x6_4              VARCHAR(100),
    y6_4              VARCHAR(100),
    x3_4              VARCHAR(100),
    y3_4              VARCHAR(100),
    jd4               VARCHAR(100),
    wd4               VARCHAR(100),
    x                 VARCHAR(100),
    y                 VARCHAR(100),
    bgdw              VARCHAR(100),
    szd               VARCHAR(1000),
    bzsm              VARCHAR(1000),
    dzjwj             VARCHAR(500),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_gpsd PRIMARY KEY (code),
    CONSTRAINT uk_proj_gpsd_rid UNIQUE (rid)
);

CREATE INDEX idx_proj_gpsd_dh ON proj_gpsd (dh);
CREATE INDEX idx_proj_gpsd_dm ON proj_gpsd (dm);
CREATE INDEX idx_proj_gpsd_jid ON proj_gpsd (jid);
CREATE INDEX idx_proj_gpsd_sys_parentrid ON proj_gpsd (sys_parentrid);

CREATE SEQUENCE proj_gpsd_code_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999999999
    MINVALUE 1
    NO CYCLE
    CACHE 5;

COMMENT ON TABLE proj_gpsd IS 'GPS控制点';
COMMENT ON COLUMN proj_gpsd.code IS '主键';
COMMENT ON COLUMN proj_gpsd.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_gpsd.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_gpsd.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_gpsd.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_gpsd.dh IS '点号';
COMMENT ON COLUMN proj_gpsd.dm IS '点名';
COMMENT ON COLUMN proj_gpsd.ydm IS '原点名';
COMMENT ON COLUMN proj_gpsd.dj IS '等级';
COMMENT ON COLUMN proj_gpsd.sztfh IS '所在图幅号';
COMMENT ON COLUMN proj_gpsd.chnf IS '建造年代';
COMMENT ON COLUMN proj_gpsd.bslx IS '标石类型';
COMMENT ON COLUMN proj_gpsd.bszk IS '标石状况';
COMMENT ON COLUMN proj_gpsd.scdw IS '施测单位';
COMMENT ON COLUMN proj_gpsd.scnd IS '施测年代';
COMMENT ON COLUMN proj_gpsd.cblx IS '测标类型';
COMMENT ON COLUMN proj_gpsd.gjdm IS '国际代码';
COMMENT ON COLUMN proj_gpsd.zbxt1 IS '坐标系统1';
COMMENT ON COLUMN proj_gpsd.x6_1 IS 'X坐标1（6度带）';
COMMENT ON COLUMN proj_gpsd.y6_1 IS 'Y坐标1（6度带）';
COMMENT ON COLUMN proj_gpsd.x3_1 IS 'X坐标1（3度带）';
COMMENT ON COLUMN proj_gpsd.y3_1 IS 'Y坐标1（3度带）';
COMMENT ON COLUMN proj_gpsd.jd1 IS '经度1';
COMMENT ON COLUMN proj_gpsd.wd1 IS '纬度1';
COMMENT ON COLUMN proj_gpsd.zbxt2 IS '坐标系统2';
COMMENT ON COLUMN proj_gpsd.x6_2 IS 'X坐标2（6度带）';
COMMENT ON COLUMN proj_gpsd.y6_2 IS 'Y坐标2（6度带）';
COMMENT ON COLUMN proj_gpsd.x3_2 IS 'X坐标2（3度带）';
COMMENT ON COLUMN proj_gpsd.y3_2 IS 'Y坐标2（3度带）';
COMMENT ON COLUMN proj_gpsd.jd2 IS '经度2';
COMMENT ON COLUMN proj_gpsd.wd2 IS '纬度2';
COMMENT ON COLUMN proj_gpsd.zbxt3 IS '坐标系统3';
COMMENT ON COLUMN proj_gpsd.x6_3 IS 'X坐标3（6度带）';
COMMENT ON COLUMN proj_gpsd.y6_3 IS 'Y坐标3（6度带）';
COMMENT ON COLUMN proj_gpsd.x3_3 IS 'X坐标3（3度带）';
COMMENT ON COLUMN proj_gpsd.y3_3 IS 'Y坐标3（3度带）';
COMMENT ON COLUMN proj_gpsd.jd3 IS '经度3';
COMMENT ON COLUMN proj_gpsd.wd3 IS '纬度3';
COMMENT ON COLUMN proj_gpsd.zbxt4 IS '坐标系统4';
COMMENT ON COLUMN proj_gpsd.x6_4 IS 'X坐标4（6度带）';
COMMENT ON COLUMN proj_gpsd.y6_4 IS 'Y坐标4（6度带）';
COMMENT ON COLUMN proj_gpsd.x3_4 IS 'X坐标4（3度带）';
COMMENT ON COLUMN proj_gpsd.y3_4 IS 'Y坐标4（3度带）';
COMMENT ON COLUMN proj_gpsd.jd4 IS '经度4';
COMMENT ON COLUMN proj_gpsd.wd4 IS '纬度4';
COMMENT ON COLUMN proj_gpsd.x IS '经度';
COMMENT ON COLUMN proj_gpsd.y IS '纬度';
COMMENT ON COLUMN proj_gpsd.bgdw IS '保管单位';
COMMENT ON COLUMN proj_gpsd.szd IS '坐落描述';
COMMENT ON COLUMN proj_gpsd.bzsm IS '备注说明';
COMMENT ON COLUMN proj_gpsd.dzjwj IS '点之记文件';
COMMENT ON COLUMN proj_gpsd.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_gpsd.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_gpsd.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_gpsd.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_gpsd.lastmodifyuser IS '最近修改用户';
