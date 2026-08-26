CREATE OR REPLACE VIEW V_PROJ_JBDXT AS
SELECT
    blc            AS "比例尺",             --blc
    xth            AS "图号",               --xth
    tm             AS "图名",               --tm
    sjlx           AS "数据类型",           --sjlx
    jth            AS "旧图号",             --jth
    scnf           AS "生产时间",           --scnf
    zbxt           AS "坐标系统",           --zbxt
    gcjz           AS "高程基准",           --gcjz
    tfdgj          AS "图幅等高距",         --tfdgj
    dqbmh          AS "当前保密号",          --dqbmh
    sjgs           AS "数据格式",           --sjgs
    ztxs           AS "载体形式",           --ztxs
    sjdx           AS "数据大小",           --sjdx
    scdw           AS "生产单位",           --scdw
    zsl            AS "总数量",             --zsl
    kcl            AS "库存量",             --kcl
    pc             AS "批次",               --pc
    "RID",
    "JID",
    "SYS_PARENTRID"
FROM PROJ_JBDXT;

-- 授权
GRANT SELECT ON V_PROJ_JBDXT TO public;
