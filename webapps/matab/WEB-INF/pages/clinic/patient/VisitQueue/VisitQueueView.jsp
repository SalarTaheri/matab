
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@ page import="com.artonis.core.base.core.Date" %>
<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();

    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
    String notAllowDelete=resource.getString("his.patient.alert.state.visited.notdelete");
    String notAllowEdit=resource.getString("his.patient.alert.state.visited.notedit");
 %>

 <input name="loadedId" type="hidden" id="loadedId" />
 
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span>
		</li>
	</ul>
	<div id="header-toolbar">
		<%--<button class="uk-button uk-button-success" type="button" onclick="javascript:refreshClick()">--%>
			<%--<%=ResourceBoundleHolder.resourceBundle.getString("clinic.patient.visitQueue.refresh")%>--%>
		<%--</button>--%>

		<%--<div id="body-heade-save-div" style="display:none;">--%>
			<%--<button class="uk-button uk-button-success" id="body-heade-save" type="button">--%>
				<%--<%=ResourceBoundleHolder.resourceBundle.getString("global.crud.save")%>--%>
			<%--</button>--%>

			<%--/ <a href="" id="breadcrumb-main-section-cancel"><%=ResourceBoundleHolder.resourceBundle.getString("global.crud.cancel")%></a>--%>
		<%--</div>--%>
	</div>
</div>



	<%--<base:mehrSys-grid-combo name="grid" transportReadUrl="${basePath}/grid-read" categoriesReadUrl="${basePath}/categories" comboCaption="fullName" comboId="id" modelFieldFilter="doctor_id" comboLabelCaptionKey="his.patient.visitQueue.doctorFilter">--%>
		<%--<base:my-grid-column title='his.patient.fileCode' field="fileNumber"  width="50px"/>--%>
		<%--<base:my-grid-column title='clinic.patient.firstName'  field="patientName" width="50px"/>--%>
		<%--<base:my-grid-column title='clinic.patient.lastName' field="patientFam"  width="50px"/>--%>
		<%--<base:my-grid-column title='his.patient.doctorName' field="doctorFam"  width="50px"/>--%>
		<%--<base:my-grid-column title='clinic.visit.clinicalInformation.weight' field="weightStr"  width="20px"/>--%>
		<%--<base:my-grid-column title='clinic.visit.clinicalInformation.bloodPressure' field="bloodPressure"  width="20px"/>--%>
		<%--<base:my-grid-column title='his.patient.state' field="stateKey"  width="30px"/>--%>
       <%----%>
		<%--<base:my-grid-schema-field name="fileNumber" type="string" />--%>
		<%--<base:my-grid-schema-field name="patientName" type="string" />--%>
		<%--<base:my-grid-schema-field name="patientFam" type="string" />--%>
		<%--<base:my-grid-schema-field name="doctorFam" type="string" />--%>
		<%--<base:my-grid-schema-field name="weightStr" type="string" />--%>
		<%--<base:my-grid-schema-field name="bloodPressure" type="string" />--%>
		<%--<base:my-grid-schema-field name="stateKey" type="string" />--%>
        <%--<base:my-grid-function text="clinic.visit.clinicalInformation" functionClick="grid_onClinicalInformation"  name="clinicalInformation"/>--%>
        <%--<base:my-grid-function text="clinic.patient.visit" functionClick="grid_onVisit"  name="visit"/>--%>
	<%--</base:mehrSys-grid-combo>--%>
