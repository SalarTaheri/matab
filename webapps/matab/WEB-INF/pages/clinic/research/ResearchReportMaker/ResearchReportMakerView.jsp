<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="com.artonis.clinic.core.model.ConstValue" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/lib/jquery.mousewheel-3.0.6.pack.js' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.css?v=2.1.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/jquery.fancybox.pack.js?v=2.1.5' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.css?v=1.0.5' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-buttons.js?v=1.0.5' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-media.js?v=1.0.6' />"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7' />" type="text/css"/>
<script type="text/javascript" src="<c:url value='/resources/js/fancyapps-fancyBox-18d1712/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7' />"></script>
<script type="text/javascript" src="<c:url value='/resources/fileDownload/jquery.fileDownload.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/simulate.js' />"></script>
<script src="<c:url value='/resources/js/blockUI/blockUI.js' />"></script>
<div id="reportMakerObjects">

    <table style="width: 100%;">
        <tr>
            <td style="width: 170px; padding: 5px;">
                <div class="reportMaker-container-origin" id="andContainerDrag" draggable="true">
                    <h3 class="reportMaker-title">AND Container</h3>
                </div>
                <div class="reportMaker-container-origin" id="orContainerDrag" draggable="true">
                    <h3 class="reportMaker-title">OR Container</h3>
                </div>
            </td>
            <td rowspan="2">
                <div droppable="true" id="mainContainer"></div>
                <br/>
                <div align="center">
                    <input type="button" class="uk-button uk-button-primary" onclick="generatQuery('grid')" value="Make Query" />
                    <input type="button" class="uk-button uk-button-primary" onclick="generatQuery('excel')" value="Make Excel" />
                    <input type="button" class="uk-button uk-button-primary" onclick="generatQuery('html')" value="Make HTML" />
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 470px; padding: 5px;">
                <div id="accordion">
                    <h3>Patient Files</h3>
                    <div id="visit" class="accordion-item"></div>
                </div>
            </td>
        </tr>
    </table>

    <div class="k-rtl">
        <div id="myGrid"></div>
    </div>

    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="2">
    </table>

</div>

<div id="patientFileContainer" style="display: none;" dir="ltr">
</div>

