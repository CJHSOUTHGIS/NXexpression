--********************************************************************************
-- 成果汇交 × 基本地形图 × 在线质检 清单视图（MySQL 8+，需支持窗口函数）
-- 四表合一见 v_cghj_qc_views_mysql.sql
--********************************************************************************

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_pending AS
SELECT
    h.rid                   AS cghj_rid,
    h.jid                   AS cghj_jid,
    h.jsbh                  AS `汇交接收编号`,
    h.zlmc                  AS `汇交资料名称`,
    h.hjdw                  AS `汇交单位`,
    h.hjrq                  AS `汇交日期`,
    h.zllx                  AS `资料类型`,
    h.bhcg                  AS `包含成果`,
    j.rid                   AS jbdxt_rid,
    j.jid                   AS `JID`,
    j.rid                   AS `RID`,
    j.cdbh                  AS `存档编号`,
    j.tm                    AS `图名`,
    j.xth                   AS `新图号`,
    j.jth                   AS `旧图号`,
    j.blc                   AS `比例尺`,
    j.sjlx                  AS `数据类型`,
    j.scnf                  AS `生产年份`,
    j.dzsj                  AS `电子数据`,
    j.tfzbfw                AS `图幅坐标范围`,
    '未质检'                AS `质检状态`
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
LEFT JOIN (
    SELECT
        t.biz_id,
        t.rid AS task_rid,
        ROW_NUMBER() OVER (
            PARTITION BY t.biz_id
            ORDER BY t.createtime DESC
        ) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt'
      AND t.status = 'SUCCESS'
) qc ON qc.biz_id = j.rid AND qc.rn = 1
WHERE qc.task_rid IS NULL;

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_fail AS
SELECT
    h.rid                   AS cghj_rid,
    h.jid                   AS cghj_jid,
    h.jsbh                  AS `汇交接收编号`,
    h.zlmc                  AS `汇交资料名称`,
    h.hjdw                  AS `汇交单位`,
    h.hjrq                  AS `汇交日期`,
    j.rid                   AS jbdxt_rid,
    j.jid                   AS `JID`,
    j.rid                   AS `RID`,
    j.cdbh                  AS `存档编号`,
    j.tm                    AS `图名`,
    j.xth                   AS `新图号`,
    j.jth                   AS `旧图号`,
    j.blc                   AS `比例尺`,
    j.dzsj                  AS `电子数据`,
    q.rid                   AS qc_task_rid,
    q.task_no               AS `质检任务编号`,
    q.conclusion            AS `质检结论`,
    q.rule_version_no       AS `质检规则版本`,
    q.createtime            AS `质检完成时间`
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
INNER JOIN (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY t.biz_id
            ORDER BY t.createtime DESC
        ) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt'
      AND t.status = 'SUCCESS'
) q ON q.biz_id = j.rid AND q.rn = 1 AND q.conclusion = 'FAIL';

CREATE OR REPLACE VIEW v_cghj_jbdxt_qc_pass AS
SELECT
    h.rid                   AS cghj_rid,
    h.jid                   AS cghj_jid,
    h.jsbh                  AS `汇交接收编号`,
    h.zlmc                  AS `汇交资料名称`,
    h.hjdw                  AS `汇交单位`,
    h.hjrq                  AS `汇交日期`,
    j.rid                   AS jbdxt_rid,
    j.jid                   AS `JID`,
    j.rid                   AS `RID`,
    j.cdbh                  AS `存档编号`,
    j.tm                    AS `图名`,
    j.xth                   AS `新图号`,
    j.jth                   AS `旧图号`,
    j.blc                   AS `比例尺`,
    j.dzsj                  AS `电子数据`,
    q.rid                   AS qc_task_rid,
    q.task_no               AS `质检任务编号`,
    q.conclusion            AS `质检结论`,
    q.rule_version_no       AS `质检规则版本`,
    q.createtime            AS `质检完成时间`
FROM proj_jbdxt j
INNER JOIN proj_cghjdj h ON h.rid = j.sys_parentrid
INNER JOIN (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY t.biz_id
            ORDER BY t.createtime DESC
        ) AS rn
    FROM qc_task t
    WHERE t.biz_type = 'proj_jbdxt'
      AND t.status = 'SUCCESS'
) q ON q.biz_id = j.rid AND q.rn = 1 AND q.conclusion = 'PASS';
