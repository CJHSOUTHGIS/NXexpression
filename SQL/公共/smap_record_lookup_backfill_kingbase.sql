--********************************************************************************
-- 从各业务表重建 smap_record_lookup（迁移/补列后执行）
-- 规则：每条记录写入 rid 索引；parentdocunid 非空时再写入 legacy 索引
-- lookup_type 固定为 qrcode
--********************************************************************************
TRUNCATE TABLE smap_record_lookup;

-- 涓氬姟琛紙鍚?parentdocunid锛?
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_sjd', rid, 'rid', COALESCE(tm, dh, rid) FROM proj_sjd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_sjd', rid, 'legacy', COALESCE(tm, dh, rid) FROM proj_sjd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_gpsd', rid, 'rid', COALESCE(dh, rid) FROM proj_gpsd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_gpsd', rid, 'legacy', COALESCE(dh, rid) FROM proj_gpsd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_szd', rid, 'rid', COALESCE(dh, rid) FROM proj_szd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_szd', rid, 'legacy', COALESCE(dh, rid) FROM proj_szd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_jbdxt', rid, 'rid', COALESCE(tm, xth, rid) FROM proj_jbdxt WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_jbdxt', rid, 'legacy', COALESCE(tm, xth, rid) FROM proj_jbdxt WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_kjghcg', rid, 'rid', COALESCE(cgmc, rid) FROM proj_kjghcg WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_kjghcg', rid, 'legacy', COALESCE(cgmc, rid) FROM proj_kjghcg WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_sjswsj', rid, 'rid', COALESCE(sjmc, rid) FROM proj_sjswsj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_sjswsj', rid, 'legacy', COALESCE(sjmc, rid) FROM proj_sjswsj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_hangpian', rid, 'rid', COALESCE(zlmc, rid) FROM proj_hangpian WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_hangpian', rid, 'legacy', COALESCE(zlmc, rid) FROM proj_hangpian WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_weipian', rid, 'rid', COALESCE(zlmc, rid) FROM proj_weipian WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_weipian', rid, 'legacy', COALESCE(zlmc, rid) FROM proj_weipian WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_chxmda', rid, 'rid', COALESCE(xmmc, jsbh, rid) FROM proj_chxmda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_chxmda', rid, 'legacy', COALESCE(xmmc, jsbh, rid) FROM proj_chxmda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_chxmzl', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_chxmzl WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_chxmzl', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_chxmzl WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_chxtzl', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_chxtzl WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_chxtzl', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_chxtzl WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_chxtzlqd', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_chxtzlqd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_chxtzlqd', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_chxtzlqd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_chzlda', rid, 'rid', COALESCE(jsbh, rid) FROM proj_chzlda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_chzlda', rid, 'legacy', COALESCE(jsbh, rid) FROM proj_chzlda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_tdzl', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_tdzl WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_tdzl', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_tdzl WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_tdzlqd', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_tdzlqd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_tdzlqd', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_tdzlqd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xxhxm', rid, 'rid', COALESCE(xmmc, jsbh, rid) FROM proj_xxhxm WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xxhxm', rid, 'legacy', COALESCE(xmmc, jsbh, rid) FROM proj_xxhxm WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xxhxmqd', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xxhxmqd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xxhxmqd', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xxhxmqd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_kjcgdj', rid, 'rid', COALESCE(cgmc, rid) FROM proj_kjcgdj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_kjcgdj', rid, 'legacy', COALESCE(cgmc, rid) FROM proj_kjcgdj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_kxjsjtj', rid, 'rid', COALESCE(xmmc, rid) FROM proj_kxjsjtj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_kxjsjtj', rid, 'legacy', COALESCE(xmmc, rid) FROM proj_kxjsjtj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_dzzlda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_dzzlda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_dzzlda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_dzzlda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_cghjdj', rid, 'rid', COALESCE(xmmc, jsbh, rid) FROM proj_cghjdj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_cghjdj', rid, 'legacy', COALESCE(xmmc, jsbh, rid) FROM proj_cghjdj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_cgsqckdj', rid, 'rid', COALESCE(sqdwmc, ffbh, rid) FROM proj_cgsqckdj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_cgsqckdj', rid, 'legacy', COALESCE(sqdwmc, ffbh, rid) FROM proj_cgsqckdj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

-- 琛屾斂鏂囦功锛堢ず渚嬶細鍏ㄩ儴 31 琛紝缁熶竴 zlmc/jsbh 浣滄爣棰橈級
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_jsyd', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_jsyd WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_jsyd', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_jsyd WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_ckqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_ckqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_ckqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_ckqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_tdlygh', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_tdlygh WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_tdlygh', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_tdlygh WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_pcda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_pcda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_pcda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_pcda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_pgda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_pgda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_pgda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_pgda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_bltkqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_bltkqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_bltkqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_bltkqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xltkqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xltkqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xltkqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xltkqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_yxtkqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_yxtkqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_yxtkqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_yxtkqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_zrtkqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zrtkqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_zrtkqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zrtkqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_bgtkqda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_bgtkqda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_bgtkqda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_bgtkqda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_djtzh', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_djtzh WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_djtzh', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_djtzh WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_tkqnf', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_tkqnf WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_tkqnf', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_tkqnf WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_zxtkq', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zxtkq WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_zxtkq', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zxtkq WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_zzda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zzda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_zzda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zzda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_dzzzhzz', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_dzzzhzz WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_dzzzhzz', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_dzzzhzz WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xwsda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xwsda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xwsda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xwsda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_fwhj', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_fwhj WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_fwhj', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_fwhj WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_zlda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zlda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_zlda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zlda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_jjwsda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_jjwsda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_jjwsda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_jjwsda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_zfda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zfda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_zfda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_zfda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_qtdkffw', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_qtdkffw WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_qtdkffw', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_qtdkffw WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_qtdjjsc', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_qtdjjsc WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_qtdjjsc', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_qtdjjsc WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xxtdkfbb', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfbb WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xxtdkfbb', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfbb WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xxtdkfzb', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfzb WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xxtdkfzb', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfzb WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xxtdkfpz', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfpz WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xxtdkfpz', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xxtdkfpz WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_xjxjy', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xjxjy WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_xjxjy', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_xjxjy WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_kjda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_kjda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_kjda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_kjda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_swda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_swda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_swda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_swda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_sxda', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_sxda WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_sxda', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_sxda WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_shouwen', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_shouwen WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_shouwen', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_shouwen WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', rid, 'proj_xzws_fawen', rid, 'rid', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_fawen WHERE rid IS NOT NULL AND trim(rid) <> '';
INSERT INTO smap_record_lookup (lookup_type, lookup_key, form_code, rid, token_kind, record_title)
SELECT 'qrcode', parentdocunid, 'proj_xzws_fawen', rid, 'legacy', COALESCE(zlmc, jsbh, rid) FROM proj_xzws_fawen WHERE parentdocunid IS NOT NULL AND trim(parentdocunid) <> '';

