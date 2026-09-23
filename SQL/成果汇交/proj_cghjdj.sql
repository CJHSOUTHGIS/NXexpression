--********************************************************************************
-- 视图：成果汇交登记表 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_cghjdj AS
SELECT
    rec.parentdocunid AS code,
    rec.jsbh          AS "接收编号",
    rec.zlmc          AS "资料名称",
    rec.hjrq          AS "汇交日期",
    rec.hjdw          AS "汇交单位",
    rec.jsr           AS "接收人",
    rec.jsrq          AS "接收日期",
    rec.cdbh          AS "存档编号",
    rec.zllx          AS "资料类型",
    rec.bhcg          AS "包含成果",
    rec.createuser    AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END               AS "档案存放位置",
    rec.zlmc          AS nodename,
    rec.rid           AS "RID",
    rec.projectdocunid AS "PROJECTDOCUNID"
FROM proj_cghjdj rec;

GRANT SELECT ON v_proj_cghjdj TO public;
