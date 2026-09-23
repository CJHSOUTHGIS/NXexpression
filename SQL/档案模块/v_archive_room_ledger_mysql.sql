--********************************************************************************
-- 三维档案馆「档案列表视图」示例（MySQL）
-- 档案室配置：sqlviewname = v_archive_room_ledger
--********************************************************************************

CREATE OR REPLACE VIEW v_archive_room_ledger AS
SELECT
    COALESCE(NULLIF(TRIM(l.record_rid), ''), l.parentdocunid) AS rid,
    COALESCE(NULLIF(TRIM(l.form_code), ''), '') AS form_code,
    COALESCE(NULLIF(TRIM(l.record_title), ''), l.parentdocunid) AS doc_title,
    l.createtime AS create_time,
    l.createuser AS create_user,
    UPPER(REPLACE(TRIM(l.parentdocunid), '-', '')) AS parentdocunid,
    r.alias AS room_alias
FROM proj_archive_location l
JOIN proj_archive_room r ON r.code = l.roomcode;
