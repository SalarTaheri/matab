<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@include file="/WEB-INF/taglibs.jsp"%>

<!DOCTYPE html>
<html >
<head>
<title>${pageTitle}</title>
<meta charset='utf-8'>
<%--<script src="<c:url value='/resources/js/jquery.min.js' />"></script>--%>
<%--<script src="<c:url value='/resources/js/jquery-1.4.2.js' />"></script>--%>
<%--<script src="<c:url value='/resources/js/jquery-ui.js' />"></script>--%>
    <script src="<c:url value='/resources/js/jquery-ui-1.11.1.custom/external/jquery/jquery.js' />"></script>
    <script src="<c:url value='/resources/js/jquery-ui-1.11.1.custom/jquery-ui.js' />"></script>


<link href="<c:url value='/resources/css/web/kendo.common.min.css'/>" 	rel="stylesheet" />
<link href="<c:url value='/resources/css/web/kendo.default.min.css'/>" rel="stylesheet" id="kendo_style" />
<link href="<c:url value='/resources/css/web/kendo.rtl.min.css'/>" 	rel="stylesheet" />
<link href="<c:url value='/resources/css/dataviz/kendo.dataviz.default.min.css'/>" 	rel="stylesheet" />
<link href="<c:url value='/resources/uikit/css/uikit.gradient.min.rtl.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.core.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/alterify/css/alertify.bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/chosen/chosen.css'/>" rel="stylesheet" />
<%--<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.3/themes/ui-lightness/jquery-ui-1.10.3.custom.min.css'/>" rel="stylesheet" />--%>
<link href="<c:url value='/resources/jqueryui/jquery-ui-1.10.4.custom/development-bundle/themes/base/jquery-ui.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/js/lou-multi-select/multi-select.css'/>" rel="stylesheet" />

<%--<script src="<c:url value='/resources/js/kendo.all.min.js' />"></script>--%>
    <script src="<c:url value='/resources/js/kendo-2013-3-324/kendo.all.min.js' />"></script>
<%--<script src="<c:url value='/resources/js/sch/kendo.all.min.js' />"></script>--%>

<script src="<c:url value='/resources/js/cultures/kendo.culture.fa-IR.js' />"></script>
<%--<script src="<c:url value='/resources/js/jquery.ui.datepicker.fa.js' />"></script>--%>
<script src="<c:url value='/resources/alterify/js/alertify.js' />"></script>
<script src="<c:url value='/resources/uikit/js/uikit.min.js' />"></script>
<script src="<c:url value='/resources/jquery.deserialize.js' />"></script>
<script src="<c:url value='/resources/js/jquery.sticky.js' />"></script>
<script src="<c:url value='/resources/js/jquery.alphanum.js' />"></script>
<script src="<c:url value='/resources/chosen/chosen.jquery.min.js' />"></script>
<script src="<c:url value='/resources/common.js' />"></script>
<script src="<c:url value='/resources/js/lou-multi-select/jquery.multi-select.js' />"></script>
<script src="<c:url value='/resources/js/listjs/list.js' />"></script>
<link href="<c:url value='/resources/persianDatepicker-master/css/persianDatepicker-default.css'/>" rel="stylesheet" />
<script src="<c:url value='/resources/persianDatepicker-master/js/persianDatepicker.js'/>"></script>
<script src="<c:url value='/resources/js/nicEdit/nicEdit.js' />"></script>
</head>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
    String contextPath=request.getContextPath();
%>
 
<c:set var="createUrl" value="<%=createUrl %>" />

<script type="text/javascript">
	var basePath = "${basePath}";
	
</script>

<c:if test="${bindToEntity}">
	<script type="text/javascript">
		var bindToEntity = ${bindToEntity};
		var entityId = "${entityId}";
	</script>
 </c:if>


