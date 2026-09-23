--********************************************************************************
-- SMAP 记录检索索引表（通用）
-- 用途：通过外部标识快速定位 form_code + rid，避免多表遍历
-- 当前已用 lookup_type：qrcode（二维码打印/调档）
-- 后续可扩展：barcode、rfid、manual 等
--********************************************************************************
CREATE TABLE IF NOT EXISTS smap_record_lookup (
    id                BIGSERIAL     NOT NULL,
    lookup_type       VARCHAR(32)   NOT NULL DEFAULT 'qrcode',
    lookup_key        VARCHAR(128)  NOT NULL,
    form_code         VARCHAR(64)   NOT NULL,
    rid               CHAR(36)      NOT NULL,
    token_kind        VARCHAR(16),
    record_title      VARCHAR(255),
    extra_json        TEXT,
    status            VARCHAR(16)   NOT NULL DEFAULT 'active',
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_smap_record_lookup PRIMARY KEY (id),
    CONSTRAINT uk_smap_record_lookup_type_key UNIQUE (lookup_type, lookup_key)
);

CREATE INDEX IF NOT EXISTS idx_smap_record_lookup_form_rid
    ON smap_record_lookup (lookup_type, form_code, rid);
CREATE INDEX IF NOT EXISTS idx_smap_record_lookup_rid
    ON smap_record_lookup (rid);
CREATE INDEX IF NOT EXISTS idx_smap_record_lookup_status
    ON smap_record_lookup (lookup_type, status);

COMMENT ON TABLE smap_record_lookup IS 'SMAP 记录检索索引（二维码/条码等外部标识 → 表单记录）';
COMMENT ON COLUMN smap_record_lookup.lookup_type IS '检索类型：qrcode/barcode/rfid/...';
COMMENT ON COLUMN smap_record_lookup.lookup_key IS '外部标识值（如二维码内容、条码号）';
COMMENT ON COLUMN smap_record_lookup.form_code IS '目标表单编码';
COMMENT ON COLUMN smap_record_lookup.rid IS '目标记录主键';
COMMENT ON COLUMN smap_record_lookup.token_kind IS 'qrcode 子类型：legacy=旧32位码, rid=新UUID';
COMMENT ON COLUMN smap_record_lookup.record_title IS '记录摘要标题（展示用）';
COMMENT ON COLUMN smap_record_lookup.extra_json IS '扩展元数据(JSON)';
COMMENT ON COLUMN smap_record_lookup.status IS 'active/disabled';
