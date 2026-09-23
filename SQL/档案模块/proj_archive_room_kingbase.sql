--********************************************************************************
-- SMAP 三维虚拟档案馆（人大金仓 Kingbase ES，标识符小写）
-- 由 Archive3D/达梦脚本迁移，去掉对 SYS_DOC_DOCUMENT 的外键，扩展 smap 字段
--********************************************************************************

CREATE SEQUENCE IF NOT EXISTS proj_archive_room_seq START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS proj_archive_cabinet_seq START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS proj_archive_location_seq START WITH 10000 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS proj_archive_layer_loc_seq START WITH 10000 INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS proj_archive_room (
    code                    BIGINT PRIMARY KEY,
    orderindex              BIGINT DEFAULT 0 NOT NULL,
    legacy_doc_unid         VARCHAR(32),
    name                    VARCHAR(100) NOT NULL,
    alias                   VARCHAR(100) NOT NULL,
    x_length                NUMERIC NOT NULL,
    y_length                NUMERIC NOT NULL,
    h_length                NUMERIC NOT NULL,
    keyholders              TEXT,
    roommanagers            TEXT,
    remark                  VARCHAR(4000),
    pillarinfo              TEXT,
    doorsinfo               TEXT,
    windowsinfo             TEXT,
    sqlviewname             VARCHAR(100),
    listordercolumn         VARCHAR(100),
    initpostion_x           NUMERIC,
    initpostion_y           NUMERIC,
    initpostion_h           NUMERIC,
    initpostion_rot         NUMERIC,
    movestep                NUMERIC,
    locatedistance          NUMERIC,
    floortextureimage       VARCHAR(200),
    cabinetmovedistance     NUMERIC,
    elementname_cabinet     VARCHAR(30),
    elementname_side        VARCHAR(30),
    elementname_door        VARCHAR(30),
    elementname_layer       VARCHAR(30),
    createtime              VARCHAR(30),
    createuser              VARCHAR(100),
    lastmodifytime          VARCHAR(30),
    lastmodifyuser          VARCHAR(100),
    CONSTRAINT uk_proj_archive_room_name UNIQUE (name),
    CONSTRAINT uk_proj_archive_room_alias UNIQUE (alias)
);

CREATE TABLE IF NOT EXISTS proj_archive_cabinet (
    code                    BIGINT PRIMARY KEY,
    legacy_doc_unid         VARCHAR(32),
    parentcode              BIGINT NOT NULL,
    name                    VARCHAR(100) NOT NULL,
    lenght                  NUMERIC NOT NULL,
    height                  NUMERIC NOT NULL,
    width                   NUMERIC NOT NULL,
    startx                  NUMERIC NOT NULL,
    starty                  NUMERIC NOT NULL,
    starth                  NUMERIC DEFAULT 0 NOT NULL,
    doornumberh             BIGINT NOT NULL,
    doornumberv             BIGINT NOT NULL,
    withdoor                SMALLINT DEFAULT 0 NOT NULL,
    doortype                SMALLINT DEFAULT 1 NOT NULL,
    cabinettype             SMALLINT DEFAULT 1 NOT NULL,
    direction               SMALLINT DEFAULT 1 NOT NULL,
    remark                  VARCHAR(4000),
    defaultleyercount       BIGINT NOT NULL,
    defaultfolderwidth      NUMERIC NOT NULL,
    everydoorconfig         TEXT,
    doorheightpercents      VARCHAR(500),
    doorwidthpercents       VARCHAR(500),
    layerdirection          SMALLINT DEFAULT 1 NOT NULL,
    doorrowdirection        SMALLINT DEFAULT 1 NOT NULL,
    doorcolumndirection     SMALLINT DEFAULT 1 NOT NULL,
    doornameformula         VARCHAR(200),
    doornameformula2        VARCHAR(200),
    doornamesize            VARCHAR(20),
    layernameformula        VARCHAR(200),
    layernameformula2       VARCHAR(200),
    layernamesize           VARCHAR(20),
    foldernamesize          VARCHAR(20),
    locationformula         VARCHAR(300),
    defaultfoldermode       SMALLINT DEFAULT 1 NOT NULL,
    operatingside           SMALLINT DEFAULT 0 NOT NULL,
    dooropendirection       SMALLINT DEFAULT 1 NOT NULL,
    foldernamealign         SMALLINT,
    folderordermode         SMALLINT DEFAULT 0 NOT NULL,
    createtime              VARCHAR(30),
    createuser              VARCHAR(100),
    lastmodifytime          VARCHAR(30),
    lastmodifyuser          VARCHAR(100),
    CONSTRAINT fk_proj_archive_cab_room FOREIGN KEY (parentcode)
        REFERENCES proj_archive_room (code) ON DELETE CASCADE,
    CONSTRAINT uk_proj_archive_cab_name UNIQUE (parentcode, name)
);