<body dir="rtl">
	<div id="header">
		<div class="k-rtl">
		</div>
	</div>
	<div id="body">
		<table  id="body-table" height="100%" width="100%" >
			<tr height="100%" width="100%">
				<td id="body-side-left"  height="100%" width="100%">
                   
                    <div id="body-content" style="height: 100%;">
						<tiles:insertAttribute name="body" />
					</div>
				</td>
			</tr>
		</table>	
	</div>
	
	<script>
		$(document).ready(function() {
		    function setHeights(){
		    	var winHeight = $(window).height() - $("#header").height();
		    	$("body").css("height", winHeight);
			  	//$("#body-content").css("height", winHeight - $(".body-header").height() - 20);
		    }
		    
		    $(window).resize(function() {
				setHeights();
			});
		   	setHeights();
		   	
		    //$("#menu").sticky({topSpacing:0});
		    $("#menu").css("min-width", $("#menu").width());
		    $("#menu").css("z-index", 99999);
		    
		    //$(".body-header").sticky({topSpacing:35});
		    //$(".body-header").css("min-width", $(".body-header").width());
		    //$(".body-header").css("z-index", 2);
		    
		    $("#body-heade-create").click(function(){
                if(typeof(customFormSave) === "function"){
                    customFormSave();
                     return;
                }
                window.location.href = "${createUrl}";
            });

		    if(window.location.href.indexOf("/create") == window.location.href.length - "/create".length){
		    	createMode();
		    	$.getJSON(basePath + '/reset/' + 0, function(data) {
				$('#mainForm').deserialize(data);
                if(typeof(callback_deserialize) == "function"){
                    callback_deserialize(data);
                }
			});
		    }

		    if(window.location.href.indexOf("/editWP/")  > 0){
		    	editWPMode();
		    }

		    if(window.location.href.indexOf("/edit/")  > 0){
		    	editMode();
		    }
		    
		    
//		    $("input[type='number']").numeric();
		    
		    
		    $("#body-heade-save").click(function(){
		         save();
             });



			$("#body-heade-saveAndClose").click(function(){

		    	if(typeof(customFormSave) === "function"){
		    		customFormSave();
		    		return;
		    	}
		    	var form = $("#mainForm");
				var tmp = {};
				$("input[role='combobox']").attr("disabled", "disabled");
				$("input[data-ignore='true']").attr("disabled", "disabled");
                checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                        function() {
                            if(this.name!=""){
                                return {"name": this.name, "value": false}
                            }
                        }).get();

                $("input[data-role='timepicker']").removeAttr("disabled");
                $(form.serializeArray()).each(function(){
//                    if(this.name=="date")
//                        this.value=1;
                    if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                        if($("input[name='"+this.name+"']").val()=='on'){
                            tmp[this.name]='true';
                        }else{
                            tmp[this.name]='false';
                        }
                    }else{
                        tmp[this.name] = this.value;
                    }
                });
                for(var i=0;i<checkBoxUncheck.length;i++){
                    tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
                }
				$("input[data-ignore='true']").removeAttr("disabled");
				$("input[role='combobox']").removeAttr("disabled");
				//$("input[role='datepicker']").removeAttr("disabled");
                if(typeof(callback_afterSerialize) == "function"){
                    tmp=callback_afterSerialize(tmp);
                }
                if(typeof(callback_validation_before_save) == "function"){
                    validationState=callback_validation_before_save(tmp);
                    if(validationState==false){
                       return;
                    }
                }
                $("#body-heade-saveAndClose").attr("disabled", "disabled");
		    	jQuery.ajax ({
				    url: getBaseUrl() + "save",
				    type: "POST",
				    data: JSON.stringify(tmp),
				    dataType: "json",
				    contentType: "application/json; charset=utf-8",
				    success: function(result){
                        $("#body-heade-saveAndClose").removeAttr("disabled");
				        if(result.state == "error"){
				        	for(var i=0; i<result.errors.length; i++){
                                if($("label[for='"+ result.errors[i].Field + "']").text().length>0){
                                    alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
                                }else{
                                    alertify.error( result.errors[i].Field + ":  " +  result.errors[i].Message);
                                }
				        	}
				        }
				        if(result.state == "success"){
			        		//alertify.success(result.message);
			        		//document.getElementById("loadedId").value=result.baseObjectId;
                            if (document.getElementById("loadedId") != null) {
                                document.getElementById("loadedId").value = result.baseObjectId;
                                document.getElementById("id").value = result.baseObjectId;
                            }

                            if(typeof(hasDetailShouldSave) == "function"){
                                var returnValue=hasDetailShouldSave();
                                if(returnValue=="true"){
//                                    global.masterdetail.saveDetail.alert
                                    alertify.error('<%=resource.getString("global.masterdetail.saveDetail.alert")%>');
                                    if(typeof(checkShowHideTabs) === "function"){
                                        checkShowHideTabs();
                                    }
                                    return;
                                }
                                 if(typeof(callback_saveClose) == "function"){
                                        callback_saveClose();

                                    }else{
                                        window.location.href = getBaseUrl();
                                    }
                            }
                            else if(typeof(callback_saveClose) == "function"){
                                callback_saveClose();

                            }else{
                                window.location.href = getBaseUrl();
                            }
				        }
				    },
                    error:function(result){
//                        console.log(result);
                        $("#body-heade-saveAndClose").removeAttr("disabled");
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
				});
		    });

            /////////////////////////////
            $("#body-heade-print").click(function(){
                if(typeof(customFormSave) === "function"){
                    customFormSave();
                    return;
                }
                var form = $("#mainForm");
                var tmp = {};
                $("input[role='combobox']").attr("disabled", "disabled");
                $("input[data-ignore='true']").attr("disabled", "disabled");
                //$("input[role='datepicker']").attr("disabled", "disabled");
                checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                        function() {
                            if(this.name!=""){
                                return {"name": this.name, "value": false}
                            }
                        }).get();
                $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
                    if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                        if($("input[name='"+this.name+"']").val()=='on'){
                            tmp[this.name]='true';
                        }else{
                            tmp[this.name]='false';
                        }
                    }else{
                        tmp[this.name] = this.value;
                    }
                });
                for(var i=0;i<checkBoxUncheck.length;i++){
                    tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
                }
                if(typeof(customSerialize) === "function"){
                    tmp=customSerialize(tmp);
                }


                $("input[data-ignore='true']").removeAttr("disabled");
                $("input[role='combobox']").removeAttr("disabled");
                //$("input[role='datepicker']").removeAttr("disabled");
                jQuery.ajax({
                    url:getBaseUrl() + "print",
                    type:"POST",
                    data:JSON.stringify(tmp),
                    dataType:"json",
                    contentType:"application/json; charset=utf-8",
                    success:function (result) {
                        if (result.state == "error") {
                            for (var i = 0; i < result.errors.length; i++) {
                                if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                    alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                                } else {
                                    alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                                }
                            }
                        }
                        if(result.state == "success"){
                            alertify.success(result.message);
                            if (document.getElementById("loadedId") != null) {
                                document.getElementById("loadedId").value = result.baseObjectId;
                            }
                            document.getElementById("id").value = result.baseObjectId;
                            $.getJSON(basePath + '/reset/', function (data) {
                                $('#mainForm').deserialize(data);
								setNumericTextValue();
                            });
                            //var gridContent = $("#jqxgrid").jqxGrid('exportdata', 'html');
                            var newWindow = window.open('', '', 'width=800, height=500'),
                                    document1 = newWindow.document.open(),
                                    pageContent =
                                            '<!DOCTYPE html>\n' +
                                                    '<html>\n' +
                                                    '<head>\n' +
                                                    '<meta charset="utf-8" />\n' +
                                                    '<title>Behbood</title>\n' +
                                                    '</head>\n' +
                                                    '<body>\n'+result.printMessage +'\n</body>\n</html>';
                            document1.write(pageContent);
                            document1.close();
                            newWindow.print();
                        }

                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
            });

            /////////////////




		    if(window.location.href.indexOf("/editWP/")  > 0){
		    	BindToEntityQueue();
		    }else{
			    var returnBind=BindToEntity();
                if(returnBind==1){
                    afterBind();
                }
			 }

			 //
            fixTextAreas();
		});

        function save(){
            if(typeof(customFormSave) === "function"){
                customFormSave();
                return;
            }
            var form = $("#mainForm");
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            //$("input[role='datepicker']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#mainForm input[type=checkbox]:not(:checked)').map(
                    function() {
                        if(this.name!=""){
                            return {"name": this.name, "value": false}
                        }
                    }).get();
            $("input[data-role='timepicker']").removeAttr("disabled");
            $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
                if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                    if($("input[name='"+this.name+"']").val()=='on'){
                        tmp[this.name]='true';
                    }else{
                        tmp[this.name]='false';
                    }
                }else{
                    tmp[this.name] = this.value;
                }
            });
            
            ////---- This part is for get value from multiSelects -----------
            var getOptionArray = function(options){
            	var arr = [];
            	for(var i=0;i<options.length;i++){
                	arr[i]=options[i].value;
                }
            	return arr;
            };
            $("*[data-role='multiselect']").each(function(){
                  tmp[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
            })
			////---------- END -------------
			
            for(var i=0;i<checkBoxUncheck.length;i++){
                tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
            }

            $("input[data-ignore='true']").removeAttr("disabled");
            $("input[role='combobox']").removeAttr("disabled");
            //$("input[role='datepicker']").removeAttr("disabled");
            if(typeof(callback_afterSerialize) == "function"){
                tmp=callback_afterSerialize(tmp);
            }
            if (typeof(callback_validation_before_save) == "function") {
                validationState = callback_validation_before_save(tmp);
                if (validationState == false) {
                    return;
                }
            }
            //
            $("#body-heade-save").attr("disabled", "disabled");
            jQuery.ajax({
                url:getBaseUrl() + "save",
                type:"POST",
                data:JSON.stringify(tmp),
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:function (result) {
                    $("#body-heade-save").removeAttr("disabled");
                    if (result.state == "error") {
                        for (var i = 0; i < result.errors.length; i++) {
                            if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                            } else {
                                alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                            }
                        }
                        if(typeof(callback_save_error) == "function"){
                        	callback_save_error(result);
                        }
                    }
                    if (result.state == "success") {
                        alertify.success(result.message);
                        if (document.getElementById("loadedId") != null) {
                            document.getElementById("loadedId").value = result.baseObjectId;
                        }
                        document.getElementById("id").value = result.baseObjectId;
                        if(typeof(callResetAfterSaveMaster) === "function"){
                        }else{
	                        $.getJSON(basePath + '/reset/', function (data) {
	                            if(typeof(callback_deserialize) == "function"){
	                                callback_deserialize(data);
	                            }
	                            $('#mainForm').deserialize(data);
								setNumericTextValue();
	                            var comboOnFormArray=$( "input[id$='_Comb']" );
	                            if(comboOnFormArray.length>0){
	                                for(var i=0;i<comboOnFormArray.length;i++){
	                                    var combo=$( "input[id$='_Comb']" )[i].id;
	                                    var comboKendo=$("#"+combo).data("kendoComboBox");
	                                    if(comboKendo!=undefined){
	                                        comboKendo.dataSource._filter=undefined;
	                                    }
	                                }
	                            }
	                        });
                        }
			            if(typeof(checkShowHideTabs) === "function"){
			                checkShowHideTabs();
			            }
                        if(typeof(callback_save_success) == "function"){
                            callback_save_success(result);
                        }
                    }
                },
                error:function(result){
                    $("#body-heade-save").removeAttr("disabled");
                    if(result.status==401){
                        window.location.href="";
                    }
                }
            });
        }

        function serializeFromFormId(formId){
            var form = $("form", $("#" + formId));
            if(form.length==0){
                form=$("#" + formId);
            }
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            //$("input[role='datepicker']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#'+formId+' input[type=checkbox]:not(:checked)').map(
                    function() {
                        if(this.name!=""){
                            return {"name": this.name, "value": false}
                        }
                    }).get();
            $("input[data-role='timepicker']").removeAttr("disabled");
            $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
                if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                    if($("input[name='"+this.name+"']")[0].checked){
                        tmp[this.name]='true';
                    }else{
                        tmp[this.name]='false';
                    }
                }else{
                    tmp[this.name] = this.value;
                }
            });
            for(var i=0;i<checkBoxUncheck.length;i++){
                tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
            }


            $("input[data-ignore='true']").removeAttr("disabled");
            $("input[role='combobox']").removeAttr("disabled");
            //$("input[role='datepicker']").removeAttr("disabled");
            if(typeof(callback_afterSerialize) == "function"){
                tmp=callback_afterSerialize(tmp);
            }
            return tmp;
        }

        function saveFormUrl(formId,saveUrl,doneReset,resetUrl){
            if(typeof(customFormSave) === "function"){
                customFormSave();
                return;
            }
            var form = $("form", $("#" + formId));
            if(form.length==0){
                form=$("#" + formId);
            }
            var tmp = {};
            $("input[role='combobox']").attr("disabled", "disabled");
            $("input[data-ignore='true']").attr("disabled", "disabled");
            //$("input[role='datepicker']").attr("disabled", "disabled");
            checkBoxUncheck=jQuery('#'+formId+' input[type=checkbox]:not(:checked)').map(
                    function() {
                        if(this.name!=""){
                            return {"name": this.name, "value": false}
                        }
                    }).get();
            $(form.serializeArray()).each(function(){
//					if(this.name=="date")
//						this.value=1;
                if($("input[name='"+this.name+"']").attr('type')=='checkbox'){
                    if($("input[name='"+this.name+"']").val()=='on'){
                        tmp[this.name]='true';
                    }else{
                        tmp[this.name]='false';
                    }
                }else{
                    tmp[this.name] = this.value;
                }
            });
            for(var i=0;i<checkBoxUncheck.length;i++){
                tmp[checkBoxUncheck[i].name]=checkBoxUncheck[i].value;
            }


            $("input[data-ignore='true']").removeAttr("disabled");
            $("input[role='combobox']").removeAttr("disabled");
            //$("input[role='datepicker']").removeAttr("disabled");
            if(typeof(callback_afterSerialize) == "function"){
                tmp=callback_afterSerialize(tmp);
            }
            if(typeof(callback_validation_before_save) == "function"){
                    validationState=callback_validation_before_save(tmp);
                    if(validationState==false){
                       return;
                    }
            }
            jQuery.ajax({
                url:saveUrl ,
                type:"POST",
                data:JSON.stringify(tmp),
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:function (result) {
                    if (result.state == "error") {
                        for (var i = 0; i < result.errors.length; i++) {
                            if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
                                alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                            } else {
                                alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);

                            }
                        }
                    }
                    if (result.state == "success") {
                        alertify.success(result.message);
                        if (document.getElementById("loadedId") != null) {
                            document.getElementById("loadedId").value = result.baseObjectId;
                        }
                        if(document.getElementById("id")!=null){
                        	document.getElementById("id").value = result.baseObjectId;
                        }
                        if(doneReset!=undefined && doneReset){
                            var localResetUrl=basePath + '/reset/';
                            if(resetUrl!=undefined){
                                localResetUrl=resetUrl;
                            }
	                        $.getJSON(localResetUrl, function (data) {
	                            if(typeof(callback_deserialize) == "function"){
	                                callback_deserialize(data);
	                            }
	                            $("#"+formId).deserialize(data);
								setNumericTextValue();
	                            var comboOnFormArray=$( "input[id$='_Comb']" );
	                            if(comboOnFormArray.length>0){
	                                for(var i=0;i<comboOnFormArray.length;i++){
	                                    var combo=$( "input[id$='_Comb']" )[i].id;
	                                    var comboKendo=$("#"+combo).data("kendoComboBox");
	                                    if(comboKendo!=undefined){
	                                        comboKendo.dataSource._filter=undefined;
	                                    }
	                                }
	                            }
	                            
	                        });
                        }
                        if(typeof(window["doAfterSave_"+formId])=== "function"){
                                window["doAfterSave_"+formId]();
                            }
                        if(typeof(checkShowHideTabs) === "function"){
                            checkShowHideTabs();
                        }
                        if(typeof(callback_save_success) == "function"){
                            callback_save_success(result);
                        }
                    }
                },
                error:function(result){
                    if(result.status==401){
                        window.location.href="";
                    }
                }
            });
        }
        
        var tailEndUrl = "";
        function setTailEndUrl(path){
        	tailEndUrl = path;
        	basePath = basePath + path;
        }

		function getBaseUrl(){
			/*var p = window.location.href.indexOf("/create");
			if( p < 0 )
				p = window.location.href.indexOf("/edit/");
			if( p < 0 )
				p = window.location.href.indexOf("/editWP/");
			if( p < 0 ){
                p = window.location.href.indexOf("/search");
			}if( p < 0 ){
                return "";
            }
			return window.location.href.substr(0, p + 1);*/
			var baseUrl = '<%= request.getAttribute("controllerBasePath")%>' ;
			if(baseUrl.substring(baseUrl.length-1,baseUrl.length)!='/'){
				baseUrl = baseUrl + '/';
			}
			//baseUrl = baseUrl + tailEndUrl;
			return baseUrl;
		}
		
		function createMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
