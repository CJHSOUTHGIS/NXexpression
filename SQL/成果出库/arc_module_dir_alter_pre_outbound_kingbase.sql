-- 目录节点：预出库配置 JSON
ALTER TABLE arc_module_dir ADD COLUMN IF NOT EXISTS pre_outbound_config TEXT;
COMMENT ON COLUMN arc_module_dir.pre_outbound_config IS '预出库配置 JSON：enabled/formCode/outboundTypeIndex';
