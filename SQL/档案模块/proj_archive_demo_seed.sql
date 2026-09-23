-- 演示用档案室（执行建表脚本后可选运行）
-- MySQL / Kingbase 通用 INSERT（请按实际 code 序列调整）

INSERT INTO proj_archive_room (
  code, orderindex, name, alias, x_length, y_length, h_length,
  initpostion_x, initpostion_y, initpostion_h, initpostion_rot,
  movestep, locatedistance, cabinetmovedistance,
  elementname_cabinet, elementname_side, elementname_door, elementname_layer,
  createtime, createuser
) VALUES (
  10001, 0, '演示档案室', 'DEMO', 18, 14, 3.2,
  2, 2, 1.62, 0,
  0.5, 2.5, 4,
  '档案柜', '柜面', '柜门', '层',
  '2026-01-01 00:00:00', 'seed'
);

INSERT INTO proj_archive_cabinet (
  code, parentcode, name, lenght, height, width,
  startx, starty, starth, doornumberh, doornumberv,
  withdoor, doortype, cabinettype, direction,
  defaultleyercount, defaultfolderwidth, defaultfoldermode, folderordermode,
  createtime, createuser
) VALUES (
  10001, 10001, 'A-01', 1.2, 2.0, 0.6,
  3, 4, 0, 2, 2,
  1, 1, 1, 1,
  4, 0.08, 1, 0,
  '2026-01-01 00:00:00', 'seed'
);

-- Kingbase：若仍使用序列发号，执行下面两句避免与 10001 演示数据冲突（后端已改为 MAX(code)+1，可选）
-- SELECT setval('proj_archive_room_seq', (SELECT MAX(code) FROM proj_archive_room));
-- SELECT setval('proj_archive_cabinet_seq', (SELECT MAX(code) FROM proj_archive_cabinet));
