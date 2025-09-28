<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
%>

<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" style="" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small" />
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small" />
            <base:multiSelect serverFilter="true" name="patientId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllPatient"
                              key="com.artonis.clinic.operation.factorPatientDenotativeCost.patient" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <%--<base:multiSelect serverFilter="true" name="clinicServiceId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllClinicService"
                              key="com.artonis.clinic.basicInfo.serviceItem.type.healthCenterService" />--%>
            <base:multiSelect serverFilter="true" name="groupId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllGroup"
                                  key="com.artonis.clinic.operation.factorPatientDenotativeCost.group" />
            <base:multiSelect serverFilter="true" name="serviceId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllService"
                              key="com.artonis.clinic.operation.factorPatientDenotativeCost.service" />
            <base:multiSelect serverFilter="true" name="mainDoctorId_values" styleClass="small"  multiSelectLoaderUrl="combo/loadAllMainDoctor"
                              key="com.artonis.clinic.operation.factorPatientDenotativeCost.mainDoctor" />

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="anesthesiaDoctorId_values" styleClass="small"  multiSelectLoaderUrl="combo/loadAllAnesthesiaDoctor"
                              key="com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaDoctor" />
        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
    <base:my-grid-column title='global.date' field="date" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.patient' field="patientFullName" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.service' field="serviceName" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.drugCost' field="drugCost" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.drugCostInsurance' field="drugCostInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.equipmentCost' field="equipmentCost" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.equipmentCostInsurance' field="equipmentCostInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.clinicServiceCost' field="clinicServiceCost" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.clinicServiceCostInsurance' field="clinicServiceCostInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainDoctor' field="mainDoctorFullName" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainDoctorTotalReceive' field="mainDoctorTotalReceive" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainDoctorPortion' field="mainDoctorPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainDoctorPortionInsurance' field="mainDoctorPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainClinicPortion' field="mainClinicPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.mainClinicPortionInsurance' field="mainClinicPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistant' field="assistantDoctorFullName" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistantDoctorTotalReceive' field="assistantDoctorTotalReceive" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistantDoctorPortion' field="assistantDoctorPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistantDoctorPortionInsurance' field="assistantDoctorPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistantClinicPortion' field="assistantClinicPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.assistantClinicPortionInsurance' field="assistantClinicPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaDoctor' field="anesthesiaDoctorFullName" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaDoctorTotalReceive' field="anesthesiaDoctorTotalReceive" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaDoctorPortion' field="anesthesiaDoctorPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaDoctorPortionInsurance' field="anesthesiaDoctorPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaClinicPortion' field="anesthesiaClinicPortion" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.anesthesiaClinicPortionInsurance' field="anesthesiaClinicPortionInsurance" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorPatientDenotativeCost.receivedFromPatient' field="receivedFromPatient" width="40"/>
</base:my-grid-search>

<div class="uk-container uk-container-center my-uk-container" style="" >
    <form class="uk-form" id="footerItemsForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx styleClass="small" name="sumDoctorPortion" key="com.artonis.clinic.operation.factorPatientDenotativeCost.sumDoctorPortion" disabled="true"/>
            <base:testBoxNumericEx styleClass="small" name="sumClinicPortion" key="com.artonis.clinic.operation.factorPatientDenotativeCost.sumClinicPortion" disabled="true"/>
        </div>
    </form>
</div>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());
    });

    function getSearchObject(){
		var obj = {};
		obj.fromDate = $("#fromDate").val();
		obj.toDate = $("#toDate").val();

        ////---- This part is for get values from multiSelects -----------
        var getOptionArray = function(options){
        	var arr = [];
        	for(var i=0;i<options.length;i++){
            	arr[i]=options[i].value;
            }
        	return arr;
        };
        $("*[data-role='multiselect']").each(function(){
        	obj[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
        })
		////---------- END -------------
		return obj;
	}

	function doAfterSearch(searchJsonString){
        var requestUrl = "${pageContext.request.contextPath}"+"/clinic/operation/factorPatientDenotativeCost/getSumValues/" + searchJsonString;
        $.getJSON(requestUrl, function (data) {
            $("#sumDoctorPortion").val(Math.round(data.sumDoctorPortion));
            $("#sumClinicPortion").val(Math.round(data.sumClinicPortion));
            setNumericTextValue();
        });
    }

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
</script>