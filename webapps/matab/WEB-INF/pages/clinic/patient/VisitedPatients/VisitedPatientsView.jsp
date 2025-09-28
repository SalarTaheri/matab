
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
		<button class="uk-button uk-button-success" type="button" onclick="javascript:refreshClick()">
			<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitQueue.refresh")%>
		</button>

		<div id="body-heade-save-div" style="display:none;">
			<button class="uk-button uk-button-success" id="body-heade-save" type="button">
				<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>
			</button>

			/ <a href="" id="breadcrumb-main-section-cancel"><%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%></a>
		</div>
	</div>
</div>
<% boolean admin=false;
	boolean fnc=false;
	boolean reg=false;
	for(Role role:GlobalVariable.getRoles()){
		if(role.getId()==Integer.parseInt(ResourceBoundleHolder.sysConfig.getString("config.role.admin")))
			admin=true;
		else if(role.getId()==Integer.parseInt(ResourceBoundleHolder.sysConfig.getString("config.role.fnc")))
			fnc=true;	
		if(role.getId()==Integer.parseInt(ResourceBoundleHolder.sysConfig.getString("config.role.reg")))
			reg=true;
        pageContext.setAttribute("admin",admin);
        pageContext.setAttribute("fnc",fnc);
        pageContext.setAttribute("reg",reg);

	}

 %>

	<base:mehrSys-grid-comboWithoutButton isPopup="true" name="grid" transportReadUrl="${basePath}/grid-read" categoriesReadUrl="${basePath}/allState" comboCaption="comboCaption" comboId="comboId" modelFieldFilterCombo="state" modelFieldFilterText="searchField" selectable="single" comboLabelCaptionKey="his.patient.visitInfo.stateFilter" hasSearchDate="false">
		<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber"  width="45px"/>
		<base:my-grid-column title='clinic.patient.firstName'  field="firstname" width="30px"/>
		<base:my-grid-column title='clinic.patient.lastName'  field="lastname" width="50px"/>
		<base:my-grid-column title='clinic.patient.doctorName'  field="doctorFam" width="50px"/>
		<base:my-grid-column title='clinic.cash.doctorCost'  field="doctorCost" width="50px"/>
		<base:my-grid-column title='clinic.cash.discount'  field="discount" width="50px"/>
		<base:my-grid-column title='clinic.cash.returnCost'  field="returnCost" width="50px"/>
		<base:my-grid-column title='clinic.cash.state'  field="stateStr" width="50px"/>
       
		<base:my-grid-schema-field name="filenumber" type="string" />
		<base:my-grid-schema-field name="firstName" type="string" />
		<base:my-grid-schema-field name="lastname" type="string" />
		<base:my-grid-schema-field name="doctorFullName" type="string" />
		<base:my-grid-schema-field name="doctorCost" type="string" />
		<base:my-grid-schema-field name="discount" type="string" />
		<base:my-grid-schema-field name="returnCost" type="string" />
        <c:choose>
            <c:when test="${admin}">
                <base:my-grid-function text="clinic.cash.edit" functionClick="grid_onMyEdit" name="myEdit"/>
                <base:my-grid-function text="clinic.cash.ready" functionClick="grid_onVisitPatientEdit"  name="visitPatientEdit"/>
                <base:my-grid-function text="clinic.cash.remove" functionClick="grid_onVisitPatientRemove" name="visitPatientRemove"/>
            </c:when>
            <c:when test="${fnc}">
                <base:my-grid-function text="clinic.cash.edit" functionClick="grid_onMyEdit"  name="myEdit"/>
                <base:my-grid-function text="clinic.cash.remove" functionClick="grid_onVisitPatientRemove"  name="visitPatientRemove"/>
            </c:when>
            <c:when test="${reg}">
                <base:my-grid-function text="clinic.cash.ready" functionClick="grid_onVisitPatientEdit"  name="visitPatientEdit"/>
            </c:when>
        </c:choose>
	</base:mehrSys-grid-comboWithoutButton>
<base:footer></base:footer>
<script>
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
 		
                    url:"${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/readyToVisit",
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
    
    function grid_onVisitPatientRemove(e){
        var data = this.dataItem($(e.target).closest("tr"));
 		var tmp = {};
 		tmp['id']=data.id;
 		jQuery.ajax({
 		
                    url:"${pageContext.request.contextPath}"+"/clinic/cash/visitedPatients/removeRecord",
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
    
</script>
