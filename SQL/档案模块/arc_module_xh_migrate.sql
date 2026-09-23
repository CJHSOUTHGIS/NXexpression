-- ============================================================
-- arc_module_dir / arc_module_btn：xh 字段 varchar → INTEGER
-- 数据库：人大金仓（Kingbase ES，PostgreSQL 兼容模式）
-- 说明：应用启动时 ArcModuleTableHelper 也会自动尝试迁移；
--       若需手动执行，请按顺序运行下方语句。
-- ============================================================

-- 1. 迁移前检查（可选）
-- SELECT dir_id, dir_name, xh
-- FROM arc_module_dir
-- WHERE xh IS NULL OR BTRIM(CAST(xh AS VARCHAR)) = '' OR BTRIM(CAST(xh AS VARCHAR)) !~ '^[0-9]+$';

-- 2. arc_module_dir.xh
ALTER TABLE arc_module_dir ALTER COLUMN xh TYPE INTEGER USING (
  CASE
    WHEN xh IS NULL OR BTRIM(CAST(xh AS VARCHAR)) = '' THEN 0
    WHEN BTRIM(CAST(xh AS VARCHAR)) ~ '^[0-9]+$' THEN BTRIM(CAST(xh AS VARCHAR))::INTEGER
    ELSE 0
  END
);
ALTER TABLE arc_module_dir ALTER COLUMN xh SET DEFAULT 0;

-- 3. arc_module_btn.xh
ALTER TABLE arc_module_btn ALTER COLUMN xh TYPE INTEGER USING (
  CASE
    WHEN xh IS NULL OR BTRIM(CAST(xh AS VARCHAR)) = '' THEN 0
    WHEN BTRIM(CAST(xh AS VARCHAR)) ~ '^[0-9]+$' THEN BTRIM(CAST(xh AS VARCHAR))::INTEGER
    ELSE 0
  END
);
ALTER TABLE arc_module_btn ALTER COLUMN xh SET DEFAULT 0;

-- 4. 验证排序（将 module_id 换成实际值）
-- SELECT dir_name, xh
-- FROM arc_module_dir
-- WHERE module_id = '3a7343d7-dede-4f12-ac91-806e36bb796a'
--   AND (parent_dir_id IS NULL OR parent_dir_id = '')
-- ORDER BY xh;

-- ============================================================
-- 其他数据库参考（勿与上方 Kingbase 语句混跑）
-- ============================================================

-- MySQL:
-- UPDATE arc_module_dir SET xh = '0' WHERE xh IS NULL OR TRIM(xh) = '' OR xh NOT REGEXP '^[0-9]+$';
-- ALTER TABLE arc_module_dir MODIFY COLUMN xh INT DEFAULT 0;
-- UPDATE arc_module_btn SET xh = '0' WHERE xh IS NULL OR TRIM(xh) = '' OR xh NOT REGEXP '^[0-9]+$';
-- ALTER TABLE arc_module_btn MODIFY COLUMN xh INT DEFAULT 0;

-- Oracle / 达梦:
-- ALTER TABLE arc_module_dir ADD (xh_new NUMBER(10) DEFAULT 0);
-- UPDATE arc_module_dir SET xh_new = CASE WHEN xh IS NULL OR TRIM(xh) IS NULL THEN 0 WHEN REGEXP_LIKE(TRIM(xh), '^[0-9]+$') THEN TO_NUMBER(TRIM(xh)) ELSE 0 END;
-- ALTER TABLE arc_module_dir DROP COLUMN xh;
-- ALTER TABLE arc_module_dir RENAME COLUMN xh_new TO xh;