CREATE INDEX IF NOT EXISTS idx_proj_archive_cab_room ON proj_archive_cabinet (parentcode);

CREATE TABLE IF NOT EXISTS proj_archive_location (
    code                    BIGINT PRIMARY KEY,
    parentdocunid           VARCHAR(32) NOT NULL,
    locdescription          VARCHAR(1000),
    typex                   SMALLINT,
    roomcode                BIGINT NOT NULL,
    cabinetcode             BIGINT NOT NULL,
    roomalia                VARCHAR(100) NOT NULL,
    cabinetname             VARCHAR(100) NOT NULL,
    cabinetside             SMALLINT NOT NULL,
    doorindex               BIGINT NOT NULL,
    layerindex              BIGINT NOT NULL,
    boxindex                BIGINT NOT NULL,
    foldercount             BIGINT DEFAULT 1 NOT NULL,
    orderindex              BIGINT DEFAULT 1 NOT NULL,
    form_code               VARCHAR(64),
    record_rid              CHAR(36),
    record_title            VARCHAR(255),
    createtime              VARCHAR(30),
    createuser              VARCHAR(100),
    lastmodifytime          VARCHAR(30),
    lastmodifyuser          VARCHAR(100),
    CONSTRAINT uk_proj_archive_loc_doc UNIQUE (parentdocunid),
    CONSTRAINT fk_proj_archive_loc_room FOREIGN KEY (roomcode)
        REFERENCES proj_archive_room (code) ON DELETE CASCADE,
    CONSTRAINT fk_proj_archive_loc_cab FOREIGN KEY (cabinetcode)
        REFERENCES proj_archive_cabinet (code) ON DELETE CASCADE,
    CONSTRAINT ck_proj_archive_loc_side CHECK (cabinetside IN (1, 2)),
    CONSTRAINT ck_proj_archive_loc_door CHECK (doorindex >= 1),
    CONSTRAINT ck_proj_archive_loc_layer CHECK (layerindex >= 1),
    CONSTRAINT ck_proj_archive_loc_box CHECK (boxindex >= 1)
);

CREATE INDEX IF NOT EXISTS idx_proj_archive_loc_pos ON proj_archive_location (
    roomcode, cabinetcode, cabinetside, doorindex, layerindex, boxindex
);

CREATE TABLE IF NOT EXISTS proj_archive_layer_location (
    code                    BIGINT PRIMARY KEY,
    location                VARCHAR(500),
    roomalia                VARCHAR(100) NOT NULL,
    cabinetname             VARCHAR(100) NOT NULL,
    cabinetside             SMALLINT NOT NULL,
    doorindex               BIGINT NOT NULL,
    layerindex              BIGINT NOT NULL,
    CONSTRAINT uk_proj_archive_layer_loc UNIQUE (
        roomalia, cabinetname, cabinetside, doorindex, layerindex
    )
);

CREATE INDEX IF NOT EXISTS idx_proj_archive_layer_pos ON proj_archive_layer_location (
    roomalia, cabinetname, cabinetside, doorindex, layerindex
);

COMMENT ON TABLE proj_archive_room IS '三维虚拟档案馆-档案室';
COMMENT ON TABLE proj_archive_cabinet IS '三维虚拟档案馆-档案柜';
COMMENT ON TABLE proj_archive_location IS '三维虚拟档案馆-文档物理位置(parentdocunid 对应 webdocument/smap 文档)';
