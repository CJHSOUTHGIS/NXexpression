CREATE OR REPLACE VIEW v_proj_kjghcg AS
SELECT
    rec.ssxm              AS "所属项目",
    rec.cdbh              AS "存档编号",
    rec.cglx              AS "成果类型",
    rec.ghlx              AS "规划类型",
    rec.cgmc              AS "成果名称",
    rec.blc               AS "比例尺",
    rec.scnf              AS "生产年份",
    rec.zbxt              AS "坐标系统",
    rec.ztxs              AS "载体形式",
    rec.sjgs              AS "数据格式",
    rec.sjdx              AS "数据大小",
    rec.bgdw              AS "保管单位",
    rec.scdw              AS "生产单位",
    rec.bzsm              AS "备注说明",
    rec.tfzbfw            AS "坐标范围",
    rec.tfzbfw            AS "TFZBFW",
    rec.tfzbfw            AS "RANGEDATA",
    rec.dzsj              AS "电子数据",
    rec.cffwqwz           AS "存放服务器位置",
    rec.zsl               AS "总数量",
    rec.kcl               AS "库存量",
    rec.dqbmh             AS "当前保密号",
    rec.rid               AS "RID",
    rec.jid               AS "JID",
    rec.sys_parentrid     AS "SYS_PARENTRID",
    rec.projectdocunid    AS "PROJECTDOCUNID"
FROM proj_kjghcg rec;

GRANT SELECT ON v_proj_kjghcg TO public;