//	    	$("#breadcrumb-main-section-cancel").attr("href", getBaseUrl());
            cancel();


	    	$("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.new")%></span></li>');
	    	$("#body-heade-create").hide();
	    	$("#body-heade-save-div").show();
            var arra=Object.keys(window);
            for (var i = 0; i < arra.length; i++){
                if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                    window[arra[i]]();
                }
            }
            //
            fixTextAreas();
		}

		function editMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);

            <%--$("#breadcrumb-main-section-cancel").attr("href", '<%= request.getHeader("referer")%>');--%>
            cancel();
	    	$("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
	    	$("#body-heade-create").hide();
	    	$("#body-heade-save-div").show();
		}
		
		function editWPMode(){
			var backUrl = getBaseUrl();
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
//	    	$("#breadcrumb-main-section-cancel").attr("href",  getBaseUrl());
            <%--$("#breadcrumb-main-section-cancel").attr("href", '<%= request.getHeader("referer")%>');--%>
            cancel();
	    	$("#breadcrumb").append('<li id="breadcrumb-action" class="uk-active"><span><%=resource.getString("global.crud.save")%></span></li>');
	    	$("#body-heade-create").hide();
	    	$("#body-heade-save-div").show();
		}
		
		
		function onSelect(e){
			var elem =$(".menu-action", e.item);
			var ctrl = elem.attr("data-ctrl");
			var action = elem.attr("data-action");
			window.location.href = "${pageContext.request.contextPath}/" + action;
			//console.log($(e.item));
		}
		
		
		
		function BindToEntityQueue(){
			if(typeof(bindToEntity) == "undefined" || !bindToEntity) {
				return;
			}
			if(typeof(customFormLoad) === "function"){
	    		customFormLoadQueue();
	    		return;
		    }
			
			bindToEntityByIdQueue(entityId);
		}
		
		function BindToEntity(){
			if(typeof(bindToEntity) == "undefined" || !bindToEntity) 
				return 1;
			
			if(typeof(customFormLoad) === "function"){
	    		customFormLoad();
	    		return;
		    }
			
			bindToEntityById(entityId);
		}
		function bindToEntityById(Id){
			$.getJSON(getBaseUrl() + tailEndUrl + '/load/' + Id, function(data) {
                jQuery.each(data, function(name, val){
                    var $el = $('[name="'+name+'"]'),
                            type = $el.attr('type');

                    switch(type){
                        case 'checkbox':
                            $el.prop('checked', val);
                            break;
                        case 'radio':
                            $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                            break;
                        default:
                            $el.val(val);
                    }
                });
                $('#mainForm').deserialize(data);
				//
                setNumericTextValue();
                //
                fixTextAreas();
				//
                if(typeof(callback_deserialize) == "function"){
                    callback_deserialize(data);
                }
                var arra=Object.keys(window);
                for (var i = 0; i < arra.length; i++){
                    if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                        window[arra[i]]();
                    }
                }
	            if(typeof(checkShowHideTabs) === "function"){
	                checkShowHideTabs();
	            }
			});
		}

        function bindToEntityByIdFormIdUrl(Id,formId,loadUrl){
			bindToEntityByRequestType(Id,formId,loadUrl,"GET");
		}

		function bindToEntityByRequestType(Id,formId,loadUrl,requestType){
			var form = $("form", $("#" + formId));
			if(form.length==0){
				form=$("#" + formId);
			}
			if (requestType == "GET") {
				$.getJSON(loadUrl+'' + Id, function(data) {
					jQuery.each(data, function(name, val){
						if(name=="id")
							return;
						var $el = $('#'+formId+' [name="'+name+'"]'),
								type = $el.attr('type');

						switch(type){
							case 'checkbox':
								$el.prop('checked', val);
								break;
							case 'radio':
								$el.filter('[value="'+val+'"]').attr('checked', 'checked');
								break;
							default:
								$el.val(val);
						}
					});
					form.deserialize(data);
					setNumericTextValue();
					if(typeof(callback_deserialize) == "function"){
						callback_deserialize(data);
					}
					var arra=Object.keys(window);
					for (var i = 0; i < arra.length; i++){
						if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
							window[arra[i]]();
						}
					}
					if(typeof(checkShowHideTabs) === "function"){
						checkShowHideTabs();
					}
				});
			} else if (requestType == "POST") {
                $.ajax({
                    url:loadUrl,
                    type:'POST',
                    data:{'id': Id },
                    success:function (data, success, xhr) {
                        jQuery.each(data, function(name, val){
                            if(name=="id")
                                return;
                            var $el = $('#'+formId+' [name="'+name+'"]'),
                                    type = $el.attr('type');

                            switch(type){
                                case 'checkbox':
                                    $el.prop('checked', val);
                                    break;
                                case 'radio':
                                    $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                                    break;
                                default:
                                    $el.val(val);
                            }
                        });
                        form.deserialize(data);
                        setNumericTextValue();
                        if(typeof(callback_deserialize) == "function"){
                            callback_deserialize(data);
                        }
                        var arra=Object.keys(window);
                        for (var i = 0; i < arra.length; i++){
                            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                                window[arra[i]]();
                            }
                        }
                        if(typeof(checkShowHideTabs) === "function"){
                            checkShowHideTabs();
                        }
                    }
                });
			}
		}
		
		function bindToEntityByIdQueue(Id){
		var newPath=basePath.replace('editWP','loadWP');
			$.getJSON(newPath , function(data) {
                jQuery.each(data, function(name, val){
                    var $el = $('[name="'+name+'"]'),
                            type = $el.attr('type');

                    switch(type){
                        case 'checkbox':
                            $el.prop('checked', val);
                            break;
                        case 'radio':
                            $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                            break;
                        default:
                            $el.val(val);
                    }
                });
				$('#mainForm').deserialize(data);
				setNumericTextValue();
                var arra=Object.keys(window);
                for (var i = 0; i < arra.length; i++){
                    if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                        window[arra[i]]();
                    }
                }
//                if(typeof(window['bindToEntityById_after']) === "function" ){
//                    window['bindToEntityById_after']();
//                }
			});
		}
    function errorRequestAjax(e){
        if(e.errorThrown=="Unauthorized"){
            window.location.href = "";
        }
    }

    function afterBind(){
        var arra=Object.keys(window);
        for (var i = 0; i < arra.length; i++){
            if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                window[arra[i]]();
            }
        }
    }

    function cancel(){
        var cancel='<%= request.getHeader("referer")%>';
        var contextPath='${pageContext.request.contextPath}';
        if(cancel.length==cancel.indexOf(contextPath+'/')+(contextPath+'/').length){
            $("#breadcrumb-main-section-cancel").attr("href",getBaseUrl());

        }else{
            $("#breadcrumb-main-section-cancel").attr("href", '<%= request.getHeader("referer")%>');
        }
    }
		
	</script>
