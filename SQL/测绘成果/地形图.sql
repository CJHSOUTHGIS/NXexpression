CREATE OR REPLACE VIEW V_PROJ_JBDXT AS
SELECT
    rec.ssxm              AS "所属项目",
    rec.cdbh              AS "存档编号",
    rec.sjlx              AS "数据类型",
    rec.blc               AS "比例尺",
    rec.scnf              AS "生产年份",
    rec.xth               AS "新图号",
    rec.jth               AS "旧图号",
    rec.tm                AS "图名",
    rec.zbxt              AS "坐标系统",
    rec.gcjz              AS "高程基准",
    rec.ztxs              AS "载体形式",
    rec.tsbb              AS "图式版本",
    rec.tfdgj             AS "图幅等高距",
    rec.sjgs              AS "数据格式",
    rec.sjdx              AS "数据大小",
    rec.bgdw              AS "保管单位",
    rec.scdw              AS "生产单位",
    rec.bzsm              AS "备注说明",
    rec.tfzbfw            AS "图幅坐标范围",
    rec.dzsj              AS "电子数据",
    rec.cffwqwz           AS "存放服务器位置",
    rec.zsl               AS "总数量",
    rec.kcl               AS "库存量",
    rec.pc                AS "批次",
    rec.dqbmh             AS "当前保密号",
    rec.rid               AS "RID",
    rec.jid               AS "JID",
    rec.sys_parentrid     AS "SYS_PARENTRID",
    rec.projectdocunid    AS "PROJECTDOCUNID"
FROM proj_jbdxt rec;

GRANT SELECT ON V_PROJ_JBDXT TO public;
