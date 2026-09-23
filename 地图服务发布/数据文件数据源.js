if (!window.dataFileSourceDropList) {
    window.dataFileSourceDropList = [];
    window.dataFileSourceDic = {};
    let dbSqlArr = $.execsql(null, "下拉数据列表-数据文件管理", null, null, null, null, null).sql1;
    for (let i = 0; i < dbSqlArr.length; i++) {
        window.dataFileSourceDropList.push({
            id: dbSqlArr[i].rid,
            value: dbSqlArr[i].rid,
            text: dbSqlArr[i].mc,
            label: dbSqlArr[i].mc
        })
        window.dataFileSourceDic[dbSqlArr[i].mc] = dbSqlArr[i];
    }
}
window.dataFileSourceDropList;