<SCRIPT language="JavaScript" type="text/javascript">


var grgSumOfDays=Array(Array(0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365),Array(0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366));
var hshSumOfDays=Array(Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 365), Array(0, 31, 62, 93, 124, 155, 186, 216, 246, 276, 306, 336, 366));

function ToShamsi(grgYear,grgMonth,grgDay,Format)
{
	var hshYear = grgYear-621;
	var hshMonth,hshDay;
	
	var grgLeap=grgIsLeap (grgYear);
	var hshLeap=hshIsLeap (hshYear-1);
	
	var hshElapsed;
	var grgElapsed = grgSumOfDays[(grgLeap ? 1:0)][grgMonth-1]+grgDay;

	var XmasToNorooz = (hshLeap && grgLeap) ? 80 : 79;

	if (grgElapsed <= XmasToNorooz)
	{
		hshElapsed = grgElapsed+286;
		hshYear--;
		if (hshLeap && !grgLeap)
			hshElapsed++;
	}
	else
	{
		hshElapsed = grgElapsed - XmasToNorooz;
		hshLeap = hshIsLeap (hshYear);
	}

	for (var i=1; i <= 12 ; i++)
	{
		if (hshSumOfDays [(hshLeap ? 1:0)][i] >= hshElapsed)
		{
			hshMonth = i;
			hshDay = hshElapsed - hshSumOfDays [(hshLeap ? 1:0)][i-1];
			break;
		}
	}


	if (Format=="Long")
		return hshDayName (hshDayOfWeek(hshYear,hshMonth,hshDay)) + "  " + hshDay + " " + calNames("hf", hshMonth-1) + " " + hshYear;
	else
		return hshYear + " /" + hshMonth + " /" + hshDay;
}


