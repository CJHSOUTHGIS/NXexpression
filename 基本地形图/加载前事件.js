var WEBGIS_PUBLIC_BASE = "/sinfoweb/webgis/public";
var BMH_PREFIX = "64";
/**
 * 解析 webgis 接口返回
 * @param {string|Object} dataStr
 * @returns {Object}
 */
function parseWebgisResponse(dataStr) {
    var oData = typeof dataStr === "string" ? JSON.parse(dataStr) : dataStr;
    if (oData && oData.data !== undefined && oData.data !== null) {
        if (typeof oData.data === "string") {
            try {
                oData = JSON.parse(oData.data);
            } catch (e) {
                oData = oData.data;
            }
        } else if (typeof oData.data === "object") {
            oData = oData.data;
        }
    }
    return oData || {};
}

/**
 * 比例尺分母转表单下拉显示值
 * @param {number|string} denominator
 * @returns {string}
 */
function formatScaleByDenominator(denominator) {
    if (denominator === null || denominator === undefined || denominator === "") {
        return "";
    }
    var scaleStr = String(denominator).trim();
    if (scaleStr.indexOf(":") >= 0 || scaleStr.indexOf("：") >= 0) {
        return scaleStr.replace("：", ":");
    }
    var num = Number(scaleStr);
    if (isNaN(num) || num <= 0) {
        return scaleStr;
    }
    var scaleMap = {
        500: "1:5百",
        5000: "1:5千",
        10000: "1:1万",
        25000: "1:2.5万",
        50000: "1:5万",
        100000: "1:10万",
        200000: "1:20万",
        250000: "1:25万",
        500000: "1:50万",
        1000000: "1:100万"
    };
    if (scaleMap[num]) {
        return scaleMap[num];
    }
    return "";
}

/**
 * 从接口结果中提取比例尺分母
 * @param {Object} oData
 * @returns {string|number}
 */
function extractScaleDenominator(oData) {
    if (oData === null || oData === undefined) {
        return "";
    }
    if (typeof oData !== "object") {
        return oData;
    }
    return oData.scale || oData.blc || oData.scaleDenominator || oData.denominator || oData.scaleValue || "";
}

/**
 * 从 convertMapSheetNumber 接口结果中提取旧图号
 * @param {Object} oData
 * @returns {string}
 */
function extractOldMapNoFromConvert(oData) {
    if (oData === null || oData === undefined) {
        return "";
    }
    if (typeof oData !== "object") {
        return String(oData);
    }
    if (oData.isOldMapNo === false && oData.oldMapNo) {
        return oData.oldMapNo;
    }
    if (oData.isOldMapNo === true && oData.mapNo) {
        return oData.mapNo;
    }
    return oData.oldMapNo || oData.oldMapNO || oData.mapNo || "";
}

/**
 * 从 convertMapSheetNumber 接口结果中提取新图号
 * @param {Object} oData
 * @returns {string}
 */
function extractNewMapNoFromConvert(oData) {
    if (oData === null || oData === undefined) {
        return "";
    }
    if (typeof oData !== "object") {
        return String(oData).trim();
    }
    var newMapNo = oData.newMapNo || oData.newMapNO || "";
    if (newMapNo === null || newMapNo === undefined) {
        return "";
    }
    return String(newMapNo).trim();
}

/**
 * 根据新图号获取比例尺并赋值
 * @param {Object} co
 * @param {string} mapNo
 * @param {function(string, string|number)} successCallback
 * @param {function()} errorCallback
 */
function fetchAndSetScaleByMapNo(co, mapNo, successCallback, errorCallback) {
    co.Http.requestByDirectory(WEBGIS_PUBLIC_BASE + "/getScaleByMapNO", {
        mapNo: mapNo
    }, false, "GET", function (scaleDataStr) {
        try {
            var scaleData = parseWebgisResponse(scaleDataStr);
            var scaleDenominator = extractScaleDenominator(scaleData);
            var blc = formatScaleByDenominator(scaleDenominator);
            if (successCallback) {
                successCallback(blc, scaleDenominator);
            }
        } catch (e) {
            console.error(e);
            if (errorCallback) {
                errorCallback();
            }
        }
    });
}

/**
 * 从图号转换接口结果中提取旧图号（通用兜底）
 * @param {Object} oData
 * @returns {string}
 */
function extractOldMapNo(oData) {
    if (oData === null || oData === undefined) {
        return "";
    }
    if (typeof oData !== "object") {
        return String(oData);
    }
    return oData.oldMapNo || oData.oldMapNO || oData.jth || oData.result || oData.data || "";
}

/**
 * 解析接口返回的坐标字符串
 * 格式示例: (106.25:36.125)(106.3125:36.125)(106.3125:36.083333333333336)(106.25:36.083333333333336)
 * @param {string} resultStr
 * @returns {Array<Array<string>>}
 */
