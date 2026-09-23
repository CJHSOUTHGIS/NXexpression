--********************************************************************************
-- MySQL 版：从 staging 表迁入 proj_archive_*（流程同 kingbase 脚本的注释）
-- staging 表名：levi_staging_proj_archive_room / cabinet / location / layer_location
-- 可选：levi_staging_sys_doc_document
--********************************************************************************

START TRANSACTION;

-- DELETE FROM proj_archive_cabinet WHERE parentcode IN (SELECT code FROM proj_archive_room WHERE alias = 'DEMO');
-- DELETE FROM proj_archive_room WHERE alias = 'DEMO';

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
    UPPER(REPLACE(TRIM(s.parentdocunid), '-', '')),
    s.locdescription, s.typex,
    s.roomcode, s.cabinetcode, s.roomalia, s.cabinetname,
    s.cabinetside, s.doorindex, s.layerindex, s.boxindex,
    s.foldercount, s.orderindex,
    IFNULL(d.formpath, ''),
    NULL,
    IFNULL(d.title, ''),
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

COMMIT;
