--********************************************************************************
-- 从原 Archive3D（达梦 LEVI_ARCHIVE3D.dmp 还原后的表）迁入 SMAP proj_archive_*
--
-- 推荐流程：
--   1) 运行 Archive3D/数据库导出导入/导入数据库.bat，在达梦还原 dmp
--   2) 用 DTS / KStudio / 数据迁移工具，将下列表拷到 SMAP 库同一 schema 的 staging 表（小写）：
--        levi_staging_proj_archive_room
--        levi_staging_proj_archive_cabinet
--        levi_staging_proj_archive_location
--        levi_staging_proj_archive_layer_location
--      可选（用于位置行的 form_code / record_title）：
--        levi_staging_sys_doc_document
--   3) 在 SMAP 库已执行 proj_archive_room_kingbase.sql 建表后，执行本脚本
--
-- 日志参考（示例环境）：ROOM 5 行、CABINET 125 行、LOCATION 1 行、LAYER_LOCATION 0 行
--********************************************************************************

BEGIN;

-- 若不需要演示数据，可取消注释（避免与导入的 code/别名冲突）
-- DELETE FROM proj_archive_cabinet WHERE parentcode IN (SELECT code FROM proj_archive_room WHERE alias = 'DEMO');
-- DELETE FROM proj_archive_room WHERE alias = 'DEMO';

-- ---------- 档案室 ----------
INSERT INTO proj_archive_room (
    code, orderindex, legacy_doc_unid, name, alias,
    x_length, y_length, h_length,
    keyholders, roommanagers, remark,
    pillarinfo, doorsinfo, windowsinfo,
    sqlviewname, listordercolumn,
    initpostion_x, initpostion_y, initpostion_h, initpostion_rot,
    movestep, locatedistance, floortextureimage, cabinetmovedistance,
    elementname_cabinet, elementname_side, elementname_door, elementname_layer,
    createtime, createuser, lastmodifytime, lastmodifyuser
)
SELECT
    s.code, s.orderindex, s.legacy_doc_unid, s.name, s.alias,
    s.x_length, s.y_length, s.h_length,
    s.keyholders, s.roommanagers, s.remark,
    s.pillarinfo, s.doorsinfo, s.windowsinfo,
    s.sqlviewname, s.listordercolumn,
    s.initpostion_x, s.initpostion_y, s.initpostion_h, s.initpostion_rot,
    s.movestep, s.locatedistance, s.floortextureimage, s.cabinetmovedistance,
    s.elementname_cabinet, s.elementname_side, s.elementname_door, s.elementname_layer,
    s.createtime, s.createuser, s.lastmodifytime, s.lastmodifyuser
FROM levi_staging_proj_archive_room s
WHERE NOT EXISTS (SELECT 1 FROM proj_archive_room t WHERE t.code = s.code);

-- ---------- 档案柜（依赖 room） ----------
INSERT INTO proj_archive_cabinet (
    code, legacy_doc_unid, parentcode, name,
    lenght, height, width, startx, starty, starth,
    doornumberh, doornumberv, withdoor, doortype, cabinettype, direction,
    remark, defaultleyercount, defaultfolderwidth, everydoorconfig,
    doorheightpercents, doorwidthpercents,
    layerdirection, doorrowdirection, doorcolumndirection,
    doornameformula, doornameformula2, doornamesize,
    layernameformula, layernameformula2, layernamesize, foldernamesize,
    locationformula, defaultfoldermode, operatingside, dooropendirection,
    foldernamealign, folderordermode,
    createtime, createuser, lastmodifytime, lastmodifyuser
)
SELECT
    s.code, s.legacy_doc_unid, s.parentcode, s.name,
    s.lenght, s.height, s.width, s.startx, s.starty, s.starth,
    s.doornumberh, s.doornumberv, s.withdoor, s.doortype, s.cabinettype, s.direction,
    s.remark, s.defaultleyercount, s.defaultfolderwidth, s.everydoorconfig,
    s.doorheightpercents, s.doorwidthpercents,
    s.layerdirection, s.doorrowdirection, s.doorcolumndirection,
    s.doornameformula, s.doornameformula2, s.doornamesize,
    s.layernameformula, s.layernameformula2, s.layernamesize, s.foldernamesize,
    s.locationformula, s.defaultfoldermode, s.operatingside, s.dooropendirection,
    s.foldernamealign, s.folderordermode,
    s.createtime, s.createuser, s.lastmodifytime, s.lastmodifyuser
