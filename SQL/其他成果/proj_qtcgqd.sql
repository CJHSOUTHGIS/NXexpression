--********************************************************************************
-- 视图：其他成果清单（档案台账列表 SQL 名称：v_proj_qtcgqd）
--********************************************************************************
DROP VIEW IF EXISTS v_proj_qtcgqd;

CREATE OR REPLACE VIEW v_proj_qtcgqd AS
SELECT
    rec.parentdocunid AS code,
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
    rec.cffqwz          AS "存放服务器位置",
    rec.bzsm            AS "备注说明",
    hj.zllx             AS "汇交资料类型",
    hj.bhcg             AS "汇交包含成果",
    hj.zlmc             AS "汇交资料名称",
    rec.zlmc            AS nodename,
    rec.rid             AS "RID",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    rec.sys_parentrid   AS "SYS_PARENTRID",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_qtcgqd rec
LEFT JOIN proj_cghjdj hj ON hj.rid = rec.sys_parentrid;

GRANT SELECT ON v_proj_qtcgqd TO public;
