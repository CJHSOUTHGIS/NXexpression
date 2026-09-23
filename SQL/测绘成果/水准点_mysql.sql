--********************************************************************************
-- 表：水准点 (MySQL)
--********************************************************************************
CREATE TABLE proj_szd (
    code              BIGINT        NOT NULL COMMENT '主键',
    rid               CHAR(36)      NOT NULL COMMENT '记录唯一标识',
    jid               CHAR(36)      NULL COMMENT '工作流实例ID',
    sys_parentrid     VARCHAR(100)  NULL COMMENT '父记录标识',
    parentdocunid     CHAR(32)      NULL COMMENT '所属文档对象的ID',
    dh                VARCHAR(100)  NULL COMMENT '点号',
    dm                VARCHAR(100)  NULL COMMENT '点名',
    ydm               VARCHAR(100)  NULL COMMENT '原点名',
    lxmc              VARCHAR(100)  NULL COMMENT '路线名称',
    gcjz              VARCHAR(100)  NULL COMMENT '高程基准',
    hbgc              VARCHAR(100)  NULL COMMENT '海拔高程',
    dj                VARCHAR(100)  NULL COMMENT '等级',
    gjdm              VARCHAR(100)  NULL COMMENT '国际代码',
    chnf              VARCHAR(30)   NULL COMMENT '建造年代',
    bslx              VARCHAR(100)  NULL COMMENT '标石类型',
    bszk              VARCHAR(100)  NULL COMMENT '标石状况',
    cblx              VARCHAR(100)  NULL COMMENT '测标类型',
    scdw              VARCHAR(100)  NULL COMMENT '施测单位',
    scnd              VARCHAR(30)   NULL COMMENT '施测年代',
    x                 VARCHAR(100)  NULL COMMENT '经度',
    y                 VARCHAR(100)  NULL COMMENT '纬度',
    sztfh             VARCHAR(100)  NULL COMMENT '所在图幅号',
    bgdw              VARCHAR(100)  NULL COMMENT '保管单位',
    sjbs              VARCHAR(100)  NULL COMMENT '数据标识',
    szd               VARCHAR(1000) NULL COMMENT '坐落描述',
    bzsm              VARCHAR(1000) NULL COMMENT '备注说明',
    dzjwj             VARCHAR(500)  NULL COMMENT '点之记文件',
    projectdocunid    VARCHAR(100)  NULL COMMENT '汇交项目的ID',
    createtime        DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
    createuser        VARCHAR(50)   NULL COMMENT '记录创建用户',
    lastmodifytime    DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近修改时间',
    lastmodifyuser    VARCHAR(50)   NULL COMMENT '最近修改用户',
    PRIMARY KEY (code),
    UNIQUE KEY uk_proj_szd_rid (rid),
    KEY idx_proj_szd_dh (dh),
    KEY idx_proj_szd_dm (dm),
    KEY idx_proj_szd_jid (jid),
    KEY idx_proj_szd_sys_parentrid (sys_parentrid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='水准点';

CREATE TABLE proj_szd_code_seq (
    id   BIGINT NOT NULL AUTO_INCREMENT,
    stub CHAR(1) NOT NULL DEFAULT '',
    PRIMARY KEY (id)
) ENGINE=InnoDB COMMENT='水准点主键序列表';

INSERT INTO proj_szd_code_seq (stub) VALUES ('');

--********************************************************************************
-- 视图：水准点 (MySQL)
--********************************************************************************
CREATE OR REPLACE VIEW V_PROJ_SZD AS
SELECT
    rec.parentdocunid                          AS `CODE`,
    rec.sjbs                                   AS `数据标识`,
    rec.dh                                     AS `点号`,
    rec.dm                                     AS `点名`,
    rec.ydm                                    AS `原点名`,
    rec.dj                                     AS `等级`,
    rec.lxmc                                   AS `路线名称`,
    rec.sztfh                                  AS `所在图幅号`,
    rec.gjdm                                   AS `国际代码`,
    rec.chnf                                   AS `建造年代`,
    rec.bslx                                   AS `标石类型`,
    rec.bszk                                   AS `标石状况`,
    rec.cblx                                   AS `测标类型`,
    rec.gcjz                                   AS `高程基准`,
    rec.hbgc                                   AS `海拔高程`,
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
FROM proj_szd rec
LEFT JOIN webdocument doc ON doc.code = rec.parentdocunid
WHERE doc.code IS NOT NULL;
