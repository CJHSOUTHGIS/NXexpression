--********************************************************************************
-- 成果汇交 × 已接入在线质检的元数据表单 — 清单视图（人大金仓）
--
-- 覆盖表单（与 smapweb FormQcBar 一致）：
--   proj_jbdxt   基本地形图
--   proj_hangpian 航摄影像
--   proj_weipian  卫星影像
--   proj_tdzl     土地资料（汇交元数据主表，质检 biz_id = proj_tdzl.rid）
--
-- 关联：子表/元数据 sys_parentrid = proj_cghjdj.rid
-- 质检：qc_task.biz_type = 表单 code，biz_id = 对应 rid
-- 最新质检：status = 'SUCCESS'，按 createtime 降序取 1 条
-- 列表打开表单："RID"/"JID" 为成果元数据行；cghj_rid/cghj_jid 为汇交登记主表
--
-- 单表单脚本仍保留：v_cghj_proj_jbdxt_qc_kingbase.sql（与本文件 jbdxt 段相同）
--********************************************************************************

-- ======================== proj_jbdxt ========================

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_pending AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期", h.zllx AS "资料类型", h.bhcg AS "包含成果",
    j.rid AS jbdxt_rid, j.jid AS "JID", j.rid AS "RID", j.cdbh AS "存档编号", j.tm AS "图名", j.xth AS "新图号", j.jth AS "旧图号",
    j.blc AS "比例尺", j.sjlx AS "数据类型", j.scnf AS "生产年份", j.dzsj AS "电子数据",
    j.tfzbfw AS "图幅坐标范围", '未质检' AS "质检状态"
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
LEFT JOIN (
    SELECT t.biz_id, t.rid AS task_rid,
           ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt' AND t.status = 'SUCCESS'
) qc ON qc.biz_id = j.rid AND qc.rn = 1
WHERE qc.task_rid IS NULL;

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_fail AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    j.rid AS jbdxt_rid, j.jid AS "JID", j.rid AS "RID", j.cdbh AS "存档编号", j.tm AS "图名", j.xth AS "新图号", j.jth AS "旧图号",
    j.blc AS "比例尺", j.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt' AND t.status = 'SUCCESS'
) q ON q.biz_id = j.rid AND q.rn = 1 AND q.conclusion = 'FAIL';

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_pass AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    j.rid AS jbdxt_rid, j.jid AS "JID", j.rid AS "RID", j.cdbh AS "存档编号", j.tm AS "图名", j.xth AS "新图号", j.jth AS "旧图号",
    j.blc AS "比例尺", j.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt' AND t.status = 'SUCCESS'
) q ON q.biz_id = j.rid AND q.rn = 1 AND q.conclusion = 'PASS';

COMMENT ON VIEW v_cghj_jbdxt_qc_pending IS '成果汇交-基本地形图-未质检';
COMMENT ON VIEW v_cghj_jbdxt_qc_fail IS '成果汇交-基本地形图-质检不通过';
COMMENT ON VIEW v_cghj_jbdxt_qc_pass IS '成果汇交-基本地形图-质检通过';

-- ======================== proj_hangpian ========================

CREATE OR REPLACE VIEW v_cghj_hangpian_qc_pending AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期", h.zllx AS "资料类型", h.bhcg AS "包含成果",
    p.rid AS hangpian_rid, p.jid AS "JID", p.rid AS "RID", p.hpbh AS "影像编号", p.zlmc AS "资料名称", p.sjlx AS "数据类型",
    p.blc AS "比例尺", p.fbl AS "精度", p.dzsj AS "电子数据", p.rangedata AS "范围数据",
    '未质检' AS "质检状态"
FROM proj_hangpian p
INNER JOIN proj_cghjdj h ON h.rid = p.sys_parentrid
LEFT JOIN (
    SELECT t.biz_id, t.rid AS task_rid,
           ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_hangpian' AND t.status = 'SUCCESS'
) qc ON qc.biz_id = p.rid AND qc.rn = 1
WHERE qc.task_rid IS NULL;

