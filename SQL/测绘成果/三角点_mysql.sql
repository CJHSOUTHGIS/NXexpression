--********************************************************************************
-- 表：三角点 (MySQL)
-- 表名、字段名统一小写
--********************************************************************************
CREATE TABLE proj_sjd (
    code              BIGINT        NOT NULL COMMENT '主键',
    rid               CHAR(36)      NOT NULL COMMENT '记录唯一标识',
    jid               CHAR(36)      NULL COMMENT '工作流实例ID',
    sys_parentrid     VARCHAR(100)  NULL COMMENT '父记录标识',
    parentdocunid     CHAR(32)      NULL COMMENT '所属文档对象的ID',
    dh                VARCHAR(30)   NULL COMMENT '点号',
    dm                VARCHAR(100)  NULL COMMENT '点名',
    ydm               VARCHAR(100)  NULL COMMENT '原点名',
    dj                VARCHAR(100)  NULL COMMENT '等级',
    sztfh             VARCHAR(100)  NULL COMMENT '所在图幅号',
    chnf              VARCHAR(30)   NULL COMMENT '建造年代',
    bslx              VARCHAR(100)  NULL COMMENT '标石类型',
    bszk              VARCHAR(100)  NULL COMMENT '标石状况',
    scdw              VARCHAR(100)  NULL COMMENT '施测单位',
    scnd              VARCHAR(30)   NULL COMMENT '施测年代',
    cblx              VARCHAR(100)  NULL COMMENT '测标类型',
    gjdm              VARCHAR(100)  NULL COMMENT '国际代码',
    zbxt1             VARCHAR(100)  NULL COMMENT '坐标系统1',
    x6_1              VARCHAR(100)  NULL COMMENT 'X坐标1（6度带）',
    y6_1              VARCHAR(100)  NULL COMMENT 'Y坐标1（6度带）',
    x3_1              VARCHAR(100)  NULL COMMENT 'X坐标1（3度带）',
    y3_1              VARCHAR(100)  NULL COMMENT 'Y坐标1（3度带）',
    jd1               VARCHAR(100)  NULL COMMENT '经度1',
    wd1               VARCHAR(100)  NULL COMMENT '纬度1',
    zbxt2             VARCHAR(100)  NULL COMMENT '坐标系统2',
    x6_2              VARCHAR(100)  NULL COMMENT 'X坐标2（6度带）',
    y6_2              VARCHAR(100)  NULL COMMENT 'Y坐标2（6度带）',
    x3_2              VARCHAR(100)  NULL COMMENT 'X坐标2（3度带）',
    y3_2              VARCHAR(100)  NULL COMMENT 'Y坐标2（3度带）',
    jd2               VARCHAR(100)  NULL COMMENT '经度2',
    wd2               VARCHAR(100)  NULL COMMENT '纬度2',
    zbxt3             VARCHAR(100)  NULL COMMENT '坐标系统3',
    x6_3              VARCHAR(100)  NULL COMMENT 'X坐标3（6度带）',
    y6_3              VARCHAR(100)  NULL COMMENT 'Y坐标3（6度带）',
    x3_3              VARCHAR(100)  NULL COMMENT 'X坐标3（3度带）',
    y3_3              VARCHAR(100)  NULL COMMENT 'Y坐标3（3度带）',
    jd3               VARCHAR(100)  NULL COMMENT '经度3',
    wd3               VARCHAR(100)  NULL COMMENT '纬度3',
    zbxt4             VARCHAR(100)  NULL COMMENT '坐标系统4',
    x6_4              VARCHAR(100)  NULL COMMENT 'X坐标4（6度带）',
    y6_4              VARCHAR(100)  NULL COMMENT 'Y坐标4（6度带）',
    x3_4              VARCHAR(100)  NULL COMMENT 'X坐标4（3度带）',
    y3_4              VARCHAR(100)  NULL COMMENT 'Y坐标4（3度带）',
    jd4               VARCHAR(100)  NULL COMMENT '经度4',
    wd4               VARCHAR(100)  NULL COMMENT '纬度4',
    x                 VARCHAR(100)  NULL COMMENT '经度',
    y                 VARCHAR(100)  NULL COMMENT '纬度',
    bgdw              VARCHAR(100)  NULL COMMENT '保管单位',
    szd               VARCHAR(1000) NULL COMMENT '坐落描述',
    bzsm              VARCHAR(1000) NULL COMMENT '备注说明',
    dzjwj             VARCHAR(500)  NULL COMMENT '点之记文件',
    sjbs              VARCHAR(100)  NULL COMMENT '数据标识',
    projectdocunid    VARCHAR(100)  NULL COMMENT '汇交项目的ID',
    createtime        DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    createuser        VARCHAR(50)   NULL COMMENT '记录创建用户',
    lastmodifytime    DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近修改时间',
    lastmodifyuser    VARCHAR(50)   NULL COMMENT '最近修改用户',
    PRIMARY KEY (code),
    UNIQUE KEY uk_proj_sjd_rid (rid),
    KEY idx_proj_sjd_dh (dh),
    KEY idx_proj_sjd_dm (dm),
    KEY idx_proj_sjd_jid (jid),
    KEY idx_proj_sjd_sys_parentrid (sys_parentrid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='三角点';

-- 编号序列表（MySQL 模拟 SEQUENCE）
CREATE TABLE proj_sjd_code_seq (
    id   BIGINT NOT NULL AUTO_INCREMENT,
    stub CHAR(1) NOT NULL DEFAULT '',
    PRIMARY KEY (id)
) ENGINE=InnoDB COMMENT='三角点主键序列表';

-- 初始化序列表
INSERT INTO proj_sjd_code_seq (stub) VALUES ('');

-- 取下一个 code 示例：
-- INSERT INTO proj_sjd_code_seq (stub) VALUES ('');
-- SELECT LAST_INSERT_ID() AS code;

--********************************************************************************
-- 视图：三角点 (MySQL)
-- 依赖平台表 webdocument（code / zzdacfwz1 / dzdacfwz1）
--********************************************************************************
CREATE OR REPLACE VIEW V_PROJ_SJD AS
SELECT
    rec.parentdocunid                          AS `CODE`,
    rec.sjbs                                   AS `数据标识`,
    rec.dh                                     AS `点号`,
    rec.dm                                     AS `点名`,
    rec.ydm                                    AS `原点名`,
    rec.dj                                     AS `等级`,
    CASE
        WHEN rec.zbxt4 IS NOT NULL AND rec.zbxt4 <> '' THEN
            CONCAT(rec.zbxt1, '、', rec.zbxt2, '、', rec.zbxt3, '、', rec.zbxt4)
        WHEN rec.zbxt3 IS NOT NULL AND rec.zbxt3 <> '' THEN
            CONCAT(rec.zbxt1, '、', rec.zbxt2, '、', rec.zbxt3)
        WHEN rec.zbxt2 IS NOT NULL AND rec.zbxt2 <> '' THEN
            CONCAT(rec.zbxt1, '、', rec.zbxt2)
        ELSE rec.zbxt1
    END                                        AS `坐标系统`,
    rec.sztfh                                  AS `所在图幅号`,
    rec.gjdm                                   AS `国际代码`,
    rec.chnf                                   AS `建造年代`,
    rec.bslx                                   AS `标石类型`,
    rec.bszk                                   AS `标石状况`,
    rec.cblx                                   AS `测标类型`,
    rec.scdw                                   AS `施测单位`,
    rec.scnd                                   AS `施测年代`,
    rec.bgdw                                   AS `保管单位`,
    rec.szd                                    AS `坐落描述`,
    rec.projectdocunid                         AS `PROJECTDOCUNID`,
    NULL                                       AS `OLDDATA`,
    doc.zzdacfwz1                              AS `纸质档案位置`,
    doc.dzdacfwz1                              AS `电子介质位置`,
    rec.x                                      AS `X`,
    rec.y                                      AS `Y`,
    rec.code                                   AS `REC_CODE`,
    rec.rid                                    AS `RID`,
    rec.jid                                    AS `JID`,
    rec.sys_parentrid                          AS `SYS_PARENTRID`
FROM proj_sjd rec
LEFT JOIN webdocument doc ON doc.code = rec.parentdocunid
WHERE doc.code IS NOT NULL;