<script>
    var divCounter = 1;
    var myStack = [];
    
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}" + "/clinic/research/researchReportMaker/loadAccordion",
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var divC = document.getElementById('visit');
                for (i = 0; i < data.visit.length; i++) {
                    var divItem = document.createElement("div");
                    divItem.id = data.visit[i].id;
                    divItem.innerHTML = data.visit[i].alias;
                    divItem.className = "accordion-item-field " + data.visit[i].type;
                    divItem.dataType = data.visit[i].type;
                    divItem.key = data.visit[i].key;
                    divItem.listLoaderUrl = data.visit[i].listLoaderUrl;
                    divItem.formFieldType = data.visit[i].formFieldType;
                    $(divItem).draggable({
                    	opacity: 0.7,
                    	helper: "clone",
                    });
                    divC.appendChild(divItem);
                }
            }, error: function (result) {
                console.log(result);
                alert(result.msg);
            }
        });
        
        $("#accordion").accordion({
            collapsible: true,
            heightStyle: "fill"
        });

        $("[draggable]").draggable({
        	opacity: 0.7,
        	helper: "clone",
        });
        
        $("[droppable]").droppable({
        	hoverClass: "droppable-highlight",
        	greedy: true,
            drop: onDrop
        });

        if("${setting.addOrContainerResearchReportMakerInDefault}"=="true"){
            autoDragAndDrop();
        }
    });

    function onDrop(event, ui) {
    	if (ui.draggable.hasClass("accordion-item-field")) {
            dropField(this, ui);
            return;
        }

        var h3 = document.createElement("h3");
        var h3Title = "OR Container";
        divCounter++;
        var outterDivTitle = "orContainerDrag_" + divCounter;
        var operation = "OR";
        if (ui.draggable.attr('id') == 'andContainerDrag') {
            h3Title = "AND Container";
            outterDivTitle = "andContainerDrag_" + divCounter;
            operation = "AND";
        }
        h3.innerHTML = h3Title;
        h3.className = "reportMaker-title";

        var img = document.createElement("img");
		img.src = '<c:url value="/resources/images/delete/Actions-edit-delete-icon8.png"/>';
		img.onclick = function () {
			$("#" + outterDivTitle).remove();
		};
		img.style.cursor = 'pointer';
		h3.appendChild(img);
		
        var outterDiv = document.createElement("div");
        outterDiv.className = "reportMaker-container";
        outterDiv.id = outterDivTitle;
        $(outterDiv).droppable({
        	hoverClass: "droppable-highlight",
        	greedy: true,
            drop: onDrop
        });
        
        if (this.mehrsysParentId === undefined) {
            outterDiv.className = outterDiv.className + " mainContainer";
            outterDiv.style.width = "100%";
            outterDiv.style.margin = "0";
            outterDiv.level = 1;
        } else {
            outterDiv.level = this.level + 1;
        }
        outterDiv.operation = operation;
        outterDiv.appendChild(h3);
        outterDiv.mehrsysParentId = this.id;
        this.appendChild(outterDiv);
  	}
    
    function recursiveTravers(divEl) {
        var c = divEl.childNodes;
        for (k = 0; k < c.length; k++) {
            if (c[k].classList.contains("reportMaker-container")) {
                var stackElement = {};
                stackElement.el_parent_id = divEl.id;
                stackElement.el_id = c[k].id;
                stackElement.el_opr = c[k].operation;
                stackElement.el_parent_opr = divEl.operation;
                stackElement.el_level = c[k].level;
                stackElement.el_value = 'null';
                stackElement.el_dataType = 'null';
                myStack.push(stackElement);

                return recursiveTravers(c[k]);
            } else if (c[k].classList.contains("accordion-item-fieldContent")) {
                var stackElement = {};
                stackElement.el_parent_id = divEl.id;
                stackElement.el_id = c[k].id;
                stackElement.el_fieldName = c[k].fieldName;
                stackElement.el_fieldCaption = c[k].childNodes[0].innerText;
                var operation = $('#' + c[k].id + '-select').val();
                stackElement.el_opr = operation;
                stackElement.el_level = divEl.level + 1;
                stackElement.el_parent_opr = divEl.operation;
                stackElement.el_dataType = chooseType(c[k]);
                var inpVal = document.getElementById(c[k].id + '-input').value;
                var inpText = document.getElementById(c[k].id + '-input').textContent;
                stackElement.el_value = inpVal;
                stackElement.el_value_caption = inpText;
                stackElement.el_text_beforeSelect =  document.getElementById(c[k].id + '-input-hidden').value;
                //
                if (c[k].id.indexOf("labTestResultWithValueList_labTestVal")>-1) {
                    var labTestNameArr = $("#" + c[k].id).siblings("div[id^='labTestResultWithValueList_labTestId']");
                    if (labTestNameArr.size() == 1) {
                        var dataType = $("#" + labTestNameArr.get(0).id + " input[id^='labTestResultWithValueList_labTestId']").get(0).getAttribute("data-dataType");
                        if (dataType == <%=ConstValue.MedicalTestTypeEnum.INT.getValue()%>) {
                            if ($.isNumeric(inpVal) == false) {
                                return "Please enter numeric value in \'Lab Test Value\' field";
                            }
                        }
                    } else if (labTestNameArr.size() > 0) {
                        var siblingsLabTestValArr = $("#" + c[k].id).siblings("div[id^='labTestResultWithValueList_labTestVal']");
                        if (siblingsLabTestValArr.size() > 0) {
                            return "Please use each pair of \'Lab Test Name\' and \'Lab Test Value\' fields in separated container";
                        }
                    }
                }
                //
                myStack.push(stackElement);
            }
        }
        return '';
    }
    
    function generatQuery(type) {
    	var mainItem = document.getElementById('mainContainer').children;
    	if(mainItem.length == 0) {
    		alertify.error('Select Fields');
    		return;
    	}
    	
        var x = document.getElementsByClassName("mainContainer");
        myStack = [];
        var stackElement = {};
        stackElement.el_parent_id = 'root';
        stackElement.el_id = x[0].id;
        stackElement.el_opr = x[0].operation;
        stackElement.el_level = x[0].level;
        stackElement.el_value = 'null';

        myStack.push(stackElement);

        var error = recursiveTravers(x[0]);
        if (error != ''){
            alertify.error(error);
            return;
        }

        if (!type) {
        	type = '';
        }
        $.ajax({
            url: "${pageContext.request.contextPath}" + "/clinic/research/researchReportMaker/makeQuery?type=" + type,
            type: "POST",
            data: JSON.stringify(myStack),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if (data.state == 'error') {
                    alertify.error(data.msg);
                    $("#myGrid").kendoGrid({dataSource: null});
                } else {
                    alertify.success("Query Executed Successfully");
                    //
                	if (type == 'grid') {
                        if ($("#myGrid").data("kendoGrid") != undefined) {
                            $("#myGrid").data("kendoGrid").destroy();
                            $("#myGrid").empty();
                        }
                        //
                		$("#myGrid").kendoGrid({
                            dataSource: {
                            	data: JSON.parse(data.exportMessage),
                                pageSize: 20,
                                serverPaging: false,
                                serverFiltering: false,
                                serverSorting: false
                            },
                            sortable: true,
                            filterable: true,
                            pageable: true,
                            columns: [
                                {
	                                field: "filenumber",
	                                title: '<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.fileNumber")%>'
	                            }, {
	                                field: "firstname",
	                                title: '<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.firstName")%>'
	                            }, {
	                                field: "lastname",
	                                title: '<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.lastName")%>'
	                            }, {
                                    command: {text: '<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patientfile")%>', click: myGrid_onPatientFile },
	                            	title: " "
	                            }]
                        });
                	} else if(type == 'excel'){
                        var table = document.getElementById('testTable');
                        var uri = 'data:application/vnd.ms-excel;base64,'
                                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>' + data.exportMessage + '</table></body></html>'
                                , base64 = function (s) {
                                    return window.btoa(unescape(encodeURIComponent(s)))
                                }
                                , format = function (s, c) {
                                    return s.replace(/{(\w+)}/g, function (m, p) {
                                        return c[p];
                                    })
                                };
                        var ctx = {worksheet: 'Worksheet', table: table.innerHTML};
                        window.location.href = uri + base64(format(template, ctx));
                	}  else if(type == 'html'){
//                        download("<html><table>"+data.exportMessage+"</table></html>","test\\h.zip","application/zip");
//                        window.location.href="data:application/zip:base64,"+data.exportMessage.fileValue;

//                        var hiddenElement = document.createElement('a');
//
//                        hiddenElement.href = 'data:application/octet-stream;charset=utf-8;base64,' + data.exportMessage.fileValue;
//                        hiddenElement.target = '_blank';
//                        hiddenElement.download = data.exportMessage.fileName;
//                        hiddenElement.click();
                        $.fileDownload("${pageContext.request.contextPath}" + "/clinic/research/researchReportMaker/download/"+data.exportMessage.fileName, {
                            successCallback: function (url) {

//                                alert('You just got a file download dialog or ribbon for this URL :' + url);
                            },
                            failCallback: function (html, url) {

//                                alert('Your file download just failed for this URL:' + url + '\r\n' +
//                                    'Here was the resulting error HTML: \r\n' + html
//                                );
                            }
                        });
                    }
                }

            }
            ,beforeSend: function(){
                        $("#body-table1").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /></div>'});
            },
            complete: function(){
                        $("#body-table1").unblock();
            }
            , error: function (result) {
                console.log(result);
                alertify.error('Query is not correct');
            }
        });
    }

    function getRelatedComboOperationValue(type) {
        if (type == "list") {
            return ["equal", "notEqual"];
        } else if (type == "string") {
            return ["equal", "notEqual", "contain"];
        } else if (type == "long" || type == "integer" ) {
            return ["equal", "lowerThan", "lowerThanEqual", "greaterThan", "greaterThanEqual", "notEqual"];
        } else {
            return ["equal", "lowerThan", "lowerThanEqual", "greaterThan", "greaterThanEqual", "notEqual", "IN", "contain"];
        }
    }
    
    function getRelatedComboOperationCaption(type) {
        if (type == "list") {
            return ["Equal", "Not Equal"];
        } else if (type == "string") {
            return ["Equal", "Not Equal", "Contain"];
        } else if (type == "long" || type == "integer" ) {
            return ["Equal", "Lower Than", "Lower Than Equal", "Greater Than", "Greater Than Equal", "Not Equal"];
        } else {
            return ["Equal", "Lower Than", "Lower Than Equal", "Greater Than", "Greater Than Equal", "Not Equal", "IN", "Contain"];
        }
    }

    function dropField(currentElement, ui) {
        if ($(document.getElementById('mainContainer')).children().size() == 0) {
            alertify.alert("You should use a container(AND/OR) for the first element", function(){
                $(document.getElementById('mainContainer').children[0]).remove();
            });
            return;
        }

        divCounter++;
        var prifixName = ui.draggable[0].key + divCounter.toString();

        var h3 = document.createElement("h3");
        h3.innerHTML = ui.draggable.text();
        h3.style.fontWeight = "bold";

        var img = document.createElement("img");
		img.src = '<c:url value="/resources/images/delete/Actions-edit-delete-icon8.png"/>';
		img.onclick = function () {
			$("#" + prifixName).remove();
		};
		img.style.cursor = 'pointer';
        img.style.marginRight = '5px';
		h3.appendChild(img);
		
        var selectList = document.createElement("select");
        selectList.id = prifixName + '-select';
        selectList.style.display = "inline-block";
        selectList.style.padding = "3px";
        selectList.style.borderRadius = "3px";
        selectList.style.width = "130px";
        var oprArray = getRelatedComboOperationValue(ui.draggable[0].formFieldType);
        var oprArrayCaption = getRelatedComboOperationCaption(ui.draggable[0].formFieldType);

        //Create and append the options
        for (var i = 0; i < oprArray.length; i++) {
            var option = document.createElement("option");
            option.value = oprArray[i];
            option.text = oprArrayCaption[i];
            selectList.appendChild(option);
        }

        var div = document.createElement("div");
        div.id = prifixName;
        div.fieldName = ui.draggable[0].key;
        div.className = "accordion-item-fieldContent";
        div.mehrsysParentId = currentElement.id;
        div.dataType = ui.draggable[0].dataType;
        div.formFieldType = ui.draggable[0].formFieldType;
        div.appendChild(h3);
        div.appendChild(selectList);
        var element = document.createElement("input");
        element.className = "select-editable listInput";
        element.id = prifixName + "-input";
    	element.type = "text";
        div.appendChild(element);
        currentElement.appendChild(div);
        
        if (ui.draggable[0].formFieldType == "list") {
        	element.style.display = "none";
        	
        	var viewElement = document.createElement("input");
        	viewElement.realElementId = element.id;
        	viewElement.className = "listInput";
        	div.appendChild(viewElement);

        	var hiddenTextBox=document.createElement("input");
        	hiddenTextBox.type="hidden"
        	hiddenTextBox.id=element.id+"-hidden";
        	div.appendChild(hiddenTextBox);

            $(viewElement).autocomplete({
            	minLength: 0,
            	delay: 0,
        	    source: "${pageContext.request.contextPath}" + ui.draggable[0].listLoaderUrl,
        	    select: function(event, ui) {
        	    	event.target.value = ui.item.label;
        	    	$("#" + event.target.realElementId).val(ui.item.value);
        	    	$("#" + event.target.realElementId).text(ui.item.label);
        	    	$("#" + event.target.realElementId).attr('data-dataType', ui.item.dataType);
        	        return false;
        	    },
                search: function( event, ui ) {
                    $('#'+this.realElementId+'-hidden').val(this.value);
                    $('#'+this.realElementId).val('');
                    $('#'+this.realElementId).text('');
                    console.log(this.value);
                },
                change: function( event, ui ) {
                    console.log('changed:'+this.value);
                    if(ui.item==null){
                        $('#'+this.realElementId).val('');
                        $('#'+this.realElementId).text('');
                    }

                }
        	})
        	.autocomplete("instance")._renderItem = function(ul, item) {
        		return $("<li>")
        	        .append("<a>" + item.label + "</a>")
        	        .appendTo(ul);
        	};
        }
    }

    function chooseType(el) {
        if (el.id.indexOf("labTestResultWithValueList_labTestVal")>-1) {
            try {
                var labTestNameArr = $("#" + el.parentElement.id + " input[id^='labTestResultWithValueList_labTestId']");
                if (labTestNameArr.size() == 0) {
                    return 'string';
                }
                var dataType = eval(labTestNameArr[0].getAttribute("data-dataType"));
                if (dataType == <%=ConstValue.MedicalTestTypeEnum.INT.getValue()%>) {
                    return 'float';
                } else {
                    return 'string';
                }
            } catch(err) {
                return 'string';
            }
        }
        //
        if ($("#" + el.id)[0].dataType == "boolean") {
            return 'boolean';
        }
        if ($("#" + el.id)[0].dataType == "integer") {
            return 'integer';
        }
        if ($("#" + el.id)[0].dataType == "date") {
            return 'string';
        }
        if ($("#" + el.id)[0].dataType == "long") {
            return 'long';
        }
        if ($("#" + el.id)[0].dataType == "list") {
            return 'list';
        }
        return 'string';
    }
    
	function myGrid_onPatientFile(e) {
        e.preventDefault();
	    var data = this.dataItem($(e.target).closest("tr"));
	    loadPatientFile(data.id);
	}
	
	function loadPatientFile(id) {
	    $.getJSON("<c:url value='/' />" + "clinic/research/researchReportMaker/loadPatientFileByPatientId/" + id, function (data) {
	        $("#patientFileContainer").html(data.data);
            showPatientFileContainer();
	    });
    }

    function exportToWord(patientId) {


        $.ajax({
            url: "${pageContext.request.contextPath}" + '/clinic/patient/configurablePatientRecord/downloadWordValidation/'+patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                if(data.state == 'success'){
                    <%--$.ajax({--%>
                        <%--url: "${pageContext.request.contextPath}" + '/clinic/patient/configurablePatientRecord/downloadWord/'+patientId,--%>
                        <%--type: "GET",--%>
                        <%--success: function (data) {--%>

                        <%--},beforeSend: function(){--%>
                            <%--console.log('beforeSend')--%>
                            <%--$("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /></div>'});--%>
                        <%--},--%>
                        <%--complete: function(){--%>
                            <%--$("#body-table").unblock();--%>
                        <%--}--%>
                    <%--});--%>

                    window.location.href = '${pageContext.request.contextPath}' + '/clinic/patient/configurablePatientRecord/downloadWord/'+patientId;
                }else{
                    alertify.error("Can not export to MS.Word");
                }
            },beforeSend: function(){
                    $("#body-table").block({ message: '<div><img  style="padding: 5px;" src="<c:url value='/resources/images/loader.gif'/>" /></div>'});
            },
            complete: function(){
                    $("#body-table").unblock();
            }, error: function (result) {
                alertify.error("Can not export MS.Word");
            }
        });
    }

    var icons = {
        header: "ui-icon-circle-arrow-e",
        activeHeader: "ui-icon-circle-arrow-s"
    };

    function showPatientFileContainer() {
        $("#body-table").addClass("bodyTableBackForReportMaker");
        //
        $("#reportMakerObjects").hide();
        $("#patientFileContainer").show();
        //
        fancySizeCorrection();
        //
        $(".myAccordion").accordion({
            icons: icons,
            heightStyle: "content",
            collapsible: true,
            active: true
        });
        //
        $(".fancybox").fancybox({
            'width':$(window).width() * 0.85,
            'height':$(window).height() * 0.85,
            'autoDimensions':false,
            'autoSize':false,
            'mouseWheel': false,
            afterShow: function() {
            },
            beforeShow: function() {
                this.element.css("height", "98%");

                var sourceDiv = this.element;
                if (sourceDiv.hasClass("handwritingFancybox")) {
                    var url = sourceDiv.css("background-image");
                    url = url.substring(5, url.length - 2);

                    var img = new Image();
                    img.onload = function () {
                        sourceDiv.css("background-size", img.width / 1.5 + 'px');
                    };
                    img.src = url;
                }
            },
            afterClose: function() {
                $(".handwritingTable div").css("display", "");
                $(".handwritingTable div").css("width", "auto");
                $(".handwritingTable div").css("height", "250px");
                fancySizeCorrection();
            },
            beforeClose: function(){
            }
        });
    }

    function hidePatientFileContainer() {
        $("#body-table").removeClass("bodyTableBackForReportMaker");
        //
        $("#reportMakerObjects").show();
        $("#patientFileContainer").hide();
    }

    function fancySizeCorrection() {
        $(".fancybox").each(function (item) {
            var sourceDiv = $(this);
            if (sourceDiv.hasClass("handwritingFancybox")) {
                var divWidth = sourceDiv.width();
                var url = sourceDiv.css("background-image");
                url = url.substring(5, url.length - 2);

                var img = new Image();
                img.onload = function () {
                    sourceDiv.css("background-size", img.width / 3.5 + 'px');
                };
                img.src = url;
            }
        });
    }
    
    function imageDivFrameOnClick(event) {
    }

    function download(data, strFileName, strMimeType) {

        var self = window, // this script is only for browsers anyway...
                u = "application/octet-stream", // this default mime also triggers iframe downloads
                m = strMimeType || u,
                x = data,
                D = document,
                a = D.createElement("a"),
                z = function(a){return String(a);},


                B = self.Blob || self.MozBlob || self.WebKitBlob || z,
                BB = self.MSBlobBuilder || self.WebKitBlobBuilder || self.BlobBuilder,
                fn = strFileName || "download",
                blob,
                b,
                ua,
                fr;

        //if(typeof B.bind === 'function' ){ B=B.bind(self); }

        if(String(this)==="true"){ //reverse arguments, allowing download.bind(true, "text/xml", "export.xml") to act as a callback
            x=[x, m];
            m=x[0];
            x=x[1];
        }



        //go ahead and download dataURLs right away
        if(String(x).match(/^data\:[\w+\-]+\/[\w+\-]+[,;]/)){
            return navigator.msSaveBlob ?  // IE10 can't do a[download], only Blobs:
                    navigator.msSaveBlob(d2b(x), fn) :
                    saver(x) ; // everyone else can save dataURLs un-processed
        }//end if dataURL passed?

        try{

            blob = x instanceof B ?
                    x :
                    new B([x], {type: m}) ;
        }catch(y){
            if(BB){
                b = new BB();
                b.append([x]);
                blob = b.getBlob(m); // the blob
            }

        }



        function d2b(u) {
            var p= u.split(/[:;,]/),
                    t= p[1],
                    dec= p[2] == "base64" ? atob : decodeURIComponent,
                    bin= dec(p.pop()),
                    mx= bin.length,
                    i= 0,
                    uia= new Uint8Array(mx);

            for(i;i<mx;++i) uia[i]= bin.charCodeAt(i);

            return new B([uia], {type: t});
        }

        function saver(url, winMode){


            if ('download' in a) { //html5 A[download]
                a.href = url;
                a.setAttribute("download", fn);
                a.innerHTML = "downloading...";
                D.body.appendChild(a);
                setTimeout(function() {
                    a.click();
                    D.body.removeChild(a);
                    if(winMode===true){setTimeout(function(){ self.URL.revokeObjectURL(a.href);}, 250 );}
                }, 66);
                return true;
            }

            //do iframe dataURL download (old ch+FF):
            var f = D.createElement("iframe");
            D.body.appendChild(f);
            if(!winMode){ // force a mime that will download:
                url="data:"+url.replace(/^data:([\w\/\-\+]+)/, u);
            }


            f.src = url;
            setTimeout(function(){ D.body.removeChild(f); }, 333);

        }//end saver


        if (navigator.msSaveBlob) { // IE10+ : (has Blob, but not a[download] or URL)
            return navigator.msSaveBlob(blob, fn);
        }

        if(self.URL){ // simple fast and modern way using Blob and URL:
            saver(self.URL.createObjectURL(blob), true);
        }else{
            // handle non-Blob()+non-URL browsers:
            if(typeof blob === "string" || blob.constructor===z ){
                try{
                    return saver( "data:" +  m   + ";base64,"  +  self.btoa(blob)  );
                }catch(y){
                    return saver( "data:" +  m   + "," + encodeURIComponent(blob)  );
                }
            }

            // Blob but not URL:
            fr=new FileReader();
            fr.onload=function(e){
                saver(this.result);
            };
            fr.readAsDataURL(blob);
        }
        return true;
    } /* end download() */

    function autoDragAndDrop(){
        var draggable = $("#orContainerDrag").draggable(),
            droppable = $("#mainContainer").droppable(),

            droppableOffset = droppable.offset(),
            draggableOffset = draggable.offset(),
            dx = droppableOffset.left - draggableOffset.left,
            dy = droppableOffset.top - draggableOffset.top;

        draggable.simulate("drag", {
            dx: dx,
            dy: dy
        });
    }

