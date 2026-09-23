--********************************************************************************
-- 视图：成果申请出库登记表 (人大金仓)
--********************************************************************************
CREATE OR REPLACE VIEW v_proj_cgsqckdj AS
SELECT
    rec.parentdocunid AS code,
    rec.ffbh          AS "编号",
    rec.ckrq          AS "出库日期",
    rec.ckr           AS "出库人",
    rec.cgzlmc        AS "申请成果资料",
    CASE rec.sqqx WHEN 1 THEN '涉密' ELSE '不涉密' END AS "涉密情况",
    rec.sqcglx        AS "成果类型",
    rec.sqdwmc        AS "申请单位",
    rec.sqdwdm        AS "单位代码",
    rec.gksx          AS "归口属性",
    rec.gkdw          AS "归口单位",
    rec.symd          AS "申请用途",
    rec.sqyt          AS "用途类型",
    rec.syfs          AS "使用方式",
    rec.ztxs          AS "载体形式",
    rec.tgxs          AS "提供形式",
    rec.ccjz          AS "存储介质",
    rec.jmlx          AS "加密类型",
    rec.ckbzsm        AS "备注说明",
    CASE rec.ycl WHEN 1 THEN '已处理' ELSE '处理中' END AS "状态",
    rec.createuser    AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    rec.sqdwmc        AS nodename,
    rec.rid           AS "RID",
    rec.projectdocunid AS "PROJECTDOCUNID"
FROM proj_cgsqckdj rec;

GRANT SELECT ON v_proj_cgsqckdj TO public;