function ToGregorian (hshYear,hshMonth,hshDay)
{
	var grgYear = hshYear+621;
	var grgMonth,grgDay;

	var hshLeap=hshIsLeap (hshYear);
	var grgLeap=grgIsLeap (grgYear);

	var hshElapsed=hshSumOfDays [hshLeap ? 1:0][hshMonth-1]+hshDay;
	var grgElapsed;

	if (hshMonth > 10 || (hshMonth == 10 && hshElapsed > 286+(grgLeap ? 1:0)))
	{
		grgElapsed = hshElapsed - (286 + (grgLeap ? 1:0));
		grgLeap = grgIsLeap (++grgYear);
	}
	else
	{
		hshLeap = hshIsLeap (hshYear-1);
		grgElapsed = hshElapsed + 79 + (hshLeap ? 1:0) - (grgIsLeap(grgYear-1) ? 1:0);
	}

	for (var i=1; i <= 12; i++)
	{
		if (grgSumOfDays [grgLeap ? 1:0][i] >= grgElapsed)
		{
			grgMonth = i;
			grgDay = grgElapsed - grgSumOfDays [grgLeap ? 1:0][i-1];
			break;
		}
	}

	return grgYear+"-"+grgMonth+"-"+grgDay;
}

function grgIsLeap (Year)
{
	return ((Year%4) == 0 && ((Year%100) != 0 || (Year%400) == 0));
}

