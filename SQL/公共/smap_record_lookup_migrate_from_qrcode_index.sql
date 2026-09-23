--********************************************************************************
-- 从旧表 smap_qrcode_index 迁移到 smap_record_lookup（如已建旧表则执行）
-- 需先执行 smap_record_lookup_kingbase.sql
--********************************************************************************
INSERT INTO smap_record_lookup (
    lookup_type, lookup_key, form_code, rid, token_kind, record_title, createtime, lastmodifytime, status
)
SELECT
    'qrcode',
    token,
    form_code,
    rid,
    token_type,
    record_title,
    createtime,
    lastmodifytime,
    'active'
FROM smap_qrcode_index
WHERE NOT EXISTS (
    SELECT 1 FROM smap_record_lookup l
    WHERE l.lookup_type = 'qrcode' AND l.lookup_key = smap_qrcode_index.token
);

-- 确认数据无误后可手动删除旧表：
-- DROP TABLE IF EXISTS smap_qrcode_index;
