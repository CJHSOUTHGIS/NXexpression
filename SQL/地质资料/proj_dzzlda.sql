--********************************************************************************
-- 视图：地质资料档案 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_dzzlda AS
SELECT
    rec.parentdocunid AS code,
    rec.dh              AS "档号",
    rec.dzdh            AS "电子档号",
    rec.tm              AS "题名",
    rec.bzz             AS "编著者",
    rec.xcdw            AS "形成单位",
    rec.xcsj            AS "形成时间",
    rec.pzjg            AS "批准机构",
    rec.pzsj            AS "批准时间",
    rec.zllbmc          AS "资料类别",
    rec.gzcdmc          AS "工作程度",
    rec.kssj            AS "开始时间",
    rec.zzsj            AS "终止时间",
    rec.lx              AS "类型",
    rec.hjsj            AS "汇交时间",
    rec.mjmc            AS "密级",
    rec.bhq             AS "保护期",
    rec.bgqx            AS "保管期限",
    rec.ztc             AS "主题词",
    rec.zldagmc         AS "资料档案馆",
    rec.sdh             AS "省档号",
    rec.zzdawz          AS "纸质档案存放位置",
    rec.dzdawz          AS "电子档案存放位置",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    rec.rangedata,
    rec.minx,
    rec.maxx,
    rec.miny,
    rec.maxy,
    rec.tm              AS nodename,
    rec.rid             AS "RID",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "录入时间",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_dzzlda rec;

GRANT SELECT ON v_proj_dzzlda TO public;