function parseCoordResultString(resultStr) {
    if (!resultStr || typeof resultStr !== "string") {
        return [];
    }
    var pointList = [];
    var reg = /\(([^:)]+):([^)]+)\)/g;
    var match = reg.exec(resultStr);
    while (match) {
        pointList.push([match[1], match[2]]);
        match = reg.exec(resultStr);
    }
    return pointList;
}

/**
 * 坐标结果转为 tfzbfw 范围线格式
 * @param {Object|string} oData
 * @returns {string}
 */
function formatCoordPointsToTfzbfw(oData) {
    if (!oData) {
        return "";
    }
    if (typeof oData === "string") {
        oData = { result: oData };
    }

    var coordinates = oData.coordinates || oData.coordPoints || oData.points || oData.result;
    if (!coordinates && oData.data) {
        coordinates = oData.data.coordinates || oData.data.coordPoints || oData.data.points || oData.data.result || oData.data;
    }
    if (!coordinates) {
        return "";
    }

    // mapNOToCoordPointsSmallScale 返回: (经度:纬度)(经度:纬度)...
    if (typeof coordinates === "string") {
        var strPointList = parseCoordResultString(coordinates);
        if (strPointList.length > 0) {
            var strGraphArr = [];
            for (var k = 0; k < strPointList.length; k++) {
                strGraphArr.push(strPointList[k][0] + "," + strPointList[k][1]);
            }
            return strGraphArr.join(";");
        }
        return "";
    }

    var polygonList = coordinates;
    if (Array.isArray(coordinates) && coordinates.length > 0 && !Array.isArray(coordinates[0])) {
        polygonList = [coordinates];
    }

    var aReturn = [];
    for (var j = 0; j < polygonList.length; j++) {
        var oCoordinates = polygonList[j];
        if (!Array.isArray(oCoordinates) || oCoordinates.length === 0) {
            continue;
        }
        var graphArr = [];
        for (var i = 0; i < oCoordinates.length; i++) {
            var oCoordinate = oCoordinates[i];
            if (!Array.isArray(oCoordinate) || oCoordinate.length < 2) {
                continue;
            }
            graphArr.push(oCoordinate[0] + "," + oCoordinate[1]);
        }
        if (graphArr.length > 0) {
            aReturn.push(graphArr.join(";"));
        }
    }
    return aReturn.join("|");
}

function getFormCo() {
    return window.co;
}

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
        tableName = co.domainTableName || co.params.table || "proj_jbdxt";
    }
    return tableName || "proj_jbdxt";
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
 * 获取主表字段值（兼容 proj_jbdxt.xth / PROJ_JBDXT.xth）
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
    return "";
}

/**
 * 设置主表字段值（兼容 proj_jbdxt.xth / PROJ_JBDXT.xth）
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
}

function showFormError(msg) {
    var co = getFormCo();
    if (co && co.Message && co.Message.error_middle) {
        co.Message.error_middle(msg);
        return;
    }
    if (window.Vue && window.Vue.prototype && window.Vue.prototype.$msg) {
        window.Vue.prototype.$msg.error(msg);
        return;
    }
    alert(msg);
}

/**
 * 根据新图号获取坐标范围并赋值
 * @param {Object} co
 * @param {string} mapNo
 * @param {function(string)} successCallback
 * @param {function()} errorCallback
 */
function fetchAndSetCoordByMapNo(co, mapNo, successCallback, errorCallback) {
    co.Http.requestByDirectory(WEBGIS_PUBLIC_BASE + "/invokeSurveyCalculator2", {
        method: "mapNOToCoordPointsSmallScale",
        params: {
            mapNo: mapNo,
            coordName: "CGCS2000",
            returnJwd: true,
            zoneWidth: 0
        }
    }, false, "POST", function (dataStr) {
        try {
            var oData = parseWebgisResponse(dataStr);
            var tfzbfw = formatCoordPointsToTfzbfw(oData);
            if (tfzbfw) {
                setMainFieldValue(co, "tfzbfw", tfzbfw, true);
            }
            if (successCallback) {
                successCallback(tfzbfw);
            }
        } catch (e) {
            console.error(e);
            if (errorCallback) {
                errorCallback();
            }
        }
    });
}

/**
 * 根据图号计算坐标（按钮调用）
 */
