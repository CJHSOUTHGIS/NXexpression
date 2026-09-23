--********************************************************************************
-- 视图：水准点 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW V_PROJ_SZD AS
SELECT
    rec.sjbs                                   AS "数据标识",
    rec.dh                                     AS "点号",
    rec.dm                                     AS "点名",
    rec.ydm                                    AS "原点名",
    rec.dj                                     AS "等级",
    rec.lxmc                                   AS "路线名称",
    rec.sztfh                                  AS "所在图幅号",
    rec.gjdm                                   AS "国际代码",
    rec.chnf                                   AS "建造年代",
    rec.bslx                                   AS "标石类型",
    rec.bszk                                   AS "标石状况",
    rec.cblx                                   AS "测标类型",
    rec.gcjz                                   AS "高程基准",
    rec.hbgc                                   AS "海拔高程",
    rec.scdw                                   AS "施测单位",
    rec.scnd                                   AS "施测年代",
    rec.bgdw                                   AS "保管单位",
    rec.szd                                    AS "坐落描述",
    rec.projectdocunid                         AS "PROJECTDOCUNID",
    CAST(NULL AS INTEGER)                      AS "OLDDATA",
    rec.x                                      AS "X",
    rec.y                                      AS "Y",
    rec.code                                   AS "REC_CODE",
    rec.rid                                    AS "RID",
    rec.jid                                    AS "JID",
    rec.sys_parentrid                          AS "SYS_PARENTRID"
FROM proj_szd rec;

GRANT SELECT ON V_PROJ_SZD TO public;
