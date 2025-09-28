
<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<button class="uk-button uk-button-success" id="body-heade-create"
			type="button">
			<%=resource.getString("global.crud.new")%>
		</button>
		<div id="body-heade-save-div" style="display:none;">
			<button class="uk-button uk-button-success" id="body-heade-save"
				type="button">
				<%=resource.getString("global.crud.save")%>
			</button>
			
			<button class="uk-button uk-button-success" id="body-heade-mySaveAndClose"
				type="button">
				<%=resource.getString("global.crud.saveAndClose")%>
			</button>
			
			
			/ <a href="" id="breadcrumb-main-section-visitQueueInputCancel"><%=resource.getString("global.crud.cancel")%></a>
		</div>
	</div>
</div>

<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="patient_id" name="patient_id" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="visitDate" name="visitDate" >

		<div class="uk-grid uk-grid-preserve">
<%--			<base:suggest name="doctor_id" --%>
<%--						  key="his.patient.doctorName" --%>
<%--						  suggestLoaderController="suggest/loadAllDoctor"--%>
<%--						  fieldNames="id"--%>
<%--						  tagNames="doctor_id"/>--%>
			<base:comboBox styleClass="small" name="doctor_id" style="" value="doctorName" key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor"></base:comboBox>
            <base:comboBox styleClass="small" name="cashType" key="his.patient.cashType" comboLoaderUrl="combo/allCashType" isMandatory="true"/>
			<base:testBox styleClass="small" name="filenumber" key="his.patient.fileCode" disabled="true" />
		</div>
	
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="firstname" key="clinic.patient.firstName" disabled="true" />
			<base:testBox styleClass="small" name="lastname" key="clinic.patient.lastName" disabled="true" />
		</div>

	</form>
</div>


<script language="JavaScript" type="text/javascript">
$(document).ready(function() {

	var reqParam='<%= request.getAttribute("comeFromPage")%>';
	var backUrl ="";
		if(reqParam=="parientrPage")
		{
			backUrl = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/"
	    	$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
	    	$("#breadcrumb-main-section-visitQueueInputCancel").attr("href", backUrl);
			
			
		}else{
			backUrl = getBaseUrl();
			$("#breadcrumb-main-section").html(
	    		"<a href='" + backUrl + "'>" +
	    		$("#breadcrumb-main-section").html() +
	    		"</a>"
	    		);
	    	$("#breadcrumb-main-section-visitQueueInputCancel").attr("href", backUrl);
		}

	$("#body-heade-mySaveAndClose").click(function(){
		var backUrl="";
		var sReqParam='<%= request.getAttribute("comeFromPage")%>';
		if(sReqParam=="parientrPage")
		{
			backUrl = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/";
			$("#breadcrumb-main-section-visitQueueInputCancel").attr("href", backUrl);
		}else{
			backUrl = getBaseUrl();
			$("#breadcrumb-main-section-visitQueueInputCancel").attr("href", backUrl);
		}
	
		   $(document).ready(function() {
		    	if(typeof(customFormSave) === "function"){
		    		customFormSave();
		    		return;
		    	}
		    	var form = $("#mainForm");
				var tmp = {};
				$("input[role='combobox']").attr("disabled", "disabled");
				$("input[data-ignore='true']").attr("disabled", "disabled");
				//$("input[role='datepicker']").attr("disabled", "disabled");
				$(form.serializeArray()).each(function(){
					if(this.name=="date")
						this.value=1;
					tmp[this.name] = this.value;
				});
				$("input[data-ignore='true']").removeAttr("disabled");
				$("input[role='combobox']").removeAttr("disabled");
				//$("input[role='datepicker']").removeAttr("disabled");
		    	jQuery.ajax ({
				    url: getBaseUrl() + "save",
				    type: "POST",
				    data: JSON.stringify(tmp),
				    dataType: "json",
				    contentType: "application/json; charset=utf-8",
				    success: function(result){
				        if(result.state == "error"){
				        	for(var i=0; i<result.errors.length; i++){
				        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
				        	}
				        }
				        if(result.state == "success"){
			        		window.location.href = backUrl;
				        }
				    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
				});
		    });
	    })
	
	
	 })

    function callback_deserialize(data){
        var referer='<%= request.getHeader("referer")%>';
        console.log("referer:"+referer);
        if(referer.indexOf("visitQueue")>0){
            var comboBox=$("#doctor_id_Comb").data("kendoComboBox");
            comboBox.enable(false);
        }
    }
	 
</script>

