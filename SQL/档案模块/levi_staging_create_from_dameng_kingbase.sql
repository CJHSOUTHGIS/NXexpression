--********************************************************************************
-- 在 SMAP 金仓库创建 staging 表（结构与 proj_archive_* 一致，表名加 levi_staging_ 前缀）
-- 达梦 DTS 迁移时：源 PROJ_ARCHIVE_ROOM -> 目标 levi_staging_proj_archive_room（列名改小写）
-- 可选：SYS_DOC_DOCUMENT -> levi_staging_sys_doc_document（仅 CODE,TITLE,FORMPATH 三列即可）
--********************************************************************************

CREATE TABLE IF NOT EXISTS levi_staging_proj_archive_room (
    LIKE proj_archive_room INCLUDING DEFAULTS INCLUDING STORAGE
);
CREATE TABLE IF NOT EXISTS levi_staging_proj_archive_cabinet (
    LIKE proj_archive_cabinet INCLUDING DEFAULTS INCLUDING STORAGE
);
CREATE TABLE IF NOT EXISTS levi_staging_proj_archive_location (
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
    createtime              VARCHAR(30),
    createuser              VARCHAR(100),
    lastmodifytime          VARCHAR(30),
    lastmodifyuser          VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS levi_staging_proj_archive_layer_location (
    LIKE proj_archive_layer_location INCLUDING DEFAULTS INCLUDING STORAGE
);

CREATE TABLE IF NOT EXISTS levi_staging_sys_doc_document (
    code        VARCHAR(32) PRIMARY KEY,
    title       VARCHAR(200),
    formpath    VARCHAR(300)
);

TRUNCATE levi_staging_proj_archive_room;
TRUNCATE levi_staging_proj_archive_cabinet;
TRUNCATE levi_staging_proj_archive_location;
TRUNCATE levi_staging_proj_archive_layer_location;
TRUNCATE levi_staging_sys_doc_document;
