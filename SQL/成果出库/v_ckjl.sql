--********************************************************************************
-- 出库记录视图（13 类），对齐旧系统 VIEW_CKJL_* 并扩展规划成果、实景三维
-- 供台账/统计模块按视图名绑定查询
--
-- 视图对照表：
--   v_ckjl_dxt   基本地形图     ← proj_ckqd_dxt   / cgqd1  / VIEW_CKJL_DXT
--   v_ckjl_hp    航摄影像       ← proj_ckqd_hp    / cgqd2  / VIEW_CKJL_HP
--   v_ckjl_wp    卫星影像       ← proj_ckqd_wp    / cgqd3  / VIEW_CKJL_WP
--   v_ckjl_gpsd  GPS控制点      ← proj_ckqd_gpsd  / cgqd4  / VIEW_CKJL_GPSD
--   v_ckjl_sjd   三角控制点     ← proj_ckqd_sjd   / cgqd5  / VIEW_CKJL_SJD
--   v_ckjl_szd   水准控制点     ← proj_ckqd_szd   / cgqd6  / VIEW_CKJL_SZD
--   v_ckjl_zt    专题数据       ← proj_ckqd_zt    / cgqd7  / VIEW_CKJL_ZT
--   v_ckjl_td    土地资料       ← proj_ckqd_td    / cgqd8  / VIEW_CKJL_TD
--   v_ckjl_kj    科技档案       ← proj_ckqd_kj    / cgqd9  / VIEW_CKJL_KJ
--   v_ckjl_chxm  测绘项目档案   ← proj_ckqd_chxm  / cgqd10 / VIEW_CKJL_CHXM
--   v_ckjl_qt    其它资料       ← proj_ckqd_qt    / cgqd11 / VIEW_CKJL_QT
--   v_ckjl_ghcg  规划成果       ← proj_ckqd_ghcg  / cgqd12
--   v_ckjl_sjsw  实景三维       ← proj_ckqd_sjsw  / cgqd13
--********************************************************************************

-- 基本地形图出库记录（v_ckjl_dxt / proj_ckqd_dxt / cgqd1）
CREATE OR REPLACE VIEW v_ckjl_dxt AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.blc             AS "比例尺",
    cr.tfh             AS "图号",
    cr.lx              AS "类型",
    cr.ztxs            AS "载体类型",
    cr.fs              AS "份数",
    cr.bmh             AS "保密号",
    m.rid              AS "RID"
FROM proj_ckqd_dxt cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 航摄影像出库记录（v_ckjl_hp / proj_ckqd_hp / cgqd2）
CREATE OR REPLACE VIEW v_ckjl_hp AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.sjlx            AS "数据类型",
    cr.jd              AS "精度",
    cr.pssj            AS "拍摄时间",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    cr.bmh             AS "保密号",
    m.rid              AS "RID"
FROM proj_ckqd_hp cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 卫星影像出库记录（v_ckjl_wp / proj_ckqd_wp / cgqd3）
CREATE OR REPLACE VIEW v_ckjl_wp AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.sjlx            AS "数据类型",
    cr.jd              AS "精度",
    cr.pssj            AS "拍摄时间",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数据量",
    cr.bmh             AS "保密号",
    m.rid              AS "RID"
FROM proj_ckqd_wp cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- GPS控制点出库记录（v_ckjl_gpsd / proj_ckqd_gpsd / cgqd4）
CREATE OR REPLACE VIEW v_ckjl_gpsd AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.dh              AS "点号",
    cr.dm              AS "点名",
    cr.dj              AS "等级",
    cr.sztfh           AS "所在图幅号",
    cr.zbxt            AS "坐标系统",
    m.rid              AS "RID"
FROM proj_ckqd_gpsd cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 三角控制点出库记录（v_ckjl_sjd / proj_ckqd_sjd / cgqd5）
CREATE OR REPLACE VIEW v_ckjl_sjd AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.dh              AS "点号",
    cr.dm              AS "点名",
    cr.dj              AS "等级",
    cr.sztfh           AS "所在图幅号",
    cr.zbxt            AS "坐标系统",
    m.rid              AS "RID"