function hshIsLeap (Year)
{
	Year = (Year - 474) % 128;
	Year = ((Year >= 30) ? 0 : 29) + Year;
	Year = Year - Math.floor(Year/33) - 1;
	return ((Year % 4) == 0);
}


function hshDayOfWeek(hshYear, hshMonth, hshDay)
{
	var value;
	value = hshYear - 1376 + hshSumOfDays[0][hshMonth-1] + hshDay - 1;

	for (var i=1380; i<hshYear; i++)
		if (hshIsLeap(i)) value++;
	for (var i=hshYear; i<1380; i++)
		if (hshIsLeap(i)) value--;

	value=value%7;
	if (value<0) value=value+7;

	return (value);
}

function hshDayName(DayOfWeek)
{
	return calNames("df", DayOfWeek%7);
}

 function calNames(calendarName, monthNo)
 {
  switch (calendarName)
 {
   case "hf": return Array("فروردين", "ارديبهشت", "خرداد", "تير", "مرداد", "شهريور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند")[monthNo];
   case "ge": return Array(" January ", " February ", " March ", " April ", " May ", " June ", " July ", " August ", " September ", " October ", " November ", " December ")[monthNo];
   case "gf": return Array("ژانویه", "فوریه", "مارس", "آوریل", "مه", "ژوثن", "ژوییه", "اوت", "سپتامبر", "اكتبر", "نوامبر", "دسامبر")[monthNo];
   case "df": return Array("شنبه", "یک‌شنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه")[monthNo];
   case "de": return Array("Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday")[monthNo];
   }
  }
</SCRIPT>
<SCRIPT language="JavaScript" type="text/javascript">

/*
Hijri Shamsi (Khayyami)/Gregorian sub-labels calendar
Version 1.1

charset=utf-8

simorgh.ws
*/


