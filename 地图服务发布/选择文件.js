try{
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

    /**
     * 标准化文件路径，与后端 standardizePath 保持一致
     * @param {string} path
     * @returns {string}
     */
    function normalizePath(path) {
        if (!path) {
            return "";
        }
        var standardPath = String(path).replace(/\\/g, "/");
        if (standardPath.length > 2 && standardPath.charAt(1) === ":") {
            standardPath = standardPath.substring(2);
        }
        if (standardPath && standardPath.charAt(0) !== "/") {
            standardPath = "/" + standardPath;
        }
        while (standardPath.length > 1 && standardPath.charAt(standardPath.length - 1) === "/") {
            standardPath = standardPath.substring(0, standardPath.length - 1);
        }
        return standardPath;
    }

    /**
     * 计算选中文件相对数据源根目录的路径
     * @param {string} selectFilePath
     * @param {string} baseFilePath
     * @returns {string}
     */
    function buildRelativeFilePath(selectFilePath, baseFilePath) {
        var normalizedSelectPath = normalizePath(selectFilePath);
        var normalizedBasePath = normalizePath(baseFilePath);
        if (!normalizedSelectPath) {
            return "";
        }
        if (!normalizedBasePath) {
            return normalizedSelectPath;
        }
        if (normalizedSelectPath.indexOf(normalizedBasePath) === 0) {
            var relativePath = normalizedSelectPath.substring(normalizedBasePath.length);
            if (!relativePath) {
                return "/";
            }
            if (relativePath.charAt(0) !== "/") {
                relativePath = "/" + relativePath;
            }
            return relativePath;
        }
        return normalizedSelectPath;
    }

    function doThing() {
        let dataFileDatasourceRid = getMainFieldValue(co, "datafiledatasourcerid");
        if (!dataFileDatasourceRid) {
            co.Message.error_middle("数据源不能为空");
            return;
        }
        let filePath = getMainFieldValue(co, "filepath");
        if (!filePath) {
            co.Message.error_middle("数据源路径不能为空");
            return;
        }
        let fwfl = getMainFieldValue(co, "fwfl");
        let fileTypes = "";//限制选择的文件类型
        if (fwfl == "矢量数据") {
            fileTypes = "";//zip
        } else if (fwfl == "栅格数据") {
            //可以支持的类型太多，暂时不做限制，直接所有文件都可见
        } else {
            co.Message.error_middle("数据分类有误，暂不支持");
            return;
        }

        parentWindow.listCo.Dialog.showFolderSelector({
            apiUrl: "/infosvrPageSupport/MapServiceRelease/GetDataFileTree",
            title: "选择文件/文件夹",
            callback: function (item) {
                let fileName = item.fileName;
                let fileNameEx = !item.isFolder ? fileName.substring(fileName.lastIndexOf(".") + 1) : "";
                if (fileNameEx.toLowerCase() == "zip") {//zip文件需要解压后才能选中
                    //解压zip文件
                    extractZip(dataFileDatasourceRid, item)
                } else {//文件夹或者其他类型格式文件直接使用即可
                    if (getMainFieldValue(co, "fwfl") == "矢量数据") {
                        if(!item.isFolder){
                            return "只允许选择shapefile文件夹或zip压缩包、gdb文件夹或zip压缩包";
                        }
                    }


                    let selectFilePath = decryptPath(item.rid);
                    let selectFileRelativePath = buildRelativeFilePath(selectFilePath, filePath);
                    let selectFileValue = selectFileRelativePath + "|" + item.rid;

                    // 使用验证函数进行文件类型验证
                    window.validateFileAndProcess(
                        selectFileValue,
                        fwfl,
                        function (finalSelectValue, finalUseValue) {
                            // 验证成功回调
                            setMainFieldValue(co, "sjwj_select", finalSelectValue);//选中文件/文件夹
                            setMainFieldValue(co, "sjwj_use", finalUseValue);//实际使用文件/文件夹
                            //数据文件变化计算规则
                            window.sjwjFileChange();
                        },
                        function (errorMessage) {
                            // 验证失败回调
                            co.Message.error_middle(errorMessage, true);
                        }
                    );
                }
            },
            extraParams: {
                RID: dataFileDatasourceRid,
                FileTypes: fileTypes,
                firstDir: encryptPath(filePath)
            }
        });
    }

    /**
     * 解压ZIP文件
     * @param {string} rid - 资源ID
     * @param {string} filePath - 加密的ZIP文件路径(通过GetDataFileTree获得)
     * @param {boolean} overwrite - 是否覆盖已存在的文件(可选)
     * @returns {Promise<Object>} - 解压结果
     */
    async function extractZipFile(rid, filePath, overwrite = false) {
        try {
            // 显示遮罩层
            window.commonFunUtil.showGlobalMask(255, 255, 255, 0.1, co);

            const encodedFilePath = encodeURIComponent(filePath);
            const url = `/infosvrPageSupport/MapServiceRelease/ExtractZipFile?RID=${rid}&DIRPATH=${encodedFilePath}&OVERWRITE=${overwrite}`;

            const response = await fetch(url);
            if (!response.ok) {
                throw new Error(`HTTP错误! 状态码: ${response.status}`);
            }

            const result = await response.json();
            return result;
        } catch (error) {
            console.error('解压文件请求失败:', error);
            throw error;
        } finally {
            // 隐藏遮罩层
            window.commonFunUtil.hideGlobalMask();
        }
    }

    /**
     * 简单确认对话框函数，支持文本换行
     * @param {string} message - 对话框显示的消息
     * @param {string} title - 对话框标题
     * @param {function} okCallback - 点击确定按钮的回调函数
     * @param {function} cancelCallback - 点击取消按钮的回调函数
     */
    function simpleConfirm(message, title, okCallback, cancelCallback) {
        // 使用window.confirm，它支持原生的换行
        if (window.confirm(message)) {
            if (okCallback) {
                okCallback();
            }
        } else {
            if (cancelCallback) {
                cancelCallback();
            }
        }
    }

    /**
     * 智能处理ZIP文件解压，包含冲突处理
     * @param {string} rid - 资源ID
     * @param {string} filePath - 加密的ZIP文件路径
     * @returns {Promise<Object>} - 解压结果，成功返回解压路径，失败返回null
     */
    async function smartExtractZip(rid, filePath) {
        try {
            // 第一次调用，不覆盖已存在文件
            const result = await extractZipFile(rid, filePath, false);

            if (result.code !== 0) {
                // API调用失败
                co.Message.error_middle(`解压失败: ${result.desc || '未知错误'}`);
                return null;
            }

            // 检查解压状态
            if (result.data.status === 'SUCCESS') {
                // 无冲突，解压成功
                co.Message.success_middle('文件解压成功!');
                return {
                    success: true,
                    extractedPath: result.data.extractedPath
                };
            } else if (result.data.status === 'CONFLICT') {
                // 发现冲突文件，显示提示并询问用户
                const conflictFiles = result.data.conflictFiles;
                let message = '以下文件已存在，是否覆盖?\n\n';

                // 如果冲突文件太多，只显示前5个
                if (conflictFiles.length > 5) {
                    for (let i = 0; i < 5; i++) {
                        message += `• ${conflictFiles[i]}\n`;
                    }
                    message += `\n...以及其他${conflictFiles.length - 5}个文件`;
                } else {
                    conflictFiles.forEach(file => {
                        message += `• ${file}\n`;
                    });
                }

                // 使用简单confirm方法
                return new Promise((resolve) => {
                    simpleConfirm(
                        message,
                        "确认覆盖",
                        async () => {
                            // 用户确认覆盖，再次调用接口
                            const overwriteResult = await extractZipFile(rid, filePath, true);

                            if (overwriteResult.code === 0 && overwriteResult.data.status === 'SUCCESS') {
                                co.Message.success_middle('文件解压成功!');
                                resolve({
                                    success: true,
                                    extractedPath: overwriteResult.data.extractedPath
                                });
                            } else {
                                co.Message.error_middle(`覆盖解压失败: ${overwriteResult.desc || '未知错误'}`);
                                resolve(null);
                            }
                        },
                        () => {
                            // 用户取消操作
                            co.Message.info_middle('操作取消');
                            resolve({
                                success: false,
                                canceled: true,
                                reason: 'USER_CANCELED',
                                extractedPath: result.data.extractedPath
                            });
                        }
                    );
                });
            }

            // 其他未预期的状态
            co.Message.warning_middle('解压操作返回未知状态');
            return null;
        } catch (error) {
            co.Message.error_middle(`解压操作出错: ${error.message}`);
            console.error('解压操作出错:', error);
            return null;
        }
    }

    /**
     * 使用示例 - 获取文件列表并解压ZIP文件
     */
    async function extractZip(rid,
                              item) {
        try {
            // // 示例资源ID
            // const rid = '3ba272d3-6c27-43ce-bea7-5dfcdaa2dcce';
            //
            // // 示例ZIP文件路径 (已加密)
            // const zipFilePath = 'ENC:L2RhdGEvdGVzdERpc2sv5o+Q5Y+Wc2hw5YWl5bqT5paH5Lu2LnppcA==';

            // 解压文件
            const result = await smartExtractZip(rid, item.rid);

            if (result && result.success) {
                console.log('解压成功! 解压后的路径:', result.extractedPath);
                // 这里可以添加解压成功后的逻辑，例如刷新文件列表
                console.log(item);

                //选择的是zip文件，展示下载存储zip地址，实际使用存储文件夹值
                let selectValue = item.fileName + "|" + item.rid;
                let useValue = item.fileName + "|" + result.extractedPath;

                // 获取服务分类进行验证
                let fwfl = getMainFieldValue(co, "fwfl");

                // 使用验证函数进行文件类型验证（验证解压后的文件夹内容）
                window.validateFileAndProcess(
                    useValue, // 验证解压后的文件夹
                    fwfl,
                    function(finalSelectValue, finalUseValue) {
                        // 验证成功回调
                        setMainFieldValue(co, "sjwj_select", selectValue, true); // 显示选择的zip文件
                        setMainFieldValue(co, "sjwj_use", finalUseValue, true); // 实际使用路径
                        //数据文件变化计算规则
                        window.sjwjFileChange();
                    },
                    function(errorMessage) {
                        // 验证失败回调
                        co.Message.error_middle("解压文件验证失败：" + errorMessage,true);
                    },
                    selectValue // 传递原始ZIP选择值，用于SHP类型处理
                );
            } else if (result && result.canceled) {
                console.log('用户取消了解压操作');
            } else {
                console.log('解压失败');
            }
        } catch (error) {
            console.error('示例执行失败:', error);
        }
    }
    doThing();
}catch (e){
    console.log(e);
}