</script>

<style>
    .reportMaker-title {
        border: 1px #bce8f1 solid;
        color: #31708f;
        background-color: #33B2CC;
    }

    .reportMaker-container-origin {
        height: 70px;
        min-width: 165px;
        background: rgb(90, 123, 197);
        background-color: white;
        border: 1px solid #33B2CC;
        border-radius: 4px;
        color: rgb(38, 33, 211);
        text-align: center;
    }

	.reportMaker-container-origin:HOVER {
		background-color: #DEEFF3;
	}
	
    .reportMaker-container {
    	min-width: 330px;
    	min-height: 200px;
    	margin: 10px;
        background: rgb(90, 123, 197);
        background-color: white;
        border: 1px solid #33B2CC;
        border-radius: 4px;
        color: rgb(38, 33, 211);
        text-align: center;
        display: inline-block;
        vertical-align: top;
    }

	.reportMaker-container:HOVER {
		background-color: #DEEFF3;
	}

    .accordion-item-fieldContent {
        border: 1px #31708f solid;
        border-radius: 3px;
        margin: 10px;
        padding: 5px;
        background-color: white;
        height: 50px;
        width: 300px;
    }

    .accordion-item-field {
    	padding: 8px 3px 8px 1px;
    	margin-bottom: 4px;
        width: 130px;
        border: 1px #fbd850 solid;
        border-radius: 2px;
        background-color: white;
        word-wrap: break-word;
    }

	.accordion-item-field:HOVER {
		background-color: rgba(251, 216, 80, 0.3);
	}
	    
    .accordion-item {
    	padding: 6px !important;
    	overflow: auto;
    }
    
    h3 {
    	margin: 0;
    }
    
    .droppable-highlight {
    	background-color: #31708f !important;
    }

    #mainContainer {
        min-height: 500px;
        width: 99%;
        background-color: white;
        display: flex;
        border-color: black;
        border-style: inset;
    }

    #accordion.ui-widget {
        text-align: center !important;
    }

    .ui-accordion-header {
        font-weight: bold;
    }

    .listInput {
        margin-right: 4px;
        padding: 4px;
        border-radius: 3px;
        border-style: solid;
        border-width: thin;
        border-color: darkgrey;
    }

    .patientFileTable td {
        vertical-align: top;
        text-align: left;
        margin-bottom: 15px;
        padding-bottom: 15px;
    }

    #patientFileContainer_title td span {
        font-size: 15px !important;
        /*font-family: cursive, tahoma !important;*/
    }

    .ui-accordion-content {
        background: rgb(253, 253, 228) !important
    }

    .bodyTableBackForReportMaker {
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f5f6), color-stop(37%,#e3eaed), color-stop(100%,#c8d7dc)) !important;
    }

    .ui-accordion-header {
        color: black !important;
    }

    .fancybox-nav {
        height: 80%;
        top: 20%;
    }

    .fancybox-nav span {
        top: 40%;
    }
</style>
