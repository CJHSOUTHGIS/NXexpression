--********************************************************************************
-- 视图：三角点 (人大金仓)
-- 参考：V_PROJ_JBDXT、VIEW_PROJ_SJD
-- 说明：
--   1. 主表 proj_sjd 字段名统一小写
--   2. CODE 输出为 parentdocunid（与旧版 VIEW_PROJ_SJD 一致）
--   3. OLDDATA 字段当前表结构未包含，视图中输出 NULL 占位
--   4. 依赖平台表 webdocument（code / zzdacfwz1 / dzdacfwz1）
--********************************************************************************
CREATE OR REPLACE VIEW V_PROJ_SJD AS
SELECT
    rec.sjbs                                   AS "数据标识",
    rec.dh                                     AS "点号",
    rec.dm                                     AS "点名",
    rec.ydm                                    AS "原点名",
    rec.dj                                     AS "等级",
    CASE
        WHEN rec.zbxt4 IS NOT NULL AND rec.zbxt4 <> '' THEN
            rec.zbxt1 || '、' || rec.zbxt2 || '、' || rec.zbxt3 || '、' || rec.zbxt4
        WHEN rec.zbxt3 IS NOT NULL AND rec.zbxt3 <> '' THEN
            rec.zbxt1 || '、' || rec.zbxt2 || '、' || rec.zbxt3
        WHEN rec.zbxt2 IS NOT NULL AND rec.zbxt2 <> '' THEN
            rec.zbxt1 || '、' || rec.zbxt2
        ELSE rec.zbxt1
    END                                        AS "坐标系统",
    rec.sztfh                                  AS "所在图幅号",
    rec.gjdm                                   AS "国际代码",
    rec.chnf                                   AS "建造年代",
    rec.bslx                                   AS "标石类型",
    rec.bszk                                   AS "标石状况",
    rec.cblx                                   AS "测标类型",
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
FROM proj_sjd rec

-- 授权
GRANT SELECT ON V_PROJ_SJD TO public;