function UpdateCalendar(targetId, gregorianMonths, year, month)
{
	var newRow, newCell;
	var currentDay=1;
	var holidays=getHolidays(year, month);
	var lastDay=31;
	var dtToday=new Date();
	var strToday=dtToday.getFullYear()+"-"+(dtToday.getMonth()+1)+"-"+dtToday.getDate();

	if (month>6) lastDay--;
	if (month==12 && !hshIsLeap(year)) lastDay--;


	while (targetId.rows.length>0) targetId.deleteRow(0);


	newRow=targetId.insertRow(0);
	for (var i=0; i<hshDayOfWeek(year,month,1); i++) newRow.insertCell(-1).innerHTML=" ";
	for (var i=hshDayOfWeek(year,month,1); i<7; i++) {
		newCell=newRow.insertCell(-1);
		newCell.className="normalDay";
		newCell.innerHTML="<p class=ShamsiDayNo>" + currentDay + "</p><p dir=ltr class=GregorianDayNo>" + ToGregorian(year,month,currentDay).split("-")[2];
		if (holidays.substr(currentDay-1,1)=="x") newCell.className="Holiday";
		if (ToGregorian(year, month, currentDay)==strToday) newCell.className="Today";
		currentDay++;
		}

	while (currentDay<=lastDay) {
		newRow=targetId.insertRow(-1);
		for (var i=0; i<7; i++) {
			newCell=newRow.insertCell(-1);
			newCell.innerHTML="<p class=ShamsiDayNo>" + currentDay + "</p><p dir=ltr class=GregorianDayNo>" + ToGregorian(year,month,currentDay).split("-")[2];
			newCell.className="normalDay";
			if (holidays.substr(currentDay-1,1)=="x") newCell.className="Holiday";
			if (ToGregorian(year, month, currentDay)==strToday) newCell.className="Today";
			currentDay++;
			if (currentDay>lastDay) break;
			}
		}
	for (var i=newRow.cells.length; i<7; i++) newRow.insertCell(-1).innerHTML=" ";

	if (gregorianMonths != null) {
		gregorianMonths.getElementsByTagName('p')[0].innerHTML=calNames("ge", ToGregorian (year,month,1).split("-")[1]-1)+" "+(ToGregorian (year,month,1).split("-")[0])+" - "+calNames("ge", ToGregorian (year,month,30).split("-")[1]-1)+" "+ToGregorian (year,month,30).split("-")[0];
		gregorianMonths.getElementsByTagName('p')[1].innerHTML=calNames("gf", ToGregorian (year,month,1).split("-")[1]-1)+" "+(ToGregorian (year,month,1).split("-")[0])+" - "+calNames("gf", ToGregorian (year,month,30).split("-")[1]-1)+" "+ToGregorian (year,month,30).split("-")[0];
		}
}

function FillSelectWithMonthNames(targetId)
{
	for (var i=0; i<12; i++) {
		var mitem = document.createElement("OPTION");
		mitem.value=i+1;
		mitem.text=calNames("hf", i);
		targetId.options.add(mitem);
		}
}

function getHolidays(year, month)
{
 switch (year) {
  case 1380: return Array("xxxx56789x1xx4xxx890123x567890x", "123456x890123x567890x234567x901", "x2xx567890x23xx67x9x1234x678901", "x234567x901234x678901x345678x01", "1234x678901x345678x012345x78901", "xx345678x012345x789012x456789x1", "12345x78x012x456789x12x456x890", "123x56789xx234567x901234x67890", "1x345678x012345x789012x45x789x", "123456x890123x56789xx234567x90", "1234x678901x345678x01x345x7890", "12xx56789x1x3456x890123x5678x")[month-1];
  case 1381: return Array("xxxxx678x01xx45x789012x456789x1", "12345x789012x456789xx2x456x8901", "12x45678xx123xx6x890123x567890x", "123456x890123x567890x234567x901", "123x567890x234567x90x234x678901", "x234567x901234x678901x345678xx1", "1234x678901xx45678x012345x789x", "12x456789x123456x890123x567890", "x234x67x901234x678901x345678x0", "12345x78x012x456789x123456x890", "123x567890x234567x901xx4x67890", "xx345678x012345x78901xx45678x")[month-1];
  case 1382: return Array("xxxx567x901xx4x678901x345678x01", "12x4x67890xx345678x012345x78x01", "1x345678x0123xxx789012x456789x1", "12345x789012x456789x123456x8901", "12x456789xx23456x890123x567890x", "123456x890123x5678x0x234567x901", "1x3x567890x234567x9x1234x67890", "1x345678x012345x789012x4x6789x", "1234x6x890123x567890x234567xx0", "1234x678901x345678x012345x7890", "12x456789x12x456x890xx3x567890", "x234567x90xx34x678901x345678x")[month-1];
  case 1383: return Array("xxxx56x8901xxx567890x234567x901", "123x567890x234567x901234x678901", "x234567x90123xx678901x345678x01", "1234x678901x345678x012345x78901", "1x345678x012345x789012x456789x1", "12345x789012x456789x123456x8901", "12x456789x123456x890123x567890", "x234567x901234x678901x345678x0", "12345x789012x456789x123456x890", "123x567890x234567x901234x67890", "1x345678x012345x78901xx456789x", "123456x890123x567890x234567xx0")[month-1];
  }
}

				</SCRIPT>
				<SCRIPT language="JavaScript" type="text/javascript">
 function switchCalendar()
 {
  var frm = document.getElementById("convert");
  var today = new Date();

  while (frm.year.options.length<100) frm.year.options.add(document.createElement("OPTION"));

  while (frm.month.options.length<12) {
   var newMonth = document.createElement("OPTION");
   newMonth.value=frm.month.options.length+1;
   frm.month.options.add(newMonth);
   }

  while (frm.day.options.length<31) {
   var newDay = document.createElement("OPTION");
   newDay.value=frm.day.options.length+1;
   newDay.text=frm.day.options.length+1;
   frm.day.options.add(newDay);
   }

  if (frm.calendar[0].checked) {
   for (var i=0; i<100; i++) {
    frm.year.options[i].text=i+1300;
    frm.year.options[i].value=i+1300;
    }

   for (var i=0; i<12; i++) frm.month.options[i].text = calNames("hf", i);

   var shToday = ToShamsi(today.getFullYear(), today.getMonth()+1, today.getDate(),'short');
   frm.year.value=Number(shToday.split('/')[0]);
   frm.month.value=Number(shToday.split('/')[1]);
   frm.day.value=Number(shToday.split('/')[2]);
   }
  else {
   for (var i=0; i<100; i++) {
    frm.year.options[i].text=i+1930;
    frm.year.options[i].value=i+1930;
    }

   for (var i=0; i<12; i++) frm.month.options[i].text = calNames("ge", i);

   frm.year.value=today.getFullYear();
   frm.month.value=today.getMonth()+1;
   frm.day.value=today.getDate();
   }

  convertDate();
  }


 function convertDate() {
  frm = document.getElementById("convert");

  if (frm.calendar[0].checked) {
   var grg=ToGregorian(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value));
   document.getElementById("resultDate").innerHTML = calNames("df", hshDayOfWeek(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value)))+" "+grg.split("-")[2]+" "+calNames("gf", grg.split("-")[1]-1)+" ("+grg.split("-")[1]+") "+grg.split("-")[0];
   document.getElementById("resultDate").innerHTML += "<br><font face='tahoma' size=3>"+calNames("de",hshDayOfWeek(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value)))+", "+calNames("ge", grg.split("-")[1]-1)+" "+grg.split("-")[2]+", "+grg.split("-")[0]+"</font>";
   }
  else {
   var hsh=ToShamsi(parseInt(frm.year.value), parseInt(frm.month.value), parseInt(frm.day.value), "Long");
   document.getElementById("resultDate").innerHTML=hsh;
   }
  }
  
