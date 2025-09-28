<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">

<%@ attribute name="type" required="true" rtexprvalue="false" %>
<%@ attribute name="itemName" required="false" rtexprvalue="true" description="only need when type equal with item_grid" %>

<%if(type.equalsIgnoreCase("simple_grid")){ %>
	<input type="button" id="exportToWxcelBtn" style="display: none;"
	       onclick="tableToExcel_simpleGrid('testTable', 'W3C Example Table')"
	       value="Export to Excel">
<%}else if(type.equalsIgnoreCase("search_grid")){ %>
	<input type="button" id="exportToWxcelBtn" style="display: none;"
	       onclick="tableToExcel('testTable', 'W3C Example Table')"
	       value="Export to Excel">
<%}else if(type.equalsIgnoreCase("item_grid")){ %>
	<input type="button" id="exportToWxcelBtn" style="display: none;"
	       onclick="tableToExcel_itemGrid_${itemName}('testTable', 'W3C Example Table')"
	       value="Export to Excel">
<%} %>

<table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="2"></table>
<%--<table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="2"><caption>CODE-PAGE SUPPORT IN MICROSOFT WINDOWS</caption><colgroup align="center"></colgroup><colgroup align="left"></colgroup><colgroup span="2" align="center"></colgroup><colgroup span="3" align="center"></colgroup><thead valign="top"><tr><th>Code-Page<br>ID</th><th>Name</th><th>ACP</th><th>OEMCP</th><th>Windows<br>NT 3.1</th><th>Windows<br>NT 3.51</th><th>Windows<br>95</th></tr></thead><tbody><tr><td>1200</td><td style="background-color: #00f; color: #fff">Unicode (BMP of ISO/IEC-10646)</td><td></td><td></td><td>X</td><td>X</td><td>*</td></tr><tr><td>1250</td><td style="font-weight: bold">Windows 3.1 Eastern European</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>1251</td><td>Windows 3.1 Cyrillic</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>1252</td><td>Windows 3.1 US (ANSI)</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>1253</td><td>Windows 3.1 Greek</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>1254</td><td>Windows 3.1 Turkish</td><td>X</td><td></td><td>X</td><td>X</td><td>X</td></tr><tr><td>1255</td><td>Hebrew</td><td>X</td><td></td><td></td><td></td><td>X</td></tr><tr><td>1256</td><td>Arabic</td><td>X</td><td></td><td></td><td></td><td>X</td></tr><tr><td>1257</td><td>Baltic</td><td>X</td><td></td><td></td><td></td><td>X</td></tr><tr><td>1361</td><td>Korean (Johab)</td><td>X</td><td></td><td></td><td>**</td><td>X</td></tr></tbody><tbody><tr><td>437</td><td>MS-DOS United States</td><td></td><td>X</td><td>X</td><td>X</td><td>X</td></tr><tr><td>708</td><td>Arabic (ASMO 708)</td><td></td><td>X</td><td></td><td></td><td>X</td></tr><tr><td>709</td><td>Arabic (ASMO 449+, BCON V4)</td><td></td><td>X</td><td></td><td></td><td>X</td></tr><tr><td>710</td><td>Arabic (Transparent Arabic)</td><td></td><td>X</td><td></td><td></td><td>X</td></tr><tr><td>720</td><td>Arabic (Transparent ASMO)</td><td></td><td>X</td><td></td><td></td><td>X</td></tr></tbody></table>--%>
<a id="dlink"  style="display:none;"></a>
<script type="text/javascript">
        var fileName='${pageTitle}';
    	var tableToExcel = (function() {
        return function(table, name) {
            if (!table.nodeType)
                table = document.getElementById(table);
            var searchJsonString = "{}";
            if(typeof(getSearchObject)=="function"){
                searchJsonString = JSON.stringify(getSearchObject());
                searchJsonString = searchJsonString.replace(/\//g, ':@:');
            }
            $.ajax({
                url: "search/exportToExcel/"+searchJsonString,
                type:"GET",
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success: function (data) {
                    /*var uri = 'data:application/vnd.ms-excel;base64,'
                            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">' +
                                    '<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayRightToLeft/><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body dir="rtl"><table>'+data.exportMessage+'</table></body></html>'
                            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
                            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
                    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
//                    window.location.href = uri + base64(format(template, ctx));
                    document.getElementById("dlink").href = uri + base64(format(template, ctx));
                    document.getElementById("dlink").download = fileName+'-'+data.fileName;
                    document.getElementById("dlink").click();*/
                    var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel"><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
                    tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
                    tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
                    tab_text = tab_text + '<x:WorksheetOptions><x:DisplayRightToLeft/><x:DisplayGridlines/><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
                    tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body dir="rtl">';
                    tab_text = tab_text + "<table border='1px'>";

                    tab_text = tab_text + data.exportMessage;
                    tab_text = tab_text + '</table></body></html>';
                    var fileN =fileName+'-'+data.fileName;

                    //Save the file
                    var blob = new Blob([tab_text], { type: "application/vnd.ms-excel;charset=utf-8" })
                    window.saveAs(blob, fileN);
                },error:function(result){
                    if(result.status==401){
                        top.location.href=top.location.href;
                    }
                }
            });
        };
    })();

    	var tableToExcel_simpleGrid = (function() {
        return function(table, name) {
            if (!table.nodeType)
                table = document.getElementById(table);
            $.ajax({
                url: getBaseUrl() + "/grid-read/exportToExcel",
                type:"GET",
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success: function (data) {
                    /*var uri = 'data:application/vnd.ms-excel;base64,'
                            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">' +
                                    '<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook>' +
						'<x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayRightToLeft/><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body dir="rtl"><table>'+data.exportMessage+'</table></body></html>'
                            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
                            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
                    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                    document.getElementById("dlink").href = uri + base64(format(template, ctx));
                    document.getElementById("dlink").download = fileName+'-'+data.fileName;
                    document.getElementById("dlink").click();*/
                    var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel"><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
                    tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
                    tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
                    tab_text = tab_text + '<x:WorksheetOptions><x:DisplayRightToLeft/><x:DisplayGridlines/><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
                    tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body dir="rtl">';
                    tab_text = tab_text + "<table border='1px'>";

                    tab_text = tab_text + data.exportMessage;
                    tab_text = tab_text + '</table></body></html>';
                    var fileN =fileName+'-'+data.fileName;

                    //Save the file
                    var blob = new Blob([tab_text], { type: "application/vnd.ms-excel;charset=utf-8" })
                    window.saveAs(blob, fileN);
                },error:function(result){
                    if(result.status==401){
                        top.location.href=top.location.href;
                    }
                }
            });
        };
    })();
    
    	var tableToExcel_itemGrid_${itemName} = (function() {
        return function(table, name) {
            if (!table.nodeType)
                table = document.getElementById(table);
            var loadedId_ = $("#id").val();
            var itemName_ = '${itemName}';
            $.ajax({
                url: getBaseUrl() + "item-grid-read-exportToExcel/"+itemName_+"/"+loadedId_,
                type:"GET",
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success: function (data) {
                    var uri = 'data:application/vnd.ms-excel;base64,'
                            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">' +
                                    '<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayRightToLeft/><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body dir="rtl"><table>'+data.exportMessage+'</table></body></html>'
                            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
                            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
                    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                    document.getElementById("dlink").href = uri + base64(format(template, ctx));
					var requestUrl = getBaseUrl() + "item-exportToExcel-getItemName/"+itemName_;
					var itemFileName = "";
					var dataFileName = data.fileName;
					$.getJSON(requestUrl, function (data) {
						itemFileName = data.itemFileName;
						document.getElementById("dlink").download = itemFileName+'-'+dataFileName;
	                    document.getElementById("dlink").click();
                    });
                },error:function(result){
                    if(result.status==401){
                        top.location.href=top.location.href;
                    }
                }
            });
        };
    })();


         var saveAs = saveAs || (function(view) {
                "use strict";
                // IE <10 is explicitly unsupported
                if (typeof view === "undefined" || typeof navigator !== "undefined" && /MSIE [1-9]\./.test(navigator.userAgent)) {
                    return;
                }
                var
                    doc = view.document
                    // only get URL when necessary in case Blob.js hasn't overridden it yet
                    , get_URL = function() {
                        return view.URL || view.webkitURL || view;
                    }
                    , save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a")
                    , can_use_save_link = "download" in save_link
                    , click = function(node) {
                        var event = new MouseEvent("click");
                        node.dispatchEvent(event);
                    }
                    , is_safari = /constructor/i.test(view.HTMLElement) || view.safari
                    , is_chrome_ios =/CriOS\/[\d]+/.test(navigator.userAgent)
                    , setImmediate = view.setImmediate || view.setTimeout
                    , throw_outside = function(ex) {
                        setImmediate(function() {
                            throw ex;
                        }, 0);
                    }
                    , force_saveable_type = "application/octet-stream"
                    // the Blob API is fundamentally broken as there is no "downloadfinished" event to subscribe to
                    , arbitrary_revoke_timeout = 1000 * 40 // in ms
                    , revoke = function(file) {
                        var revoker = function() {
                            if (typeof file === "string") { // file is an object URL
                                get_URL().revokeObjectURL(file);
                            } else { // file is a File
                                file.remove();
                            }
                        };
                        setTimeout(revoker, arbitrary_revoke_timeout);
                    }
                    , dispatch = function(filesaver, event_types, event) {
                        event_types = [].concat(event_types);
                        var i = event_types.length;
                        while (i--) {
                            var listener = filesaver["on" + event_types[i]];
                            if (typeof listener === "function") {
                                try {
                                    listener.call(filesaver, event || filesaver);
                                } catch (ex) {
                                    throw_outside(ex);
                                }
                            }
                        }
                    }
                    , auto_bom = function(blob) {
                        // prepend BOM for UTF-8 XML and text/* types (including HTML)
                        // note: your browser will automatically convert UTF-16 U+FEFF to EF BB BF
                        if (/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(blob.type)) {
                            return new Blob([String.fromCharCode(0xFEFF), blob], {type: blob.type});
                        }
                        return blob;
                    }
                    , FileSaver = function(blob, name, no_auto_bom) {
                        if (!no_auto_bom) {
                            blob = auto_bom(blob);
                        }
                        // First try a.download, then web filesystem, then object URLs
                        var
                            filesaver = this
                            , type = blob.type
                            , force = type === force_saveable_type
                            , object_url
                            , dispatch_all = function() {
                                dispatch(filesaver, "writestart progress write writeend".split(" "));
                            }
                            // on any filesys errors revert to saving with object URLs
                            , fs_error = function() {
                                if ((is_chrome_ios || (force && is_safari)) && view.FileReader) {
                                    // Safari doesn't allow downloading of blob urls
                                    var reader = new FileReader();
                                    reader.onloadend = function() {
                                        var url = is_chrome_ios ? reader.result : reader.result.replace(/^data:[^;]*;/, 'data:attachment/file;');
                                        var popup = view.open(url, '_blank');
                                        if(!popup) view.location.href = url;
                                        url=undefined; // release reference before dispatching
                                        filesaver.readyState = filesaver.DONE;
                                        dispatch_all();
                                    };
                                    reader.readAsDataURL(blob);
                                    filesaver.readyState = filesaver.INIT;
                                    return;
                                }
                                // don't create more object URLs than needed
                                if (!object_url) {
                                    object_url = get_URL().createObjectURL(blob);
                                }
                                if (force) {
                                    view.location.href = object_url;
                                } else {
                                    var opened = view.open(object_url, "_blank");
                                    if (!opened) {
                                        // Apple does not allow window.open, see https://developer.apple.com/library/safari/documentation/Tools/Conceptual/SafariExtensionGuide/WorkingwithWindowsandTabs/WorkingwithWindowsandTabs.html
                                        view.location.href = object_url;
                                    }
                                }
                                filesaver.readyState = filesaver.DONE;
                                dispatch_all();
                                revoke(object_url);
                            }
                        ;
                        filesaver.readyState = filesaver.INIT;

                        if (can_use_save_link) {
                            object_url = get_URL().createObjectURL(blob);
                            setImmediate(function() {
                                save_link.href = object_url;
                                save_link.download = name;
                                click(save_link);
                                dispatch_all();
                                revoke(object_url);
                                filesaver.readyState = filesaver.DONE;
                            }, 0);
                            return;
                        }

                        fs_error();
                    }
                    , FS_proto = FileSaver.prototype
                    , saveAs = function(blob, name, no_auto_bom) {
                        return new FileSaver(blob, name || blob.name || "download", no_auto_bom);
                    }
                ;

                // IE 10+ (native saveAs)
                if (typeof navigator !== "undefined" && navigator.msSaveOrOpenBlob) {
                    return function(blob, name, no_auto_bom) {
                        name = name || blob.name || "download";

                        if (!no_auto_bom) {
                            blob = auto_bom(blob);
                        }
                        return navigator.msSaveOrOpenBlob(blob, name);
                    };
                }

                // todo: detect chrome extensions & packaged apps
                //save_link.target = "_blank";

                FS_proto.abort = function(){};
                FS_proto.readyState = FS_proto.INIT = 0;
                FS_proto.WRITING = 1;
                FS_proto.DONE = 2;

                FS_proto.error =
                    FS_proto.onwritestart =
                        FS_proto.onprogress =
                            FS_proto.onwrite =
                                FS_proto.onabort =
                                    FS_proto.onerror =
                                        FS_proto.onwriteend =
                                            null;

                return saveAs;
            }(
                typeof self !== "undefined" && self
                || typeof window !== "undefined" && window
                || this
            ));
    
</script>