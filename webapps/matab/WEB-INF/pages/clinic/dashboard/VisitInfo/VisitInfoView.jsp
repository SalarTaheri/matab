
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@page import="com.artonis.core.system.authentication.model.Role"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
 %>
 
 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="clinic.patient.visitQueue.refresh" classNames="uk-button uk-button-success" id="visitInfiView-refresh-btn" onClick="javascript:refreshClick()"/>

		<div id="body-heade-save-div" style="display:none;">
			<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-save" />
			<base:aPermission key="global.crud.cancel" classNames="uk-button uk-button-danger" id="breadcrumb-main-section-cancel"></base:aPermission>
		</div>
	</div>
</div>
<% boolean admin=false;
	boolean fnc=false;
	boolean reg=false;
	for(Role role:GlobalVariable.getRoles()){
		if(role.getId()==1)
			admin=true;
		else if(role.getId()==10)
			fnc=true;	
		if(role.getId()==11)
			reg=true;
        pageContext.setAttribute("admin",admin);
        pageContext.setAttribute("fnc",fnc);
        pageContext.setAttribute("reg",reg);
	}

 %>
<%--<%if(admin){ %>--%>

	<base:mehrSys-grid-comboAndDateWithoutButton isPopup="true" name="grid" transportReadUrl="${basePath}/grid-read" categoriesReadUrl="${basePath}/allState" comboCaption="comboCaption" comboId="comboId" modelFieldFilterCombo="state" modelFieldFilterText="searchField" selectable="single" comboLabelCaptionKey="his.patient.visitInfo.stateFilter" hasSearchDate="true" followFunction="evaluteSum" dateFieldName="registerDate">
		<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber"  width="45px"/>
		<base:my-grid-column title='clinic.patient.firstName'  field="firstname" width="30px"/>
		<base:my-grid-column title='clinic.patient.lastName'  field="lastname" width="50px"/>
		<base:my-grid-column title='clinic.cash.doctorCost'  field="doctorCost" width="50px"/>
		<base:my-grid-column title='clinic.cash.discount'  field="discount" width="50px"/>
		<base:my-grid-column title='clinic.cash.returnCost'  field="returnCost" width="50px"/>
		<base:my-grid-column title='clinic.cash.state'  field="stateStr" width="50px"/>
		<base:my-grid-column title='clinic.cash.registerDate'  field="registerDate" width="50px"/>
       
		<base:my-grid-schema-field name="filenumber" type="string" />
		<base:my-grid-schema-field name="firstName" type="string" />
		<base:my-grid-schema-field name="lastname" type="string" />
		<base:my-grid-schema-field name="doctorCost" type="string" />
		<base:my-grid-schema-field name="discount" type="string" />
		<base:my-grid-schema-field name="returnCost" type="string" />
		<base:my-grid-schema-field name="registerDate" type="string" />
		<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit"  name="visit"/>
	</base:mehrSys-grid-comboAndDateWithoutButton>
	<br>
	<br>
	<div class="uk-grid uk-grid-preserve">
		<base:testBox disabled="true" name="doctorCost" styleClass="small" key="clinic.cash.doctorCost"/>
		<base:testBox disabled="true" name="discount" styleClass="small" key="clinic.cash.discount"/>
		<base:testBox disabled="true" name="returnCost" styleClass="small" key="clinic.cash.returnCost"/>
	</div>
<base:footer></base:footer>
<script>

    function grid_onVisit(e){
        var data = this.dataItem($(e.target).closest("tr"));
 		//window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visit/" + data.patient_id;
 		window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/" + data.patient_id+"/"+data.id;//magar state ra pas bedim aga state visit shode bod bere akhari ro load kone;in emkan faghat baraye roze jari vashad vala gheyr
    }
	function evaluteSum(){
			var tmp1 = {};
        	var valueC = $(categories).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueT = $(categoriesId).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueT = $(categoriesId).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueFD = $(fromDate).val(),grid = $("#${name}").data("kendoGrid");
		 	var valueTD = $(toDate).val(),grid = $("#${name}").data("kendoGrid");
		 	var searchFilters=[];
         	if (valueC) {
				tmp1['state']=parseInt(valueC);            	
         	}
         	if (valueT) {
		    	searchFilters.push({ field: "${modelFieldFilterText}", operator: "contains", value: (valueT) });
		    	tmp1['searchField']=(valueT);
	     	}
	     	if (valueFD) {
		    	tmp1['fromDate']=(valueFD);
	     	}
	     	if (valueTD) {
		    	tmp1['toDate']=(valueTD);
	     	}
        
        jQuery.ajax({
                    url:"<c:url value='/' />" +"clinic/dashboard/viditInfo/sum",
                    type:"POST",
                    data:JSON.stringify(tmp1),
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
                            $("#doctorCost").val(result.drCost);
                            $("#discount").val(result.deposit);
                            $("#returnCost").val(result.returnCost);
                        }
                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href=getBaseUrl();
                        }
                    }
        });
     }

	function refreshClick(){
		    	grid = $("#grid").data("kendoGrid");
                            grid.dataSource.query();
	}

    function grid_onMyEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = basePath + "edit/" + data.id;
 		window.location = "${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/edit/" + data.id;
    }
    
    function grid_onVisitPatientEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
 		var tmp = {};
 		tmp['id']=data.id;
 		jQuery.ajax({
                    url:"${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/visit",
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
                            grid = $("#grid").data("kendoGrid");
                            grid.dataSource.query();
                            $.getJSON(basePath + 'reset/', function (data) {
                                $('#mainForm').deserialize(data);
                            });
                        }
                    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
                });
 		
 		
    }
    
$(document).ready(function() {
	evaluteSum();
    
 });
    
</script>
