--********************************************************************************
-- 视图：测绘资料档案登记表 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_chzlda AS
SELECT
    rec.parentdocunid AS code,
    rec.zlmc            AS "资料名称",
    rec.dalx            AS "档案类型",
    rec.dahmc           AS "档案盒名称",
    rec.xsmc            AS "显示名称",
    rec.scdw            AS "生产单位",
    rec.scsj            AS "生产时间",
    rec.kcl             AS "库存量",
    rec.blc             AS "比例尺",
    rec.dtbs            AS "地图版式",
    rec.pf              AS "拼幅",
    rec.zzdawz          AS "纸质档案位置",
    rec.dzdawz          AS "电子档案位置",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    rec.zlmc            AS nodename,
    rec.rid             AS "RID",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_chzlda rec;

GRANT SELECT ON v_proj_chzlda TO public;
