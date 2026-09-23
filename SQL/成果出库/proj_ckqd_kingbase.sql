--********************************************************************************
-- 成果出库清单子表（11 类），供出库记录视图 v_ckjl_* 统计查询
-- 关联主表 proj_cgsqckdj.rid
--********************************************************************************

-- 基本地形图出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_dxt (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    blc               VARCHAR(20),
    lx                VARCHAR(20),
    tfh               VARCHAR(50),
    nf                VARCHAR(50),
    zbxt              VARCHAR(200),
    ztxs              VARCHAR(100),
    yscode            VARCHAR(50),
    fs                VARCHAR(10),
    bmh               VARCHAR(1000),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_dxt PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_dxt_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_dxt_parent ON proj_ckqd_dxt (parent_rid);

-- 航摄影像出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_hp (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    sjlx              VARCHAR(50),
    jd                VARCHAR(30),
    pssj              VARCHAR(20),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    bmh               VARCHAR(1000),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_hp PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_hp_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_hp_parent ON proj_ckqd_hp (parent_rid);

-- 卫星影像出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_wp (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    sjlx              VARCHAR(50),
    jd                VARCHAR(30),
    pssj              VARCHAR(20),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    bmh               VARCHAR(1000),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_wp PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_wp_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_wp_parent ON proj_ckqd_wp (parent_rid);

-- GPS 控制点出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_gpsd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    dh                VARCHAR(50),
    dm                VARCHAR(50),
    dj                VARCHAR(30),
    sztfh             VARCHAR(50),
    zbxt              VARCHAR(200),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_gpsd PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_gpsd_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_gpsd_parent ON proj_ckqd_gpsd (parent_rid);

-- 三角控制点出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_sjd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    dh                VARCHAR(50),
    dm                VARCHAR(50),
    dj                VARCHAR(30),
    sztfh             VARCHAR(50),
    zbxt              VARCHAR(200),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_sjd PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_sjd_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_sjd_parent ON proj_ckqd_sjd (parent_rid);

-- 水准控制点出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_szd (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    dh                VARCHAR(50),
    dm                VARCHAR(50),
    dj                VARCHAR(30),
    lxmc              VARCHAR(50),
    gcjz              VARCHAR(100),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_szd PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_szd_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_szd_parent ON proj_ckqd_szd (parent_rid);

-- 专题数据出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_zt (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    cdbh              VARCHAR(50),
    hjdw              VARCHAR(60),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_zt PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_zt_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_zt_parent ON proj_ckqd_zt (parent_rid);

-- 土地资料出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_td (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    cdbh              VARCHAR(50),
    hjdw              VARCHAR(60),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_td PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_td_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_td_parent ON proj_ckqd_td (parent_rid);

-- 科技档案出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_kj (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    cdbh              VARCHAR(50),
    hjdw              VARCHAR(60),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_kj PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_kj_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_kj_parent ON proj_ckqd_kj (parent_rid);

-- 测绘项目档案出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_chxm (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    xmmc              VARCHAR(100),
    zlmc              VARCHAR(100),
    sjlx              VARCHAR(50),
    cdbh              VARCHAR(50),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_chxm PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_chxm_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_chxm_parent ON proj_ckqd_chxm (parent_rid);

-- 其它资料出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_qt (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(100),
    dalx              VARCHAR(50),
    cdbh              VARCHAR(50),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_qt PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_qt_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_qt_parent ON proj_ckqd_qt (parent_rid);

-- 规划成果出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_ghcg (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    ghlx              VARCHAR(60),
    cdbh              VARCHAR(50),
    blc               VARCHAR(20),
    zbxt              VARCHAR(200),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_ghcg PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_ghcg_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_ghcg_parent ON proj_ckqd_ghcg (parent_rid);

-- 实景三维出库清单
CREATE TABLE IF NOT EXISTS proj_ckqd_sjsw (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    parent_rid        CHAR(36)      NOT NULL,
    xh                VARCHAR(10),
    zlmc              VARCHAR(200),
    sjlx              VARCHAR(60),
    fbl               VARCHAR(30),
    scnf              VARCHAR(20),
    zbxt              VARCHAR(200),
    ztxs              VARCHAR(50),
    sl                VARCHAR(30),
    yscode            VARCHAR(50),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_ckqd_sjsw PRIMARY KEY (rid)
);
CREATE SEQUENCE IF NOT EXISTS proj_ckqd_sjsw_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;
CREATE INDEX IF NOT EXISTS idx_proj_ckqd_sjsw_parent ON proj_ckqd_sjsw (parent_rid);

COMMENT ON TABLE proj_ckqd_dxt IS '基本地形图出库清单';
COMMENT ON TABLE proj_ckqd_hp IS '航摄影像出库清单';
COMMENT ON TABLE proj_ckqd_wp IS '卫星影像出库清单';
COMMENT ON TABLE proj_ckqd_gpsd IS 'GPS控制点出库清单';
COMMENT ON TABLE proj_ckqd_sjd IS '三角控制点出库清单';
COMMENT ON TABLE proj_ckqd_szd IS '水准控制点出库清单';
COMMENT ON TABLE proj_ckqd_zt IS '专题数据出库清单';
COMMENT ON TABLE proj_ckqd_td IS '土地资料出库清单';
COMMENT ON TABLE proj_ckqd_kj IS '科技档案出库清单';
COMMENT ON TABLE proj_ckqd_chxm IS '测绘项目档案出库清单';
COMMENT ON TABLE proj_ckqd_qt IS '其它资料出库清单';
COMMENT ON TABLE proj_ckqd_ghcg IS '规划成果出库清单';
COMMENT ON TABLE proj_ckqd_sjsw IS '实景三维出库清单';