<%--<base:footer></base:footer>--%>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="doctor_id" value="doctorName" key="his.patient.doctorName" comboLoaderUrl="combo/loadAllDoctor" styleClass="small"/>
            <base:testBox name="searchField" key="clinic.patient.name" styleClass="small"/>
            <base:comboBox name="state" value="state" key="com.artonis.clinic.basicInfo.operation.status" comboLoaderUrl="combo/loadState" styleClass="small"/>
        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="cashType" key="his.patient.cashType" comboLoaderUrl="combo/allCashTypeWithSendByDoctor"/>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox styleClass="small" name="service_id" key="com.artonis.clinic.basicInfo.service.name" comboLoaderUrl="combo/allService"/>

        </div>
        <base:my-grid-search  showMultipleDelete="false">
            <base:my-grid-column title='his.patient.fileCode' field="fileNumber"  width="50px"/>
            <base:my-grid-column title='clinic.patient.firstName'  field="patientName" width="50px"/>
            <base:my-grid-column title='clinic.patient.lastName' field="patientFam"  width="50px"/>
            <base:my-grid-column title='his.patient.doctorName' field="doctorFam"  width="50px"/>
            <base:my-grid-column title='clinic.patient.date' field="visitDate"  width="30px"/>
            <%--<base:my-grid-column title='clinic.visit.clinicalInformation.weight' field="weightStr"  width="20px"/>--%>
            <%--<base:my-grid-column title='clinic.visit.clinicalInformation.bloodPressure' field="bloodPressure"  width="20px"/>--%>
            <base:my-grid-column title='his.patient.state' field="stateKey"  width="30px"/>
            <base:my-grid-column title='com.artonis.clinic.basicInfo.service.name' field="serviceName"  width="30px"/>
            <base:my-grid-column title='his.patient.cashType' field="cashTypeStr"  width="50px"/>

            <base:my-grid-schema-field name="fileNumber" type="string" />
            <base:my-grid-schema-field name="patientName" type="string" />
            <base:my-grid-schema-field name="patientFam" type="string" />
            <base:my-grid-schema-field name="doctorFam" type="string" />
            <base:my-grid-schema-field name="visitDate" type="string" />
            <%--<base:my-grid-schema-field name="weightStr" type="string" />--%>
            <%--<base:my-grid-schema-field name="bloodPressure" type="string" />--%>
            <base:my-grid-schema-field name="stateKey" type="string" />
            <base:my-grid-schema-field name="serviceName" type="string" />
            <base:my-grid-schema-field name="cashTypeStr" type="string" />
        </base:my-grid-search>
    </form>
</div>
<base:footer/>
<script>
	function refreshClick(){
		    	window.location.href = "${createUrl}";
	}

    function grid_onVisit(e){
        var data = this.dataItem($(e.target).closest("tr"));
 		//window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visit/" + data.patient_id;
 		//window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitCardBase/" + data.patient_id;
 		//window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitMobileBase/" + data.patient_id+"/"+data.id;
 		//magar state ra pas bedim aga state visit shode bod bere akhari ro load kone;in emkan faghat baraye roze jari vashad vala gheyr
		var dataForServet = {};
		dataForServet.visitQueueId=data.id;
 		jQuery.ajax({
                    url:"${pageContext.request.contextPath}/clinic/patient/visitQueue/readyToVisit/",
                    type:"POST",
                    data:JSON.stringify(dataForServet),
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

    function grid_onClinicalInformation(e){
        var data = this.dataItem($(e.target).closest("tr"));
        window.location = "${pageContext.request.contextPath}"+"/clinic/patient/visitQueue/editWP/id=" + data.id;
    }

    function getSearchObject(){

        var docVar = {};

        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
        docVar.doctor_id=$("#doctor_id").val();
        docVar.searchField=$("#searchField").val();
        docVar.state=$("#state").val();
        docVar.cashType=$("#cashType").val();
        docVar.service_id=$("#service_id").val();



        return docVar;

    }

    function searchGrid_onDataBound_callback(e){
        var grid = $("#searchGrid").data("kendoGrid");
        var data = grid.dataSource.data();
        $.each(data, function (i, row) {
            if (row.state == 1){
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "green");
            }
            else if (row.state == 3){
                $('tr[data-uid="' + row.uid + '"] ').css("background-color", "gold");
            }
        });
    }


    function searchGrid_before_delete_callback(e){
        if(e.state==3){
            alertify.alert("<%=notAllowDelete%>");
            return "false";
        }
    }
    function searchGrid_before_edit_callback(e){
//        if(e.state==3){
            <%--alertify.alert("<%=notAllowEdit%>");--%>
//            return "false";
//        }
    }
    $(document).ready(function() {
        resetForm();


    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
</script>
