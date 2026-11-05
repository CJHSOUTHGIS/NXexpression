--********************************************************************************
-- 其他成果出库清单：序列/表权限（cgqd14 同步用）
-- 请将 ibase3_master 替换为 infosvrsmap 实际连接的数据库用户名
--********************************************************************************

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE proj_ckqd_qtcg TO ibase3_master;
GRANT USAGE, SELECT ON SEQUENCE proj_ckqd_qtcg_code_seq TO ibase3_master;
