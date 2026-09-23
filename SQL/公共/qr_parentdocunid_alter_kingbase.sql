--********************************************************************************
-- 为缺少 parentdocunid 的表补列（旧系统 DocUNID / 二维码 32 位码，迁移保留）
-- 执行后请运行 smap_record_lookup_backfill_kingbase.sql 重建索引
--********************************************************************************

-- 基本地形图、空间规划成果
ALTER TABLE proj_jbdxt ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_kjghcg ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
CREATE INDEX IF NOT EXISTS idx_proj_jbdxt_parentdocunid ON proj_jbdxt (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_kjghcg_parentdocunid ON proj_kjghcg (parentdocunid);
COMMENT ON COLUMN proj_jbdxt.parentdocunid IS '旧系统文档ID(DocUNID)，迁移保留，打印旧二维码用';
COMMENT ON COLUMN proj_kjghcg.parentdocunid IS '旧系统文档ID(DocUNID)，迁移保留，打印旧二维码用';

-- 行政文书（31 张表）
ALTER TABLE proj_xzws_jsyd ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_ckqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_tdlygh ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_pcda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_pgda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_bltkqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xltkqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_yxtkqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_zrtkqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_bgtkqda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_djtzh ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_tkqnf ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_zxtkq ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_zzda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_dzzzhzz ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xwsda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_fwhj ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_zlda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_jjwsda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_zfda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_qtdkffw ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_qtdjjsc ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xxtdkfbb ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xxtdkfzb ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xxtdkfpz ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_xjxjy ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_kjda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_swda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_sxda ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_shouwen ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);
ALTER TABLE proj_xzws_fawen ADD COLUMN IF NOT EXISTS parentdocunid CHAR(32);

-- 行政文书 parentdocunid 索引（按需，调档以 smap_record_lookup 为主）
CREATE INDEX IF NOT EXISTS idx_proj_xzws_jsyd_parentdocunid ON proj_xzws_jsyd (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_xzws_ckqda_parentdocunid ON proj_xzws_ckqda (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_xzws_shouwen_parentdocunid ON proj_xzws_shouwen (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_xzws_fawen_parentdocunid ON proj_xzws_fawen (parentdocunid);
