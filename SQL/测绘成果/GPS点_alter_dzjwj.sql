--********************************************************************************
-- GPS控制点表 proj_gpsd：新增「点之记文件」字段 dzjwj
--********************************************************************************

-- 人大金仓
ALTER TABLE proj_gpsd ADD COLUMN dzjwj VARCHAR(500);
COMMENT ON COLUMN proj_gpsd.dzjwj IS '点之记文件';

-- MySQL（按需执行）
-- ALTER TABLE proj_gpsd
--   ADD COLUMN dzjwj VARCHAR(500) NULL COMMENT '点之记文件' AFTER bzsm;