CREATE OR REPLACE VIEW v_cghj_hangpian_qc_fail AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    p.rid AS hangpian_rid, p.jid AS "JID", p.rid AS "RID", p.hpbh AS "影像编号", p.zlmc AS "资料名称", p.blc AS "比例尺", p.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_hangpian p
INNER JOIN proj_cghjdj h ON h.rid = p.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_hangpian' AND t.status = 'SUCCESS'
) q ON q.biz_id = p.rid AND q.rn = 1 AND q.conclusion = 'FAIL';

CREATE OR REPLACE VIEW v_cghj_hangpian_qc_pass AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    p.rid AS hangpian_rid, p.jid AS "JID", p.rid AS "RID", p.hpbh AS "影像编号", p.zlmc AS "资料名称", p.blc AS "比例尺", p.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_hangpian p
INNER JOIN proj_cghjdj h ON h.rid = p.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_hangpian' AND t.status = 'SUCCESS'
) q ON q.biz_id = p.rid AND q.rn = 1 AND q.conclusion = 'PASS';

COMMENT ON VIEW v_cghj_hangpian_qc_pending IS '成果汇交-航摄影像-未质检';
COMMENT ON VIEW v_cghj_hangpian_qc_fail IS '成果汇交-航摄影像-质检不通过';
COMMENT ON VIEW v_cghj_hangpian_qc_pass IS '成果汇交-航摄影像-质检通过';

-- ======================== proj_weipian ========================

CREATE OR REPLACE VIEW v_cghj_weipian_qc_pending AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期", h.zllx AS "资料类型", h.bhcg AS "包含成果",
    w.rid AS weipian_rid, w.jid AS "JID", w.rid AS "RID", w.wpbh AS "影像编号", w.zlmc AS "资料名称", w.sjlx AS "数据类型",
    w.blc AS "比例尺", w.fbl AS "精度", w.dzsj AS "电子数据", w.rangedata AS "范围数据",
    '未质检' AS "质检状态"
FROM proj_weipian w
INNER JOIN proj_cghjdj h ON h.rid = w.sys_parentrid
LEFT JOIN (
    SELECT t.biz_id, t.rid AS task_rid,
           ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_weipian' AND t.status = 'SUCCESS'
) qc ON qc.biz_id = w.rid AND qc.rn = 1
WHERE qc.task_rid IS NULL;

CREATE OR REPLACE VIEW v_cghj_weipian_qc_fail AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    w.rid AS weipian_rid, w.jid AS "JID", w.rid AS "RID", w.wpbh AS "影像编号", w.zlmc AS "资料名称", w.blc AS "比例尺", w.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_weipian w
INNER JOIN proj_cghjdj h ON h.rid = w.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_weipian' AND t.status = 'SUCCESS'
) q ON q.biz_id = w.rid AND q.rn = 1 AND q.conclusion = 'FAIL';

CREATE OR REPLACE VIEW v_cghj_weipian_qc_pass AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    w.rid AS weipian_rid, w.jid AS "JID", w.rid AS "RID", w.wpbh AS "影像编号", w.zlmc AS "资料名称", w.blc AS "比例尺", w.dzsj AS "电子数据",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_weipian w
INNER JOIN proj_cghjdj h ON h.rid = w.sys_parentrid
INNER JOIN (
    SELECT t.*, ROW_NUMBER() OVER (PARTITION BY t.biz_id ORDER BY t.createtime DESC) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_weipian' AND t.status = 'SUCCESS'
) q ON q.biz_id = w.rid AND q.rn = 1 AND q.conclusion = 'PASS';

COMMENT ON VIEW v_cghj_weipian_qc_pending IS '成果汇交-卫星影像-未质检';
COMMENT ON VIEW v_cghj_weipian_qc_fail IS '成果汇交-卫星影像-质检不通过';
COMMENT ON VIEW v_cghj_weipian_qc_pass IS '成果汇交-卫星影像-质检通过';

-- ======================== proj_tdzl ========================

CREATE OR REPLACE VIEW v_cghj_tdzl_qc_pending AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期", h.zllx AS "资料类型", h.bhcg AS "包含成果",
    t.rid AS tdzl_rid, t.jid AS "JID", t.rid AS "RID", t.jsbh AS "土地接收编号", t.cdbh AS "存档编号", t.zlmc AS "土地资料名称",
    t.hjdw AS "土地汇交单位", t.hjrq AS "土地汇交时间", t.hjqd AS "汇交清单",
    '未质检' AS "质检状态"
