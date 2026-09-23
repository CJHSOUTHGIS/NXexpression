-- ============================================================
-- 三角点表 proj_sjd：新增「点之记文件」字段 dzjwj
-- 用途：已有库升级（新建库请直接使用 三角点_kingbase.sql / 三角点_mysql.sql）
-- 存储格式：文件名|macroPath（与平台 filemgr 上传约定一致）
-- ============================================================

-- ---------- 人大金仓 / KingbaseES ----------
-- 若列已存在会报错，可忽略或先检查 information_schema.columns
ALTER TABLE proj_sjd ADD COLUMN dzjwj VARCHAR(500);

COMMENT ON COLUMN proj_sjd.dzjwj IS '点之记文件';

-- ---------- MySQL ----------
-- ALTER TABLE proj_sjd
--   ADD COLUMN dzjwj VARCHAR(500) NULL COMMENT '点之记文件' AFTER bzsm;