function reloadMaster(){
	var Id = $("#loadedId").val();
	$.getJSON(getBaseUrl() + tailEndUrl + '/load/' + Id, function(data) {
              jQuery.each(data, function(name, val){
                  var $el = $('[name="'+name+'"]'),
                          type = $el.attr('type');

                  switch(type){
                      case 'checkbox':
                          $el.prop('checked', val);
                          break;
                      case 'radio':
                          $el.filter('[value="'+val+'"]').attr('checked', 'checked');
                          break;
                      default:
                          $el.val(val);
                  }
              });
              $('#mainForm').deserialize(data);
			  setNumericTextValue();
              if(typeof(callback_deserialize) == "function"){
                  callback_deserialize(data);
              }
              var arra=Object.keys(window);
              for (var i = 0; i < arra.length; i++){
                  if (typeof(window[arra[i]]) === "function" && arra[i].indexOf('bindToEntityById_after')>-1){
                      window[arra[i]]();
                  }
              }
           if(typeof(checkShowHideTabs) === "function"){
               checkShowHideTabs();
           }
	});
}
function addCommaSeparator(nStr){
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1)) {
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2; 
}
function setNumericTextValue(){
    var numericObj = $("input[data-numericEx='true']");
    for (var i=0 ; i < numericObj.length ; i++){
    	var fieldName = numericObj[i].id.replace('_txt','');
    	var fieldName_txt = numericObj[i].id;
    	$("#"+fieldName_txt).val(addCommaSeparator($("#"+fieldName).val()));
    }
}

//for reset page
function reload(){
	window.location = getBaseUrl() + 'create';
}

function ajax_new_reload(){
 		$.getJSON(getBaseUrl() + 'reset', function(data) {
				$('#mainForm').deserialize(data);
				if(typeof(restPageClientSide)=="function"){
					restPageClientSide();
				}
                if(typeof(resetTabs)=="function"){
                    resetTabs();
				}
		});
}

   function roundBaseOnInt(number,base){
       if(number%base==0){
           return number
       }
       var dRound=Math.round(number);

       var basSize=base.toString().length;
       var middle=base/2;

       var multiTen=10;
       for(var i=1;i<basSize;i++){
           multiTen=multiTen*10;
       }
       var highValue =parseInt( dRound / multiTen);
       var low=highValue*multiTen;
       var i=0;
       while (!(low<dRound &&(low+middle)>dRound)){
           low+=middle;
           i++;
       }
       if(i%2==0){
           return low;
       }else {
           return low+middle;
       }
   }

 function roundWithDeductMoney(number,base){
     if(number<base){
         return  number;
     }

     var baseString=base.toString();
     var numberString=number.toString();
     if(numberString.indexOf('.')>-1){
         longPartNumber = numberString.substring(0, numberString.indexOf('.'));
         return parseInt(longPartNumber.substring(0,longPartNumber.length-baseString.length+1))*base;
     }else {
         return parseInt(numberString.substring(0,numberString.length-baseString.length+1))*base;

     }

 }

 function fixTextAreas() {
     for (var i = 0 ; i < $("textarea").length ; i++) {
         $($("textarea")[i]).val($($("textarea")[i]).val().trim());
     }
 }
</SCRIPT>

</body>
</html>