window.calcCoordByXth = function () {
    var co = getFormCo();
    if (!co) {
        showFormError("表单尚未初始化，请检查加载前事件是否执行成功！");
        return;
    }
    var xth = getMainFieldValue(co, "xth");
    if (!xth) {
        co.Message.error_middle("请先输入新图号！");
        return;
    }
    co.Progress.baseProgressFake("提示", 10000, "正在根据图号计算坐标", null, null);
    fetchAndSetCoordByMapNo(co, xth, function (tfzbfw) {
        co.Progress.baseProgressClose();
        if (tfzbfw) {
            co.Message.success_middle("坐标计算成功！");
        } else {
            co.Message.error_middle("未获取到有效范围线坐标！");
        }
    }, function () {
        co.Progress.baseProgressClose();
        co.Message.error_middle("坐标计算失败！");
    });
};

/**
 * 执行根据新图号计算旧图号和比例尺
 * @param {Object} co
 * @param {string} xth
 */
function doCalcOldMapNoAndScaleByXth(co, xth) {
    co.Progress.baseProgressFake("提示", 10000, "正在计算旧图号、比例尺和坐标范围", null, null);
    co.Http.requestByDirectory(WEBGIS_PUBLIC_BASE + "/convertMapSheetNumber", {
        mapNo: xth,
        convertType: "newToOld"
    }, false, "POST", function (dataStr) {
        try {
            var convertData = parseWebgisResponse(dataStr);
            var jth = extractOldMapNoFromConvert(convertData);

            if (!jth) {
                co.Progress.baseProgressClose();
                co.Message.error_middle("未获取到有效的旧图号！");
                return;
            }

            setMainFieldValue(co, "jth", jth, true);

            var pendingCount = 2;
            var blc = "";
            var tfzbfw = "";
            var scaleDenominator = "";

            function finishCalcOldMapNoAndScale() {
                pendingCount--;
                if (pendingCount > 0) {
                    return;
                }
                co.Progress.baseProgressClose();
                if (blc && tfzbfw) {
                    co.Message.success_middle("旧图号、比例尺和坐标范围计算成功！");
                } else if (blc) {
                    co.Message.success_middle("旧图号和比例尺计算成功，但未获取到坐标范围！");
                } else if (tfzbfw) {
                    co.Message.success_middle("旧图号和坐标范围计算成功，但未获取到比例尺！");
                } else if (scaleDenominator) {
                    co.Message.error_middle("比例尺值 " + scaleDenominator + " 无法匹配下拉选项！");
                } else {
                    co.Message.success_middle("旧图号计算成功，但未获取到比例尺和坐标范围！");
                }
            }

            fetchAndSetScaleByMapNo(co, xth, function (blcValue, scaleDenominatorValue) {
                blc = blcValue;
                scaleDenominator = scaleDenominatorValue;
                if (blc) {
                    setMainFieldValue(co, "blc", blc, true);
                }
                finishCalcOldMapNoAndScale();
            }, function () {
                finishCalcOldMapNoAndScale();
            });

            fetchAndSetCoordByMapNo(co, xth, function (tfzbfwValue) {
                tfzbfw = tfzbfwValue;
                finishCalcOldMapNoAndScale();
            }, function () {
                finishCalcOldMapNoAndScale();
            });
        } catch (e) {
            co.Progress.baseProgressClose();
            console.error(e);
            co.Message.error_middle("旧图号计算失败！");
        }
    });
}

/**
 * 根据新图号计算旧图号和比例尺（按钮调用）
 */
window.calcOldMapNoAndScaleByXth = function () {
    var co = getFormCo();
    if (!co) {
        showFormError("表单尚未初始化，请检查加载前事件是否执行成功！");
        return;
    }
    var xth = getMainFieldValue(co, "xth");
    if (!xth) {
        co.Message.error_middle("请先输入新图号！");
        return;
    }
    co.Dialog.confirm("是否根据新图号计算旧图号和比例尺？", "提示", function () {
        doCalcOldMapNoAndScaleByXth(co, xth);
    });
};

/**
 * 执行根据旧图号计算新图号和比例尺
 * @param {Object} co
 * @param {string} jth
 */
function doCalcNewMapNoAndScaleByJth(co, jth) {
    co.Progress.baseProgressFake("提示", 10000, "正在计算新图号和比例尺", null, null);
    co.Http.requestByDirectory(WEBGIS_PUBLIC_BASE + "/convertMapSheetNumber", {
        mapNo: jth,
        convertType: "oldToNew"
    }, false, "POST", function (dataStr) {
        try {
            var convertData = parseWebgisResponse(dataStr);
            var xth = extractNewMapNoFromConvert(convertData);

            if (!xth) {
                co.Progress.baseProgressClose();
                co.Message.error_middle("【" + jth + "】格式不对，无法换算新图号！");
                return;
            }

            setMainFieldValue(co, "xth", xth, true);

            fetchAndSetScaleByMapNo(co, xth, function (blc, scaleDenominator) {
                co.Progress.baseProgressClose();
                if (blc) {
                    setMainFieldValue(co, "blc", blc, true);
                    co.Message.success_middle("新图号和比例尺计算成功！");
                } else if (scaleDenominator) {
                    co.Message.error_middle("比例尺值 " + scaleDenominator + " 无法匹配下拉选项！");
                } else {
                    co.Message.success_middle("新图号计算成功，但未获取到比例尺！");
                }
            }, function () {
                co.Progress.baseProgressClose();
                co.Message.error_middle("比例尺计算失败！");
            });
        } catch (e) {
            co.Progress.baseProgressClose();
            console.error(e);
            co.Message.error_middle("新图号计算失败！");
        }
    });
}

