--********************************************************************************
-- 三维档案馆「档案列表视图」示例（Kingbase / PostgreSQL 语法）
-- 在档案室配置中填写：档案列表视图 = v_archive_room_ledger
--                      列表排序字段 = create_time DESC, doc_title ASC
-- room_alias 必须与 proj_archive_room.alias（配置页「别名」）一致（大小写不敏感）
--
-- 必需列：rid, form_code, doc_title, room_alias
-- 建议列：parentdocunid, create_time, create_user
-- 扩展：可 UNION ALL 业务台账表，并统一 room_alias 过滤
--********************************************************************************

CREATE OR REPLACE VIEW v_archive_room_ledger AS
SELECT
    COALESCE(NULLIF(TRIM(l.record_rid::varchar), ''), l.parentdocunid) AS rid,
    COALESCE(NULLIF(TRIM(l.form_code), ''), '') AS form_code,
    COALESCE(NULLIF(TRIM(l.record_title), ''), l.parentdocunid) AS doc_title,
    l.createtime AS create_time,
    l.createuser AS create_user,
    UPPER(REPLACE(TRIM(l.parentdocunid), '-', '')) AS parentdocunid,
    r.alias AS room_alias
FROM proj_archive_location l
JOIN proj_archive_room r ON r.code = l.roomcode;

COMMENT ON VIEW v_archive_room_ledger IS '三维浏览页档案清单（示例：本室已定位记录；可改为 UNION 业务视图）';
