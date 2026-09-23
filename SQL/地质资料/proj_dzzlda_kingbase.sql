--********************************************************************************
-- 表：地质资料档案 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_dzzlda (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    dh                VARCHAR(100),
    dzdh              VARCHAR(100),
    tm                VARCHAR(100),
    bzz               VARCHAR(100),
    xcdw              VARCHAR(100),
    xcsj              VARCHAR(30),
    pzjg              VARCHAR(100),
    pzsj              VARCHAR(30),
    zllbdm            VARCHAR(100),
    zllbmc            VARCHAR(100),
    gzcddm            VARCHAR(100),
    gzcdmc            VARCHAR(100),
    kssj              VARCHAR(30),
    zzsj              VARCHAR(30),
    l1                VARCHAR(100),
    ld1               VARCHAR(100),
    lm1               VARCHAR(100),
    ls1               VARCHAR(100),
    l2                VARCHAR(100),
    ld2               VARCHAR(100),
    lm2               VARCHAR(100),
    ls2               VARCHAR(100),
    b1                VARCHAR(100),
    bd1               VARCHAR(100),
    bm1               VARCHAR(100),
    bs1               VARCHAR(100),
    b2                VARCHAR(100),
    bd2               VARCHAR(100),
    bm2               VARCHAR(100),
    bs2               VARCHAR(100),
    xzqdm1            VARCHAR(100),
    xzqmc1            VARCHAR(100),
    xzqdm2            VARCHAR(100),
    xzqmc2            VARCHAR(100),
    xzqdm3            VARCHAR(100),
    xzqmc3            VARCHAR(100),
    kcdm1             VARCHAR(100),
    kcmc1             VARCHAR(100),
    kcdm2             VARCHAR(100),
    kcmc2             VARCHAR(100),
    kcdm3             VARCHAR(100),
    kcmc3             VARCHAR(100),
    kcdm4             VARCHAR(100),
    kcmc4             VARCHAR(100),
    kcdm5             VARCHAR(100),
    kcmc5             VARCHAR(100),
    kcdm6             VARCHAR(100),
    kcmc6             VARCHAR(100),
    kcdm7             VARCHAR(100),
    kcmc7             VARCHAR(100),
    kcdm8             VARCHAR(100),
    kcmc8             VARCHAR(100),
    kcdm9             VARCHAR(100),
    kcmc9             VARCHAR(100),
    kcdm10            VARCHAR(100),
    kcmc10            VARCHAR(100),
    kcdm11            VARCHAR(100),
    kcmc11            VARCHAR(100),
    kcdm12            VARCHAR(100),
    kcmc12            VARCHAR(100),
    kcdm13            VARCHAR(100),
    kcmc13            VARCHAR(100),
    kcdm14            VARCHAR(100),
    kcmc14            VARCHAR(100),
    kcdm15            VARCHAR(100),
    kcmc15            VARCHAR(100),
    lx                VARCHAR(100),
    yz                VARCHAR(100),
    hjsj              VARCHAR(30),
    mjdm              VARCHAR(100),
    mjmc              VARCHAR(100),
    bhq               VARCHAR(30),
    bgqx              VARCHAR(100),
    ztc               VARCHAR(100),
    nrzy              VARCHAR(4000),
    ybzlbcdwjdd       VARCHAR(100),
    swzlbcdwjdd       VARCHAR(100),
    zldagbm           VARCHAR(100),
    zldagmc           VARCHAR(100),
    sdh               VARCHAR(100),
    hjlb              VARCHAR(100),
    hjldh             VARCHAR(100),
    qggdh             VARCHAR(100),
    hjdwdm            VARCHAR(100),
    hjdwmc            VARCHAR(100),
    fzx               VARCHAR(100),
    listdata          TEXT,
    rangedata         VARCHAR(1000),
    minx              VARCHAR(50),
    maxx              VARCHAR(50),
    miny              VARCHAR(50),
    maxy              VARCHAR(50),
    zzdawz            VARCHAR(200),
    dzdawz            VARCHAR(200),
    dzsj              TEXT,
    projectdocunid    VARCHAR(100),
    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_dzzlda PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_dzzlda_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_dzzlda_parentdocunid ON proj_dzzlda (parentdocunid);
CREATE INDEX IF NOT EXISTS idx_proj_dzzlda_dh ON proj_dzzlda (dh);
CREATE INDEX IF NOT EXISTS idx_proj_dzzlda_tm ON proj_dzzlda (tm);
CREATE INDEX IF NOT EXISTS idx_proj_dzzlda_jid ON proj_dzzlda (jid);
CREATE INDEX IF NOT EXISTS idx_proj_dzzlda_sys_parentrid ON proj_dzzlda (sys_parentrid);

COMMENT ON TABLE proj_dzzlda IS '地质资料档案';
COMMENT ON COLUMN proj_dzzlda.code IS '序号';
COMMENT ON COLUMN proj_dzzlda.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_dzzlda.jid IS '工作流实例ID';
COMMENT ON COLUMN proj_dzzlda.sys_parentrid IS '父记录标识';
COMMENT ON COLUMN proj_dzzlda.parentdocunid IS '所属文档对象的ID';
COMMENT ON COLUMN proj_dzzlda.dh IS '档号';
COMMENT ON COLUMN proj_dzzlda.dzdh IS '电子档号';
COMMENT ON COLUMN proj_dzzlda.tm IS '题名';
COMMENT ON COLUMN proj_dzzlda.bzz IS '编著者';
COMMENT ON COLUMN proj_dzzlda.xcdw IS '形成单位';
COMMENT ON COLUMN proj_dzzlda.xcsj IS '形成时间';
COMMENT ON COLUMN proj_dzzlda.pzjg IS '批准机构';
COMMENT ON COLUMN proj_dzzlda.pzsj IS '批准时间';
COMMENT ON COLUMN proj_dzzlda.zllbdm IS '资料类别代码';
COMMENT ON COLUMN proj_dzzlda.zllbmc IS '资料类别名称';
COMMENT ON COLUMN proj_dzzlda.gzcddm IS '工作程度代码';
COMMENT ON COLUMN proj_dzzlda.gzcdmc IS '工作程度名称';
COMMENT ON COLUMN proj_dzzlda.kssj IS '开始时间';
COMMENT ON COLUMN proj_dzzlda.zzsj IS '终止时间';
COMMENT ON COLUMN proj_dzzlda.l1 IS '经度方向1';
COMMENT ON COLUMN proj_dzzlda.ld1 IS '起始经度度';
COMMENT ON COLUMN proj_dzzlda.lm1 IS '起始经度分';
COMMENT ON COLUMN proj_dzzlda.ls1 IS '起始经度秒';
COMMENT ON COLUMN proj_dzzlda.l2 IS '经度方向2';
COMMENT ON COLUMN proj_dzzlda.ld2 IS '终止经度度';
COMMENT ON COLUMN proj_dzzlda.lm2 IS '终止经度分';
COMMENT ON COLUMN proj_dzzlda.ls2 IS '终止经度秒';
COMMENT ON COLUMN proj_dzzlda.b1 IS '纬度方向1';
COMMENT ON COLUMN proj_dzzlda.bd1 IS '起始纬度度';
COMMENT ON COLUMN proj_dzzlda.bm1 IS '起始纬度分';
COMMENT ON COLUMN proj_dzzlda.bs1 IS '起始纬度秒';
COMMENT ON COLUMN proj_dzzlda.b2 IS '纬度方向2';
COMMENT ON COLUMN proj_dzzlda.bd2 IS '终止纬度度';
COMMENT ON COLUMN proj_dzzlda.bm2 IS '终止纬度分';
COMMENT ON COLUMN proj_dzzlda.bs2 IS '终止纬度秒';
COMMENT ON COLUMN proj_dzzlda.xzqdm1 IS '行政区代码1';
COMMENT ON COLUMN proj_dzzlda.xzqmc1 IS '行政区名称1';
COMMENT ON COLUMN proj_dzzlda.xzqdm2 IS '行政区代码2';
COMMENT ON COLUMN proj_dzzlda.xzqmc2 IS '行政区名称2';
COMMENT ON COLUMN proj_dzzlda.xzqdm3 IS '行政区代码3';
COMMENT ON COLUMN proj_dzzlda.xzqmc3 IS '行政区名称3';
COMMENT ON COLUMN proj_dzzlda.lx IS '类型';
COMMENT ON COLUMN proj_dzzlda.yz IS '语种';
COMMENT ON COLUMN proj_dzzlda.hjsj IS '汇交时间';
COMMENT ON COLUMN proj_dzzlda.mjdm IS '密级代码';
COMMENT ON COLUMN proj_dzzlda.mjmc IS '密级名称';
COMMENT ON COLUMN proj_dzzlda.bhq IS '保护期';
COMMENT ON COLUMN proj_dzzlda.bgqx IS '保管期限';
COMMENT ON COLUMN proj_dzzlda.ztc IS '主题词';
COMMENT ON COLUMN proj_dzzlda.nrzy IS '内容摘要';
COMMENT ON COLUMN proj_dzzlda.ybzlbcdwjdd IS '原本资料保存单位及地点';
COMMENT ON COLUMN proj_dzzlda.swzlbcdwjdd IS '实物资料保存单位及地点';
COMMENT ON COLUMN proj_dzzlda.zldagbm IS '资料档案馆编码';
COMMENT ON COLUMN proj_dzzlda.zldagmc IS '资料档案馆名称';
COMMENT ON COLUMN proj_dzzlda.sdh IS '省档号';
COMMENT ON COLUMN proj_dzzlda.hjlb IS '汇交类别';
COMMENT ON COLUMN proj_dzzlda.hjldh IS '汇交联单号';
COMMENT ON COLUMN proj_dzzlda.qggdh IS '全国馆档号';
COMMENT ON COLUMN proj_dzzlda.hjdwdm IS '汇交单位代码';
COMMENT ON COLUMN proj_dzzlda.hjdwmc IS '汇交单位名称';
COMMENT ON COLUMN proj_dzzlda.fzx IS '附注项';
COMMENT ON COLUMN proj_dzzlda.listdata IS '载体类型清单(JSON)';
COMMENT ON COLUMN proj_dzzlda.rangedata IS '坐标范围数据';
COMMENT ON COLUMN proj_dzzlda.minx IS '范围最小X';
COMMENT ON COLUMN proj_dzzlda.maxx IS '范围最大X';
COMMENT ON COLUMN proj_dzzlda.miny IS '范围最小Y';
COMMENT ON COLUMN proj_dzzlda.maxy IS '范围最大Y';
COMMENT ON COLUMN proj_dzzlda.zzdawz IS '纸质档案位置';
COMMENT ON COLUMN proj_dzzlda.dzdawz IS '电子档案位置';
COMMENT ON COLUMN proj_dzzlda.dzsj IS '电子资料数据';
COMMENT ON COLUMN proj_dzzlda.projectdocunid IS '汇交项目的ID';
COMMENT ON COLUMN proj_dzzlda.createtime IS '记录创建时间';
COMMENT ON COLUMN proj_dzzlda.createuser IS '记录创建用户';
COMMENT ON COLUMN proj_dzzlda.lastmodifytime IS '最近修改时间';
COMMENT ON COLUMN proj_dzzlda.lastmodifyuser IS '最近修改用户';
