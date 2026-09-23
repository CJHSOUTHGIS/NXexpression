--********************************************************************************
-- 行政文书模块视图脚本（人大金仓，31 个视图，无 WEBDOCUMENT）
-- 对应表脚本：proj_xzws_all_kingbase.sql
--********************************************************************************

-- 1. 建设用地类
CREATE OR REPLACE VIEW v_proj_xzws_jsyd AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.hjr             AS "移交人",
    rec.jsr             AS "接收人",
    rec.cdbh            AS "存档编号",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_jsyd rec;
GRANT SELECT ON v_proj_xzws_jsyd TO public;

-- 2. 采矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_ckqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.yxmmc           AS "原项目名称",
    rec.ckqr            AS "采矿权人",
    rec.kcdw            AS "勘查单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_ckqda rec;
GRANT SELECT ON v_proj_xzws_ckqda TO public;

-- 3. 土地利用规划
CREATE OR REPLACE VIEW v_proj_xzws_tdlygh AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_tdlygh rec;
GRANT SELECT ON v_proj_xzws_tdlygh TO public;

-- 4. 普查档案
CREATE OR REPLACE VIEW v_proj_xzws_pcda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.pcrq            AS "普查日期",
    rec.pcdd            AS "普查地点",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_pcda rec;
GRANT SELECT ON v_proj_xzws_pcda TO public;

-- 5. 评估档案
CREATE OR REPLACE VIEW v_proj_xzws_pgda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_pgda rec;
GRANT SELECT ON v_proj_xzws_pgda TO public;

-- 6. 保留探矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_bltkqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.kcxkzh          AS "勘查许可证号",
    rec.sqr             AS "申请人",
    rec.tkqr            AS "探矿权人",
    rec.kcdw            AS "勘查单位",
    rec.yxmmc           AS "原项目名称",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_bltkqda rec;
GRANT SELECT ON v_proj_xzws_bltkqda TO public;

-- 7. 新立探矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_xltkqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.kcxkzh          AS "勘查许可证号",
    rec.sqr             AS "申请人",
    rec.xmmc            AS "项目名称",
    rec.kcdw            AS "勘查单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xltkqda rec;
GRANT SELECT ON v_proj_xzws_xltkqda TO public;

-- 8. 延续探矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_yxtkqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.tkqr            AS "探矿权人",
    rec.sqr             AS "申请人",
    rec.yxmmc           AS "原项目名称",
    rec.kcdw            AS "勘查单位",
    rec.kcxkzh          AS "勘查许可证号",
    rec.ykcxkzh         AS "原勘查许可证号",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_yxtkqda rec;
GRANT SELECT ON v_proj_xzws_yxtkqda TO public;

-- 9. 转让探矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_zrtkqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.ykcxkzh         AS "原勘查许可证号",
    rec.kcdw            AS "勘查单位",
    rec.zrsqr           AS "转让申请人",
    rec.srr             AS "受让人",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_zrtkqda rec;
GRANT SELECT ON v_proj_xzws_zrtkqda TO public;

-- 10. 变更探矿权档案
CREATE OR REPLACE VIEW v_proj_xzws_bgtkqda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.tkqr            AS "探矿权人",
    rec.dlwz            AS "地理位置",
    rec.kcxkz           AS "勘查许可证",
    rec.ykcxkz          AS "原勘查许可证",
    rec.sqr             AS "申请人",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_bgtkqda rec;
GRANT SELECT ON v_proj_xzws_bgtkqda TO public;

-- 11. 登记台账号及不予办理探矿权
CREATE OR REPLACE VIEW v_proj_xzws_djtzh AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.xkzh            AS "许可证号",
    rec.dlwz            AS "地理位置",
    rec.kyqr            AS "矿业权人",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_djtzh rec;
GRANT SELECT ON v_proj_xzws_djtzh TO public;

-- 12. 探矿权年监
CREATE OR REPLACE VIEW v_proj_xzws_tkqnf AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.xkzh            AS "许可证号",
    rec.dlwz            AS "地理位置",
    rec.tkqr            AS "探矿权人",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.dzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_tkqnf rec;
