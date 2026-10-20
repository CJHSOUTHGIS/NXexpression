--********************************************************************************
-- 表：成果申请出库登记表 (人大金仓)
--********************************************************************************
CREATE TABLE IF NOT EXISTS proj_cgsqckdj (
    code              BIGINT        NOT NULL,
    rid               CHAR(36)      NOT NULL,
    jid               CHAR(36),
    sys_parentrid     VARCHAR(200),
    parentdocunid     CHAR(32),
    projectdocunid    VARCHAR(100),

    sqqx              SMALLINT      DEFAULT 1,
    ffbh              VARCHAR(100),
    sqdwmc            VARCHAR(100),
    sqdwdm            VARCHAR(100),
    gksx              VARCHAR(100),
    gkdw              VARCHAR(100),
    sqdwlxdz          VARCHAR(100),
    sqdwyzbm          VARCHAR(30),
    sqdwlxr           VARCHAR(100),
    sfzhm             VARCHAR(100),
    sqdwlxdh          VARCHAR(100),
    sqdwmc2           VARCHAR(100),
    sqdwlxr2          VARCHAR(100),
    ksfzr             VARCHAR(100),
    gksx2             VARCHAR(100),
    gkdw2             VARCHAR(100),

    symd              VARCHAR(100),
    sqyt              VARCHAR(100),
    xmly              VARCHAR(100),
    syfs              VARCHAR(20),
    cgzlmc            VARCHAR(100),

    sqcglx            VARCHAR(100),
    cgqd1             TEXT,
    cgqd2             TEXT,
    cgqd3             TEXT,
    cgqd4             TEXT,
    cgqd5             TEXT,
    cgqd6             TEXT,
    cgqd7             TEXT,
    cgqd8             TEXT,
    cgqd9             TEXT,
    cgqd10            TEXT,
    cgqd11            TEXT,
    cgqd12            TEXT,
    cgqd13            TEXT,
    docunids10        TEXT,
    docunids11        TEXT,
    sjl1              VARCHAR(30),
    sjl2_1            VARCHAR(30),
    sjl2_2            VARCHAR(30),
    sjl2_3            VARCHAR(30),
    sjl7              VARCHAR(30),
    gpsl              VARCHAR(30),

    ztxs              VARCHAR(100),
    ccjz              VARCHAR(100),
    sfjm              VARCHAR(20),
    jmlx              VARCHAR(100),
    tgxs              VARCHAR(100),
    gplx              VARCHAR(100),
    ckbzsm            VARCHAR(1000),
    ckr               VARCHAR(30),
    ckrq              VARCHAR(30),
    zrl               VARCHAR(100),
    ycl               SMALLINT      DEFAULT 0,

    data_source       VARCHAR(64),
    data_source_name  VARCHAR(200),
    external_id       VARCHAR(64),
    external_sync_time VARCHAR(30),

    createtime        TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    createuser        VARCHAR(50),
    lastmodifytime    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    lastmodifyuser    VARCHAR(50),
    CONSTRAINT pk_proj_cgsqckdj PRIMARY KEY (rid)
);

CREATE SEQUENCE IF NOT EXISTS proj_cgsqckdj_code_seq
    INCREMENT BY 1 START WITH 1 MAXVALUE 9999999999 MINVALUE 1 NO CYCLE CACHE 5;

CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_ffbh ON proj_cgsqckdj (ffbh);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_sqdwmc ON proj_cgsqckdj (sqdwmc);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_ckrq ON proj_cgsqckdj (ckrq);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_ycl ON proj_cgsqckdj (ycl);
CREATE INDEX IF NOT EXISTS idx_proj_cgsqckdj_parentdocunid ON proj_cgsqckdj (parentdocunid);

COMMENT ON TABLE proj_cgsqckdj IS '成果申请出库登记表';
COMMENT ON COLUMN proj_cgsqckdj.code IS '主键序号';
COMMENT ON COLUMN proj_cgsqckdj.rid IS '记录唯一标识';
COMMENT ON COLUMN proj_cgsqckdj.sqqx IS '资料涉密情况: 1涉密 0不涉密';
COMMENT ON COLUMN proj_cgsqckdj.ffbh IS '分发编号';
COMMENT ON COLUMN proj_cgsqckdj.sqdwmc IS '申请单位名称';
COMMENT ON COLUMN proj_cgsqckdj.sqdwdm IS '单位代码';
COMMENT ON COLUMN proj_cgsqckdj.gksx IS '归口属性';
COMMENT ON COLUMN proj_cgsqckdj.gkdw IS '归口单位';
COMMENT ON COLUMN proj_cgsqckdj.sqdwlxdz IS '单位地址';
COMMENT ON COLUMN proj_cgsqckdj.sqdwyzbm IS '邮政编码';
COMMENT ON COLUMN proj_cgsqckdj.sqdwlxr IS '联系人';
COMMENT ON COLUMN proj_cgsqckdj.sfzhm IS '身份证号';
COMMENT ON COLUMN proj_cgsqckdj.sqdwlxdh IS '联系电话';
COMMENT ON COLUMN proj_cgsqckdj.symd IS '使用目的';
COMMENT ON COLUMN proj_cgsqckdj.sqyt IS '用途类型';
COMMENT ON COLUMN proj_cgsqckdj.xmly IS '项目来源';
COMMENT ON COLUMN proj_cgsqckdj.syfs IS '使用方式';
COMMENT ON COLUMN proj_cgsqckdj.cgzlmc IS '申请成果资料';
COMMENT ON COLUMN proj_cgsqckdj.sqcglx IS '申请成果类型(中文名称逗号分隔，与旧系统 SQCGLX 一致)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd1 IS '成果清单-基本地形图(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd2 IS '成果清单-航摄影像(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd3 IS '成果清单-卫星影像(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd4 IS '成果清单-GPS控制点(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd5 IS '成果清单-三角控制点(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd6 IS '成果清单-水准控制点(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd7 IS '成果清单-专题数据(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd8 IS '成果清单-土地资料(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd9 IS '成果清单-科技档案(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd10 IS '成果清单-测绘项目档案(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd11 IS '成果清单-其它资料(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd12 IS '成果清单-规划成果(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.cgqd13 IS '成果清单-实景三维(JSON)';
COMMENT ON COLUMN proj_cgsqckdj.ztxs IS '载体形式';
COMMENT ON COLUMN proj_cgsqckdj.ccjz IS '存储介质';
COMMENT ON COLUMN proj_cgsqckdj.sfjm IS '是否加密';
COMMENT ON COLUMN proj_cgsqckdj.jmlx IS '加密类型';
COMMENT ON COLUMN proj_cgsqckdj.tgxs IS '提供形式';
COMMENT ON COLUMN proj_cgsqckdj.gplx IS '光盘类型';
COMMENT ON COLUMN proj_cgsqckdj.ckbzsm IS '出库备注说明';
COMMENT ON COLUMN proj_cgsqckdj.ckr IS '出库人';
COMMENT ON COLUMN proj_cgsqckdj.ckrq IS '出库日期';
COMMENT ON COLUMN proj_cgsqckdj.zrl IS '总容量';
COMMENT ON COLUMN proj_cgsqckdj.ycl IS '已处理: 1已处理 0处理中';
COMMENT ON COLUMN proj_cgsqckdj.data_source IS '外部数据来源系统编码';
COMMENT ON COLUMN proj_cgsqckdj.data_source_name IS '外部数据来源系统名称';
COMMENT ON COLUMN proj_cgsqckdj.external_id IS '外部分发单主键';
COMMENT ON COLUMN proj_cgsqckdj.external_sync_time IS '最近外部同步时间';
