--********************************************************************************
-- 水准点：人大金仓序列/表权限补授脚本
-- 请将 ibase3_master 替换为 infosvrsmap 实际连接的数据库用户名
--********************************************************************************

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE proj_szd TO ibase3_master;
GRANT USAGE, SELECT ON SEQUENCE proj_szd_code_seq TO ibase3_master;
