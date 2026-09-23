/**
 * 从表单上下文获取主表表名（保留原始大小写）
 * @param {Object} co
 * @returns {string}
 */
function getFormTableName(co) {
    var tableName = "";
    if (window.$ && window.$.F && window.$.F.getFormData) {
        var formData = window.$.F.getFormData();
        if (formData && formData.boPrimayKey) {
            tableName = formData.boPrimayKey.split(".")[0];
        }
        if (!tableName && formData && formData.boRelateId) {
            try {
                var relateList = JSON.parse(formData.boRelateId);
                if (relateList && relateList.length > 0 && relateList[0].aliasName) {
                    tableName = relateList[0].aliasName;
                }
            } catch (e) {
            }
        }
    }
    if (!tableName && co) {
        tableName = co.domainTableName || co.params.table || "";
    }
    return tableName || "";
}

/**
 * 生成可能的表单字段全名（兼容表名/字段名大小写）
 * @param {string} tableName
 * @param {string} fieldName
 * @returns {Array<string>}
 */
function buildFieldKeys(tableName, fieldName) {
    var lowerField = fieldName.toLowerCase();
    var upperField = fieldName.toUpperCase();
    var lowerTable = tableName.toLowerCase();
    var upperTable = tableName.toUpperCase();
    var keyList = [
        lowerTable + "." + lowerField,
        upperTable + "." + lowerField,
        lowerTable + "." + upperField,
        upperTable + "." + upperField
    ];
    var uniqueKeys = [];
    for (var i = 0; i < keyList.length; i++) {
        if (uniqueKeys.indexOf(keyList[i]) === -1) {
            uniqueKeys.push(keyList[i]);
        }
    }
    return uniqueKeys;
}

/**
 * 获取主表字段值（兼容表名/字段名大小写）
 * @param {Object} co
 * @param {string} fieldName
 * @returns {string}
 */
function getMainFieldValue(co, fieldName) {
    if (!fieldName) {
        return "";
    }
    var fieldKeys = buildFieldKeys(getFormTableName(co), fieldName);
    var i = 0;
    var value = "";

    if (window.$ && window.$.F && window.$.F.getFieldValue) {
        for (i = 0; i < fieldKeys.length; i++) {
            value = window.$.F.getFieldValue(fieldKeys[i]);
            if (value !== undefined && value !== null && value !== "") {
                return value;
            }
        }
    }

    for (i = 0; i < fieldKeys.length; i++) {
        if (document.getElementById(fieldKeys[i])) {
            value = window.$.F.getFieldValue(fieldKeys[i]);
            if (value !== undefined && value !== null && value !== "") {
                return value;
            }
        }
    }

    if (co && co.params && co.params.rid) {
        value = co.getValue(fieldName.toLowerCase(), co.domainTableName, "RID", co.params.rid, true, false, "", true);
        if (value) {
            return value;
        }
    }

    if (co && co.getDomainValue) {
        value = co.getDomainValue(fieldName.toUpperCase());
        if (value !== undefined && value !== null && value !== "") {
            return value;
        }
        if (fieldName.toLowerCase() === "datafiledatasourcerid") {
            value = co.getDomainValue("dataFileDatasourceRid");
            if (value !== undefined && value !== null && value !== "") {
                return value;
            }
        }
    }
    return "";
}

/**
 * 设置主表字段值（兼容表名/字段名大小写）
 * @param {Object} co
 * @param {string} fieldName
 * @param {string} fieldValue
 * @param {boolean} updateDb
 */
function setMainFieldValue(co, fieldName, fieldValue, updateDb) {
    if (!fieldName) {
        return;
    }
    var fieldKeys = buildFieldKeys(getFormTableName(co), fieldName);
    var i = 0;
    var isSet = false;

    if (window.$ && window.$.F && window.$.F.setFieldValue) {
        for (i = 0; i < fieldKeys.length; i++) {
            if (document.getElementById(fieldKeys[i])) {
                window.$.F.setFieldValue(fieldKeys[i], fieldValue);
                isSet = true;
                break;
            }
        }
        if (!isSet) {
            window.$.F.setFieldValue(fieldKeys[0], fieldValue);
        }
    }

    if (updateDb && co && co.params && co.params.rid) {
        co.setValue(fieldName.toLowerCase(), fieldValue, "RID", co.params.rid, true);
    }

    // 同步域值，兼容仍使用 co.getDomainValue 的外部脚本（如 validateFileAndProcess）
    if (co && co.setDomainValue) {
        co.setDomainValue(fieldName.toUpperCase(), fieldValue, !!updateDb);
        if (fieldName.toLowerCase() === "datafiledatasourcerid") {
            co.setDomainValue("dataFileDatasourceRid", fieldValue, !!updateDb);
        }
    }
}

function doThing() {
    var dataFileDatasource = getMainFieldValue(co, "datafiledatasource");
    var dataFileDatasourceRid = "";
    var dataFilePath = "";
    if (dataFileDatasource && window.dataFileSourceDic && window.dataFileSourceDic[dataFileDatasource]) {
        var sourceItem = window.dataFileSourceDic[dataFileDatasource];
        dataFileDatasourceRid = sourceItem.rid || sourceItem.RID || "";
        dataFilePath = sourceItem.lj || sourceItem.LJ || "";
    }
    setMainFieldValue(co, "datafiledatasourcerid", dataFileDatasourceRid);
    setMainFieldValue(co, "filepath", dataFilePath);
}

doThing();
