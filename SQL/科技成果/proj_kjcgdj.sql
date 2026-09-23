--********************************************************************************
-- 视图：科技成果登记表 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_kjcgdj AS
SELECT
    rec.parentdocunid AS code,
    rec.cgmc            AS "成果名称",
    rec.djsj            AS "登记时间",
    rec.wcdw            AS "完成单位",
    rec.tjdw            AS "推荐单位",
    rec.yjqssj          AS "研究起始时间",
    rec.yjzzsj          AS "研究终止时间",
    rec.ktlxbh          AS "课题立项编号",
    rec.sjxmjf          AS "实际项目经费",
    rec.gjc             AS "关键词",
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
    rec.cgmc            AS nodename,
    rec.rid             AS "RID",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "录入时间",
    rec.projectdocunid  AS "PROJECTDOCUNID"
FROM proj_kjcgdj rec;

GRANT SELECT ON v_proj_kjcgdj TO public;