FROM proj_ckqd_sjd cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 水准控制点出库记录（v_ckjl_szd / proj_ckqd_szd / cgqd6）
CREATE OR REPLACE VIEW v_ckjl_szd AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.dh              AS "点号",
    cr.dm              AS "点名",
    cr.dj              AS "等级",
    cr.lxmc            AS "路线名称",
    cr.gcjz            AS "高程基准",
    m.rid              AS "RID"
FROM proj_ckqd_szd cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 专题数据出库记录（v_ckjl_zt / proj_ckqd_zt / cgqd7）
CREATE OR REPLACE VIEW v_ckjl_zt AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.cdbh            AS "存档编号",
    cr.hjdw            AS "汇交单位",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_zt cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 土地资料出库记录（v_ckjl_td / proj_ckqd_td / cgqd8）
CREATE OR REPLACE VIEW v_ckjl_td AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.cdbh            AS "存档编号",
    cr.hjdw            AS "汇交单位",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_td cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 科技档案出库记录（v_ckjl_kj / proj_ckqd_kj / cgqd9）
CREATE OR REPLACE VIEW v_ckjl_kj AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.cdbh            AS "存档编号",
    cr.hjdw            AS "汇交单位",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_kj cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 测绘项目档案出库记录（v_ckjl_chxm / proj_ckqd_chxm / cgqd10）
CREATE OR REPLACE VIEW v_ckjl_chxm AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.xmmc            AS "项目名称",
    cr.zlmc            AS "资料名称",
    cr.sjlx            AS "数据类型",
    cr.cdbh            AS "存档编号",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_chxm cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 其它资料出库记录（v_ckjl_qt / proj_ckqd_qt / cgqd11）
CREATE OR REPLACE VIEW v_ckjl_qt AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "资料名称",
    cr.dalx            AS "档案类型",
    cr.cdbh            AS "存档编号",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_qt cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 规划成果出库记录（v_ckjl_ghcg / proj_ckqd_ghcg / cgqd12）
CREATE OR REPLACE VIEW v_ckjl_ghcg AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "成果名称",
    cr.ghlx            AS "规划类型",
    cr.cdbh            AS "存档编号",
    cr.blc             AS "比例尺",
    cr.zbxt            AS "坐标系统",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_ghcg cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

-- 实景三维出库记录（v_ckjl_sjsw / proj_ckqd_sjsw / cgqd13）
CREATE OR REPLACE VIEW v_ckjl_sjsw AS
SELECT
    m.rid              AS code,
    m.parentdocunid    AS parentdocunid,
    m.sqdwmc           AS "单位名称",
    m.gksx             AS "归口属性",
    m.gkdw             AS "归口单位",
    m.sqyt             AS "用途类型",
    m.syfs             AS "使用方式",
    m.ffbh             AS "分发单号",
    m.ckrq             AS "出库日期",
    cr.zlmc            AS "数据名称",
    cr.sjlx            AS "数据类型",
    cr.fbl             AS "分辨率",
    cr.scnf            AS "生产年份",
    cr.zbxt            AS "坐标系统",
    cr.ztxs            AS "载体形式",
    cr.sl              AS "数量",
    m.rid              AS "RID"
FROM proj_ckqd_sjsw cr
INNER JOIN proj_cgsqckdj m ON m.rid = cr.parent_rid;

GRANT SELECT ON v_ckjl_dxt TO public;
GRANT SELECT ON v_ckjl_hp TO public;
GRANT SELECT ON v_ckjl_wp TO public;
GRANT SELECT ON v_ckjl_gpsd TO public;
GRANT SELECT ON v_ckjl_sjd TO public;
GRANT SELECT ON v_ckjl_szd TO public;
GRANT SELECT ON v_ckjl_zt TO public;
GRANT SELECT ON v_ckjl_td TO public;
GRANT SELECT ON v_ckjl_kj TO public;
GRANT SELECT ON v_ckjl_chxm TO public;
GRANT SELECT ON v_ckjl_qt TO public;
GRANT SELECT ON v_ckjl_ghcg TO public;
GRANT SELECT ON v_ckjl_sjsw TO public;