GRANT SELECT ON v_proj_xzws_tkqnf TO public;

-- 13. 注销探矿权
CREATE OR REPLACE VIEW v_proj_xzws_zxtkq AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.xkzh            AS "许可证号",
    rec.dlwz            AS "地理位置",
    rec.kyqr            AS "矿业权人",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_zxtkq rec;
GRANT SELECT ON v_proj_xzws_zxtkq TO public;

-- 14. 资质档案
CREATE OR REPLACE VIEW v_proj_xzws_zzda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fzjg            AS "发证机关",
    rec.fzsj            AS "发证时间",
    rec.zzzh            AS "资质证号",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_zzda rec;
GRANT SELECT ON v_proj_xzws_zzda TO public;

-- 15. 地质灾害资质
CREATE OR REPLACE VIEW v_proj_xzws_dzzzhzz AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_dzzzhzz rec;
GRANT SELECT ON v_proj_xzws_dzzzhzz TO public;

-- 16. 新文书档案
CREATE OR REPLACE VIEW v_proj_xzws_xwsda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xwsda rec;
GRANT SELECT ON v_proj_xzws_xwsda TO public;

-- 17. 发文汇集
CREATE OR REPLACE VIEW v_proj_xzws_fwhj AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.wjtm            AS "文件题名",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.wjtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_fwhj rec;
GRANT SELECT ON v_proj_xzws_fwhj TO public;

-- 18. 资料档案
CREATE OR REPLACE VIEW v_proj_xzws_zlda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_zlda rec;
GRANT SELECT ON v_proj_xzws_zlda TO public;

-- 19. 旧卷文书档案
CREATE OR REPLACE VIEW v_proj_xzws_jjwsda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.zjtm            AS "宗卷题名",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zjtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_jjwsda rec;
GRANT SELECT ON v_proj_xzws_jjwsda TO public;

-- 20. 住房档案
CREATE OR REPLACE VIEW v_proj_xzws_zfda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.zjtm            AS "宗卷题名",
    rec.bzdw            AS "编制单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zjtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_zfda rec;
GRANT SELECT ON v_proj_xzws_zfda TO public;

-- 21. 区土地开发服务总公司
CREATE OR REPLACE VIEW v_proj_xzws_qtdkffw AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.zjtm            AS "宗卷题名",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zjtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_qtdkffw rec;
GRANT SELECT ON v_proj_xzws_qtdkffw TO public;

-- 22. 区土地局机关生产基地
CREATE OR REPLACE VIEW v_proj_xzws_qtdjjsc AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.zjtm            AS "宗卷题名",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zjtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_qtdjjsc rec;
GRANT SELECT ON v_proj_xzws_qtdjjsc TO public;

-- 23. 西夏土地开发整理中心-报表
CREATE OR REPLACE VIEW v_proj_xzws_xxtdkfbb AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.ajtm            AS "案卷题名",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.ajtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xxtdkfbb rec;
GRANT SELECT ON v_proj_xzws_xxtdkfbb TO public;

-- 24. 西夏土地开发整理中心-账簿
CREATE OR REPLACE VIEW v_proj_xzws_xxtdkfzb AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.ajtm            AS "案卷题名",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.ajtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xxtdkfzb rec;
GRANT SELECT ON v_proj_xzws_xxtdkfzb TO public;

-- 25. 西夏土地开发整理中心-凭证
CREATE OR REPLACE VIEW v_proj_xzws_xxtdkfpz AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.qsrq            AS "起始日期",
    rec.jzrq            AS "截止日期",
    rec.pzqh            AS "凭证起号",
    rec.pzzh            AS "凭证止号",
    rec.ajtm            AS "案卷题名",
    rec.jg              AS "机构",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.ajtm, ''), NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xxtdkfpz rec;
GRANT SELECT ON v_proj_xzws_xxtdkfpz TO public;

