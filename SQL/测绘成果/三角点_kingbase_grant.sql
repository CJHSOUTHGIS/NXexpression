--********************************************************************************
-- 三角点：人大金仓序列/表权限补授脚本
-- 错误示例：permission denied for sequence proj_sjd_code_seq
-- 请将 ibase3_master 替换为 infosvrsmap 实际连接的数据库用户名
--********************************************************************************

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE proj_sjd TO ibase3_master;
GRANT USAGE, SELECT ON SEQUENCE proj_sjd_code_seq TO ibase3_master;

-- 若表/序列不在 public 模式，请加上模式名，例如：
-- GRANT USAGE, SELECT ON SEQUENCE your_schema.proj_sjd_code_seq TO ibase3_master;