FROM proj_tdzl t
INNER JOIN proj_cghjdj h ON h.rid = t.sys_parentrid
LEFT JOIN (
    SELECT t2.biz_id, t2.rid AS task_rid,
           ROW_NUMBER() OVER (PARTITION BY t2.biz_id ORDER BY t2.createtime DESC) AS rn
    FROM qc_task t2
    WHERE t2.biz_type = 'proj_tdzl' AND t2.status = 'SUCCESS'
) qc ON qc.biz_id = t.rid AND qc.rn = 1
WHERE qc.task_rid IS NULL;

CREATE OR REPLACE VIEW v_cghj_tdzl_qc_fail AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    t.rid AS tdzl_rid, t.jid AS "JID", t.rid AS "RID", t.cdbh AS "存档编号", t.zlmc AS "土地资料名称", t.hjqd AS "汇交清单",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_tdzl t
INNER JOIN proj_cghjdj h ON h.rid = t.sys_parentrid
INNER JOIN (
    SELECT t2.*, ROW_NUMBER() OVER (PARTITION BY t2.biz_id ORDER BY t2.createtime DESC) AS rn
    FROM qc_task t2
    WHERE t2.biz_type = 'proj_tdzl' AND t2.status = 'SUCCESS'
) q ON q.biz_id = t.rid AND q.rn = 1 AND q.conclusion = 'FAIL';

CREATE OR REPLACE VIEW v_cghj_tdzl_qc_pass AS
SELECT
    h.rid AS cghj_rid, h.jid AS cghj_jid, h.jsbh AS "汇交接收编号", h.zlmc AS "汇交资料名称",
    h.hjdw AS "汇交单位", h.hjrq AS "汇交日期",
    t.rid AS tdzl_rid, t.jid AS "JID", t.rid AS "RID", t.cdbh AS "存档编号", t.zlmc AS "土地资料名称", t.hjqd AS "汇交清单",
    q.rid AS qc_task_rid, q.task_no AS "质检任务编号", q.conclusion AS "质检结论",
    q.rule_version_no AS "质检规则版本", q.createtime AS "质检完成时间"
FROM proj_tdzl t
INNER JOIN proj_cghjdj h ON h.rid = t.sys_parentrid
INNER JOIN (
    SELECT t2.*, ROW_NUMBER() OVER (PARTITION BY t2.biz_id ORDER BY t2.createtime DESC) AS rn
    FROM qc_task t2
    WHERE t2.biz_type = 'proj_tdzl' AND t2.status = 'SUCCESS'
) q ON q.biz_id = t.rid AND q.rn = 1 AND q.conclusion = 'PASS';

COMMENT ON VIEW v_cghj_tdzl_qc_pending IS '成果汇交-土地资料-未质检';
COMMENT ON VIEW v_cghj_tdzl_qc_fail IS '成果汇交-土地资料-质检不通过';
COMMENT ON VIEW v_cghj_tdzl_qc_pass IS '成果汇交-土地资料-质检通过';

-- ======================== 授权 ========================

GRANT SELECT ON v_cghj_jbdxt_qc_pending TO public;
GRANT SELECT ON v_cghj_jbdxt_qc_fail TO public;
GRANT SELECT ON v_cghj_jbdxt_qc_pass TO public;
GRANT SELECT ON v_cghj_hangpian_qc_pending TO public;
GRANT SELECT ON v_cghj_hangpian_qc_fail TO public;
GRANT SELECT ON v_cghj_hangpian_qc_pass TO public;
GRANT SELECT ON v_cghj_weipian_qc_pending TO public;
GRANT SELECT ON v_cghj_weipian_qc_fail TO public;
GRANT SELECT ON v_cghj_weipian_qc_pass TO public;
GRANT SELECT ON v_cghj_tdzl_qc_pending TO public;
GRANT SELECT ON v_cghj_tdzl_qc_fail TO public;
GRANT SELECT ON v_cghj_tdzl_qc_pass TO public;