-- 26. 先进性教育活动资料
CREATE OR REPLACE VIEW v_proj_xzws_xjxjy AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_xjxjy rec;
GRANT SELECT ON v_proj_xzws_xjxjy TO public;

-- 27. 科技档案
CREATE OR REPLACE VIEW v_proj_xzws_kjda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_kjda rec;
GRANT SELECT ON v_proj_xzws_kjda TO public;

-- 28. 实物档案
CREATE OR REPLACE VIEW v_proj_xzws_swda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.sjdw            AS "授奖单位",
    rec.jsdw            AS "受奖单位",
    rec.jpnr            AS "奖品内容",
    rec.sjrq            AS "授奖日期",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_swda rec;
GRANT SELECT ON v_proj_xzws_swda TO public;

-- 29. 声像档案
CREATE OR REPLACE VIEW v_proj_xzws_sxda AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.sxz             AS "摄像者",
    rec.sxdd            AS "摄像地点",
    rec.zph             AS "照片/底片号",
    rec.szsj            AS "摄制时间",
    rec.rw              AS "人物",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(NULLIF(rec.zlmc, ''), rec.jsbh) AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_sxda rec;
GRANT SELECT ON v_proj_xzws_sxda TO public;

-- 30. 收文档案
CREATE OR REPLACE VIEW v_proj_xzws_shouwen AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.wjbt            AS "文件标题",
    rec.lwjg            AS "来文机关",
    rec.ywzh            AS "原文字号",
    rec.cs              AS "来文处室",
    rec.qs              AS "签收人",
    rec.wh              AS "收文字号",
    rec.ywrq            AS "原文日期",
    rec.swrq            AS "收文日期",
    rec.fs              AS "文件份数",
    rec.gjh             AS "归卷号",
    rec.jmdj            AS "机密等级",
    rec.bcqx            AS "保存期限",
    rec.gjz             AS "关键字",
    rec.bz              AS "备注",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(rec.lwjg, '') || CASE
        WHEN rec.wjbt IS NOT NULL AND rec.wjbt <> '' THEN '_' || rec.wjbt
        ELSE ''
    END                 AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_shouwen rec;
GRANT SELECT ON v_proj_xzws_shouwen TO public;

-- 31. 发文档案
CREATE OR REPLACE VIEW v_proj_xzws_fawen AS
SELECT
    rec.rid             AS code,
    rec.jsbh            AS "接收编号",
    rec.zlmc            AS "资料名称",
    rec.hjrq            AS "移交日期",
    rec.hjdw            AS "汇交单位",
    rec.fwzh            AS "发文字号",
    rec.jjcd            AS "紧急程度",
    rec.mmdj            AS "秘密等级",
    rec.ngbm            AS "拟稿部门",
    rec.ngr             AS "拟稿人",
    rec.fwrq            AS "发文日期",
    rec.hgbm            AS "核稿部门",
    rec.hgr             AS "核稿人",
    rec.hgrq            AS "核稿日期",
    rec.qfr             AS "签发人",
    rec.qfrq            AS "签发日期",
    rec.syfs            AS "缮印份数",
    rec.fwbt            AS "发文标题",
    rec.sy              AS "事由",
    rec.zs              AS "主送",
    rec.cs              AS "抄送",
    rec.createuser      AS "登记人",
    TO_CHAR(rec.createtime, 'YYYY-MM-DD') AS "登记时间",
    CASE
        WHEN rec.zzdawz IS NULL OR rec.zzdawz = '' THEN rec.dzdawz
        WHEN rec.dzdawz IS NULL OR rec.dzdawz = '' THEN rec.zzdawz
        ELSE rec.zzdawz || ';' || rec.dzdawz
    END                 AS "档案存放位置",
    COALESCE(rec.fwzh, '') || CASE
        WHEN rec.fwbt IS NOT NULL AND rec.fwbt <> '' THEN '_' || rec.fwbt
        ELSE ''
    END                 AS nodename,
    rec.rid             AS "RID"
FROM proj_xzws_fawen rec;
GRANT SELECT ON v_proj_xzws_fawen TO public;
