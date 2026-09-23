--********************************************************************************
-- 视图：测绘项目档案 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_chxmda AS
SELECT
    rec.parentdocunid AS code,
    rec.xmlb            AS "项目类别",
    rec.xmmc            AS "项目名称",
    rec.cdbh            AS "存档编号",
    rec.bzsm            AS "备注说明",
    CASE
        WHEN rec.xmmc IS NULL OR rec.xmmc = '' THEN rec.xmlb
        ELSE rec.xmlb || '/' || rec.xmmc
    END                 AS nodename,
    rec.rid             AS "RID",
    rec.jsbh            AS "接收编号",
    rec.hjdw            AS "汇交单位",
    rec.jsr             AS "接收人",
    rec.jsrq            AS "接收日期",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_chxmda rec;

GRANT SELECT ON v_proj_chxmda TO public;

--********************************************************************************
-- 视图：测绘项目资料清单 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_chxmzl AS
SELECT
    rec.parentdocunid AS code,
    rec.sszlmc          AS "所属项目名称",
    rec.cdbh            AS "存档编号",
    rec.zlmc            AS "资料名称",
    rec.jsbh            AS "接收编号",
    rec.hjdw            AS "汇交单位",
    rec.hjrq            AS "汇交日期",
    rec.jsr             AS "接收人",
    rec.jzlx            AS "介质类型",
    rec.ztxs            AS "载体形式",
    rec.sl              AS "数量",
    rec.sldw            AS "数量单位",
    rec.xsx             AS "现势性",
    rec.sjlx            AS "数据类型",
    rec.sjgs            AS "数据格式",
    rec.zbxt            AS "坐标系统",
    rec.blc             AS "比例尺",
    rec.fbl             AS "分辨率",
    rec.bzsm            AS "备注说明",
    rec.rid             AS "RID",
    rec.sys_parentrid   AS "SYS_PARENTRID",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_chxmzl rec;

GRANT SELECT ON v_proj_chxmzl TO public;
