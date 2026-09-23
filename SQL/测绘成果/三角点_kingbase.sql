--********************************************************************************
-- 表：三角点 (人大金仓 - 大小写敏感，标识符统一小写)
-- 注意：建表后查询/写入请保持小写标识符一致
--********************************************************************************
CREATE TABLE proj_sjd (
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
    sjbs              VARCHAR(100),
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_sjd PRIMARY KEY (code),
    CONSTRAINT uk_proj_sjd_rid UNIQUE (rid)
);

CREATE INDEX idx_proj_sjd_dh ON proj_sjd (dh);
CREATE INDEX idx_proj_sjd_dm ON proj_sjd (dm);
CREATE INDEX idx_proj_sjd_jid ON proj_sjd (jid);
CREATE INDEX idx_proj_sjd_sys_parentrid ON proj_sjd (sys_parentrid);

-- 编号序列
CREATE SEQUENCE proj_sjd_code_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999999999
    MINVALUE 1
    NO CYCLE
    CACHE 5;

-- 取下一个 code 示例：
-- SELECT nextval('proj_sjd_code_seq');

--********************************************************************************
-- 授权（序列 nextval 需要 USAGE + SELECT，请将应用库用户替换为实际账号）
--********************************************************************************
-- GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE proj_sjd TO ibase3_master;
-- GRANT USAGE, SELECT ON SEQUENCE proj_sjd_code_seq TO ibase3_master;

COMMENT ON TABLE proj_sjd IS '三角点';
COMMENT ON COLUMN proj_sjd.code IS '主键';
COMMENT ON COLUMN proj_sjd.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_sjd.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_sjd.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_sjd.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_sjd.dh IS '点号';
COMMENT ON COLUMN proj_sjd.dm IS '点名';
COMMENT ON COLUMN proj_sjd.ydm IS '原点名';
COMMENT ON COLUMN proj_sjd.dj IS '等级';
COMMENT ON COLUMN proj_sjd.sztfh IS '所在图幅号';
COMMENT ON COLUMN proj_sjd.chnf IS '建造年代';
COMMENT ON COLUMN proj_sjd.bslx IS '标石类型';
COMMENT ON COLUMN proj_sjd.bszk IS '标石状况';
COMMENT ON COLUMN proj_sjd.scdw IS '施测单位';
COMMENT ON COLUMN proj_sjd.scnd IS '施测年代';
COMMENT ON COLUMN proj_sjd.cblx IS '测标类型';
COMMENT ON COLUMN proj_sjd.gjdm IS '国际代码';
COMMENT ON COLUMN proj_sjd.zbxt1 IS '坐标系统1';
COMMENT ON COLUMN proj_sjd.x6_1 IS 'X坐标1（6度带）';
COMMENT ON COLUMN proj_sjd.y6_1 IS 'Y坐标1（6度带）';
COMMENT ON COLUMN proj_sjd.x3_1 IS 'X坐标1（3度带）';
COMMENT ON COLUMN proj_sjd.y3_1 IS 'Y坐标1（3度带）';
COMMENT ON COLUMN proj_sjd.jd1 IS '经度1';
COMMENT ON COLUMN proj_sjd.wd1 IS '纬度1';
COMMENT ON COLUMN proj_sjd.zbxt2 IS '坐标系统2';
COMMENT ON COLUMN proj_sjd.x6_2 IS 'X坐标2（6度带）';
COMMENT ON COLUMN proj_sjd.y6_2 IS 'Y坐标2（6度带）';
COMMENT ON COLUMN proj_sjd.x3_2 IS 'X坐标2（3度带）';
COMMENT ON COLUMN proj_sjd.y3_2 IS 'Y坐标2（3度带）';
COMMENT ON COLUMN proj_sjd.jd2 IS '经度2';
COMMENT ON COLUMN proj_sjd.wd2 IS '纬度2';
COMMENT ON COLUMN proj_sjd.zbxt3 IS '坐标系统3';
COMMENT ON COLUMN proj_sjd.x6_3 IS 'X坐标3（6度带）';
COMMENT ON COLUMN proj_sjd.y6_3 IS 'Y坐标3（6度带）';
COMMENT ON COLUMN proj_sjd.x3_3 IS 'X坐标3（3度带）';
COMMENT ON COLUMN proj_sjd.y3_3 IS 'Y坐标3（3度带）';
COMMENT ON COLUMN proj_sjd.jd3 IS '经度3';
COMMENT ON COLUMN proj_sjd.wd3 IS '纬度3';
COMMENT ON COLUMN proj_sjd.zbxt4 IS '坐标系统4';
COMMENT ON COLUMN proj_sjd.x6_4 IS 'X坐标4（6度带）';
COMMENT ON COLUMN proj_sjd.y6_4 IS 'Y坐标4（6度带）';
COMMENT ON COLUMN proj_sjd.x3_4 IS 'X坐标4（3度带）';
COMMENT ON COLUMN proj_sjd.y3_4 IS 'Y坐标4（3度带）';
COMMENT ON COLUMN proj_sjd.jd4 IS '经度4';
COMMENT ON COLUMN proj_sjd.wd4 IS '纬度4';
COMMENT ON COLUMN proj_sjd.x IS '经度';
COMMENT ON COLUMN proj_sjd.y IS '纬度';
COMMENT ON COLUMN proj_sjd.bgdw IS '保管单位';
COMMENT ON COLUMN proj_sjd.szd IS '坐落描述';
COMMENT ON COLUMN proj_sjd.bzsm IS '备注说明';
COMMENT ON COLUMN proj_sjd.dzjwj IS '点之记文件';
COMMENT ON COLUMN proj_sjd.sjbs IS '数据标识';
COMMENT ON COLUMN proj_sjd.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_sjd.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_sjd.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_sjd.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_sjd.lastmodifyuser IS '最近修改用户';
