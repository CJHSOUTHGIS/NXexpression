--********************************************************************************
-- 视图：科学技术奖推荐书 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_kxjsjtj AS
SELECT
    rec.parentdocunid AS code,
    rec.xmlb            AS "项目类别",
    rec.xmbh            AS "项目编号",
    rec.tjsj            AS "推荐时间",
    rec.sbdw            AS "申报单位",
    rec.sbr             AS "申报人",
    rec.tjdw            AS "推荐单位",
    rec.xmmc            AS "项目名称",
    rec.sqjx            AS "申请奖项",
    rec.ztc             AS "主题词",
    rec.jsbh            AS "接收编号",
    rec.jsrq            AS "接收日期",
    rec.jsr             AS "接收人",
    rec.hjdw            AS "汇交单位",
    rec.hjr             AS "汇交人",
    rec.cdbh            AS "存档编号",
    CASE
        WHEN rec.zzdawz IS NULL THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    rec.xmmc            AS nodename,
    rec.rid             AS "RID",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "录入时间",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_kxjsjtj rec;

GRANT SELECT ON v_proj_kxjsjtj TO public;
