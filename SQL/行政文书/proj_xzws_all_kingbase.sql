--********************************************************************************
-- 行政文书模块建表脚本（人大金仓，31 张表，无 WEBDOCUMENT）
--********************************************************************************

-- 公共字段宏（复制展开）：code, rid, jid, sys_parentrid,
-- jsbh, zlmc, hjdw, hjrq, hjr, jsr, cdbh, zzdawz, dzdawz, dzsj,
-- createtime, createuser, lastmodifytime, lastmodifyuser

CREATE TABLE IF NOT EXISTS proj_xzws_jsyd (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_jsyd PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_jsyd_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_jsyd_jsbh ON proj_xzws_jsyd (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_ckqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    yxmmc VARCHAR(100), ckqr VARCHAR(100), kcdw VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_ckqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_ckqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_ckqda_jsbh ON proj_xzws_ckqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_tdlygh (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_tdlygh PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_tdlygh_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_tdlygh_jsbh ON proj_xzws_tdlygh (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_pcda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), pcrq VARCHAR(30), pcdd VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_pcda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_pcda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_pcda_jsbh ON proj_xzws_pcda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_pgda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_pgda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_pgda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_pgda_jsbh ON proj_xzws_pgda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_bltkqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), kcxkzh VARCHAR(100), sqr VARCHAR(100),
    tkqr VARCHAR(100), kcdw VARCHAR(100), yxmmc VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_bltkqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_bltkqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_bltkqda_jsbh ON proj_xzws_bltkqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xltkqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), kcxkzh VARCHAR(100), sqr VARCHAR(100),
    xmmc VARCHAR(100), kcdw VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xltkqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xltkqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xltkqda_jsbh ON proj_xzws_xltkqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_yxtkqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), tkqr VARCHAR(100), sqr VARCHAR(100),
    yxmmc VARCHAR(100), kcdw VARCHAR(100), kcxkzh VARCHAR(100), ykcxkzh VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_yxtkqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_yxtkqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_yxtkqda_jsbh ON proj_xzws_yxtkqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_zrtkqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), ykcxkzh VARCHAR(100), kcdw VARCHAR(100),
    zrsqr VARCHAR(100), srr VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_zrtkqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_zrtkqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_zrtkqda_jsbh ON proj_xzws_zrtkqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_bgtkqda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), tkqr VARCHAR(100), dlwz VARCHAR(200),
    kcxkz VARCHAR(100), ykcxkz VARCHAR(100), sqr VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_bgtkqda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_bgtkqda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_bgtkqda_jsbh ON proj_xzws_bgtkqda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_djtzh (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), xkzh VARCHAR(100), dlwz VARCHAR(200), kyqr VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_djtzh PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_djtzh_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_djtzh_jsbh ON proj_xzws_djtzh (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_tkqnf (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), xkzh VARCHAR(100), dlwz VARCHAR(200), tkqr VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_tkqnf PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_tkqnf_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_tkqnf_jsbh ON proj_xzws_tkqnf (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_zxtkq (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), xkzh VARCHAR(100), dlwz VARCHAR(200), kyqr VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_zxtkq PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_zxtkq_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_zxtkq_jsbh ON proj_xzws_zxtkq (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_zzda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fzjg VARCHAR(100), fzsj VARCHAR(30), zzzh VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_zzda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_zzda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_zzda_jsbh ON proj_xzws_zzda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_dzzzhzz (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_dzzzhzz PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_dzzzhzz_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_dzzzhzz_jsbh ON proj_xzws_dzzzhzz (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xwsda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xwsda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xwsda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xwsda_jsbh ON proj_xzws_xwsda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_fwhj (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    wjtm VARCHAR(200), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_fwhj PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_fwhj_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_fwhj_jsbh ON proj_xzws_fwhj (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_zlda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_zlda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_zlda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_zlda_jsbh ON proj_xzws_zlda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_jjwsda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30), zjtm VARCHAR(200),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_jjwsda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_jjwsda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_jjwsda_jsbh ON proj_xzws_jjwsda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_zfda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    zjtm VARCHAR(200), bzdw VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_zfda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_zfda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_zfda_jsbh ON proj_xzws_zfda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_qtdkffw (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    zjtm VARCHAR(200), qsrq VARCHAR(30), jzrq VARCHAR(30), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_qtdkffw PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_qtdkffw_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_qtdkffw_jsbh ON proj_xzws_qtdkffw (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_qtdjjsc (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    zjtm VARCHAR(200), qsrq VARCHAR(30), jzrq VARCHAR(30), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_qtdjjsc PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_qtdjjsc_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_qtdjjsc_jsbh ON proj_xzws_qtdjjsc (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xxtdkfbb (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30), ajtm VARCHAR(200), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xxtdkfbb PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xxtdkfbb_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xxtdkfbb_jsbh ON proj_xzws_xxtdkfbb (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xxtdkfzb (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30), ajtm VARCHAR(200), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xxtdkfzb PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xxtdkfzb_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xxtdkfzb_jsbh ON proj_xzws_xxtdkfzb (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xxtdkfpz (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    qsrq VARCHAR(30), jzrq VARCHAR(30), pzqh VARCHAR(100), pzzh VARCHAR(100),
    ajtm VARCHAR(200), jg VARCHAR(100),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xxtdkfpz PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xxtdkfpz_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xxtdkfpz_jsbh ON proj_xzws_xxtdkfpz (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_xjxjy (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_xjxjy PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_xjxjy_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_xjxjy_jsbh ON proj_xzws_xjxjy (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_kjda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_kjda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_kjda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_kjda_jsbh ON proj_xzws_kjda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_swda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    sjdw VARCHAR(100), jsdw VARCHAR(100), jpnr VARCHAR(500), sjrq VARCHAR(30),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_swda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_swda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_swda_jsbh ON proj_xzws_swda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_sxda (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    sxz VARCHAR(100), sxdd VARCHAR(200), zph VARCHAR(100), szsj VARCHAR(30), rw VARCHAR(200),
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_sxda PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_sxda_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_sxda_jsbh ON proj_xzws_sxda (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_shouwen (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    wjbt VARCHAR(200), lwjg VARCHAR(100), ywzh VARCHAR(100), cs VARCHAR(100),
    qs VARCHAR(100), wh VARCHAR(100), ywrq VARCHAR(30), swrq VARCHAR(30),
    fs VARCHAR(50), gjh VARCHAR(100), jmdj VARCHAR(50), bcqx VARCHAR(100),
    gjz TEXT, bz TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_shouwen PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_shouwen_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_shouwen_jsbh ON proj_xzws_shouwen (jsbh);

CREATE TABLE IF NOT EXISTS proj_xzws_fawen (
    code BIGINT NOT NULL, rid CHAR(36) NOT NULL, jid CHAR(36), sys_parentrid VARCHAR(200),
    jsbh VARCHAR(30), zlmc VARCHAR(100), hjdw VARCHAR(100), hjrq VARCHAR(30),
    hjr VARCHAR(100), jsr VARCHAR(100), cdbh VARCHAR(100),
    zzdawz VARCHAR(200), dzdawz VARCHAR(200), dzsj TEXT,
    fwzh VARCHAR(100), jjcd VARCHAR(50), mmdj VARCHAR(50), ngbm VARCHAR(100),
    ngr VARCHAR(100), fwrq VARCHAR(30), hgbm VARCHAR(100), hgr VARCHAR(100),
    hgrq VARCHAR(30), qfr VARCHAR(100), qfrq VARCHAR(30), syfs VARCHAR(50),
    fwbt VARCHAR(200), sy TEXT, zs TEXT, cs TEXT,
    createtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, createuser VARCHAR(50),
    lastmodifytime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, lastmodifyuser VARCHAR(50),
    CONSTRAINT pk_proj_xzws_fawen PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_xzws_fawen_code_seq INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_xzws_fawen_jsbh ON proj_xzws_fawen (jsbh);
