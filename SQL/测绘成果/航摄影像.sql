--********************************************************************************
-- 视图：航摄影像
-- 参考：V_PROJ_JBDXT
--********************************************************************************
CREATE OR REPLACE VIEW VIEW_HANGPIAN AS
SELECT
    rec.zlmc              AS "资料名称",
    rec.sjlx              AS "数据类型",
    rec.hpbh              AS "影像编号",
    rec.fbl               AS "精度",
    rec.blc               AS "比例尺",
    rec.ztxs              AS "载体形式",
    rec.sjgs              AS "数据格式",
    rec.sjdx              AS "数据大小",
    rec.dxdm              AS "地形地貌",
    rec.jdhg              AS "绝对航高",
    rec.color             AS "色彩",
    rec.psdw              AS "拍摄单位",
    rec.pssj              AS "拍摄时间",
    rec.bgdw              AS "保管单位",
    rec.jzlx              AS "介质类型",
    rec.bzsm              AS "备注说明",
    rec.rangedata         AS "RANGEDATA",
    rec.minx              AS "MINX",
    rec.maxx              AS "MAXX",
    rec.miny              AS "MINY",
    rec.maxy              AS "MAXY",
    rec.pc                AS "批次",
    rec.zsl               AS "总数量",
    rec.kcl               AS "库存量",
    rec.dqbmh             AS "当前保密号",
    rec.rid               AS "RID",
    rec.jid               AS "JID",
    rec.sys_parentrid     AS "SYS_PARENTRID",
    rec.projectdocunid    AS "PROJECTDOCUNID"
FROM proj_hangpian rec;

GRANT SELECT ON VIEW_HANGPIAN TO public;