/**
 * 根据旧图号计算新图号和比例尺（按钮调用）
 */
window.calcNewMapNoAndScaleByJth = function () {
    var co = getFormCo();
    if (!co) {
        showFormError("表单尚未初始化，请检查加载前事件是否执行成功！");
        return;
    }
    var jth = getMainFieldValue(co, "jth");
    if (!jth) {
        co.Message.error_middle("请先输入旧图号！");
        return;
    }
    co.Dialog.confirm("是否根据旧图号计算新图号和比例尺？", "提示", function () {
        doCalcNewMapNoAndScaleByJth(co, jth);
    });
};

/**
 * 取字符串最后一个分隔符后的内容
 * @param {string} str
 * @param {string} separator
 * @returns {string}
 */
function getRightOfLast(str, separator) {
    if (!str) {
        return "";
    }
    var idx = String(str).lastIndexOf(separator);
    if (idx === -1) {
        return String(str);
    }
    return String(str).substring(idx + separator.length);
}

/**
 * 解析数字，无效时返回 0
 * @param {string|number} val
 * @returns {number}
 */
function parseNumberEx(val) {
    var num = Number(String(val).trim());
    if (isNaN(num)) {
        return 0;
    }
    return num;
}

/**
 * 重设保密号（按钮调用）
 */
window.resetDqbmh = function () {
    var co = getFormCo();
    if (!co) {
        showFormError("表单尚未初始化，请检查加载前事件是否执行成功！");
        return;
    }
    var dqbmh = getMainFieldValue(co, "dqbmh");
    var iCurIndex = getRightOfLast(dqbmh, "-");
    var inputVal = String(iCurIndex || "");

    function submitNewBmh() {
        if (!inputVal) {
            co.Message.error_middle("请输入保密号数字！");
            return false;
        }
        var iNumber = parseNumberEx(inputVal);
        if (iNumber <= 0) {
            co.Message.error_middle("请输入一个大于0的数字！");
            return false;
        }
        setMainFieldValue(co, "dqbmh", BMH_PREFIX + "-" + iNumber, true);
        co.Message.success_middle("保密号重设成功！");
        return true;
    }

    var $modal = null;
    if (typeof Vue !== "undefined" && Vue.prototype && Vue.prototype.$modal) {
        $modal = Vue.prototype.$modal;
    } else if (typeof Sgui !== "undefined" && Sgui.$modal) {
        $modal = Sgui.$modal;
    }

    if (!$modal || !$modal.confirm) {
        var inputNumber = window.prompt("请输入当前保密号（数字）：", iCurIndex);
        if (inputNumber !== null && inputNumber !== "") {
            inputVal = inputNumber;
            submitNewBmh();
        }
        return;
    }

    $modal.confirm({
        title: "重设保密号",
        width: 300,
        closable: true,
        similar: true,
        render: function (h) {
            return h("div", {
                style: {
                    padding: "8px 0"
                }
            }, [
                h("div", {
                    style: {
                        marginBottom: "10px",
                        lineHeight: "22px",
                        color: "#333"
                    }
                }, "请输入当前保密号（数字）："),
                h("input", {
                    domProps: {
                        value: inputVal
                    },
                    attrs: {
                        type: "text",
                        placeholder: "请输入大于0的数字"
                    },
                    style: {
                        width: "100%",
                        height: "32px",
                        padding: "0 8px",
                        border: "1px solid #dcdee2",
                        borderRadius: "4px",
                        outline: "none",
                        boxSizing: "border-box"
                    },
                    on: {
                        input: function (event) {
                            inputVal = event.target.value;
                        }
                    }
                })
            ]);
        },
        onOk: function () {
            if (submitNewBmh()) {
                $modal.remove();
            }
        },
        onCancel: function () {
            $modal.remove();
        }
    });
};

if (!window.co) {
    //#import CommonObject
    window.co = new CommonObject();
}

/**
 * 加载前运行
 */
window.doBeforeLoading = function () {
};

window.doBeforeLoading();

/**
 * 加载前执行结束标志
 */
window.dobeforeLoadEnd = true;