FROM levi_staging_proj_archive_cabinet s
WHERE EXISTS (SELECT 1 FROM proj_archive_room r WHERE r.code = s.parentcode)
  AND NOT EXISTS (SELECT 1 FROM proj_archive_cabinet t WHERE t.code = s.code);

-- ---------- 层位描述（可选，原库常为空） ----------
INSERT INTO proj_archive_layer_location (
    code, location, roomalia, cabinetname, cabinetside, doorindex, layerindex
)
SELECT
    s.code, s.location, s.roomalia, s.cabinetname, s.cabinetside, s.doorindex, s.layerindex
FROM levi_staging_proj_archive_layer_location s
WHERE NOT EXISTS (
    SELECT 1 FROM proj_archive_layer_location t
    WHERE t.roomalia = s.roomalia AND t.cabinetname = s.cabinetname
      AND t.cabinetside = s.cabinetside AND t.doorindex = s.doorindex
      AND t.layerindex = s.layerindex
);

-- ---------- 文档物理位置（无 SYS_DOC 外键；扩展 smap 字段） ----------
INSERT INTO proj_archive_location (
    code, parentdocunid, locdescription, typex,
    roomcode, cabinetcode, roomalia, cabinetname,
    cabinetside, doorindex, layerindex, boxindex,
    foldercount, orderindex,
    form_code, record_rid, record_title,
    createtime, createuser, lastmodifytime, lastmodifyuser
)
SELECT
    s.code,
    UPPER(REPLACE(TRIM(s.parentdocunid), '-', '')) AS parentdocunid,
    s.locdescription, s.typex,
    s.roomcode, s.cabinetcode, s.roomalia, s.cabinetname,
    s.cabinetside, s.doorindex, s.layerindex, s.boxindex,
    s.foldercount, s.orderindex,
    COALESCE(d.formpath, '') AS form_code,
    NULL::CHAR(36) AS record_rid,
    COALESCE(d.title, '') AS record_title,
    s.createtime, s.createuser, s.lastmodifytime, s.lastmodifyuser
FROM levi_staging_proj_archive_location s
LEFT JOIN levi_staging_sys_doc_document d
    ON UPPER(REPLACE(TRIM(d.code), '-', '')) = UPPER(REPLACE(TRIM(s.parentdocunid), '-', ''))
WHERE EXISTS (SELECT 1 FROM proj_archive_room r WHERE r.code = s.roomcode)
  AND EXISTS (SELECT 1 FROM proj_archive_cabinet c WHERE c.code = s.cabinetcode)
  AND NOT EXISTS (
      SELECT 1 FROM proj_archive_location t
      WHERE UPPER(t.parentdocunid) = UPPER(REPLACE(TRIM(s.parentdocunid), '-', ''))
  );

-- 若台账已迁入 smap，可按 parentdocunid 回填 record_rid（示例，按实际 lookup 表调整）
-- UPDATE proj_archive_location l
-- SET record_rid = lk.rid::CHAR(36),
--     form_code = COALESCE(NULLIF(l.form_code, ''), lk.form_code)
-- FROM smap_record_lookup lk
-- WHERE lk.lookup_type = 'doc_unid'
--   AND UPPER(REPLACE(lk.lookup_key, '-', '')) = UPPER(l.parentdocunid);

SELECT setval(
    'proj_archive_room_seq',
    GREATEST(COALESCE((SELECT MAX(code) FROM proj_archive_room), 10000), 10000)
);
SELECT setval(
    'proj_archive_cabinet_seq',
    GREATEST(COALESCE((SELECT MAX(code) FROM proj_archive_cabinet), 10000), 10000)
);
SELECT setval(
    'proj_archive_location_seq',
    GREATEST(COALESCE((SELECT MAX(code) FROM proj_archive_location), 10000), 10000)
);
SELECT setval(
    'proj_archive_layer_loc_seq',
    GREATEST(COALESCE((SELECT MAX(code) FROM proj_archive_layer_location), 10000), 10000)
);

COMMIT;
