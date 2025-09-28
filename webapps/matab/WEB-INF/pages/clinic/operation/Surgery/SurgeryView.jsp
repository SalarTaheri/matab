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

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 1;" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="doctor_id_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName" />
            <base:multiSelect serverFilter="true" name="service_id_values" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
    </form>
</div>

<div id="co" style="width: 1570px">
<base:my-grid-search scrollable="true" >
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.patientName'  field="patientFullName" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeryType'  field="surgeryType_name" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.service.name'  field="service_name" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeon_employee_fullname'  field="surgeon_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeon_assistant1_employee_fullname'  field="surgeon_assistant1_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeon_assistant2_employee_fullname'  field="surgeon_assistant2_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.anesthesiologist_employee_fullname'  field="anesthesiologist_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.anesthesia_technicians_employee_fullname'  field="anesthesia_technicians_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.anesthesiaType'  field="anesthesiaType_name" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.technician1_employee_fullname'  field="technician1_employee_fullname" width="100"/>
	<%-- <base:my-grid-column title='com.artonis.clinic.operation.surgery.technician2_employee_fullname'  field="technician2_employee_fullname" width="100"/> --%>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.nurse_operating_employee_fullname'  field="nurse_operating_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.nurse_assistant_employee_fullname'  field="nurse_assistant_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.nurse_recovery_employee_fullname'  field="nurse_recovery_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.scrub1_employee_fullname'  field="scrub1_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.scrub2_employee_fullname'  field="scrub2_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.sirculer1_employee_fullname'  field="sirculer1_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.sirculer2_employee_fullname'  field="sirculer2_employee_fullname" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.surgeryRvuCodes'  field="surgeryRvuCodes" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.date'  field="date" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.start_time'  field="start_time" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.end_time'  field="end_time" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.radiography' isCombo="true" field="radiography" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.patology' isCombo="true" field="patology" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.bloodreserve' isCombo="true" field="bloodreserve" width="100"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.description'  field="description" width="200"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.register_employee_fullname'  field="register_employee_fullname" width="100"/>
</base:my-grid-search>
</div>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();

    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    function getSearchObject(){
        var docVar = {};
        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
//        docVar.doctor_id=$("#doctor_id").val();
//        docVar.service_id=$("#service_id").val();
        docVar.doctor_ids=$("#doctor_id_values_multiSelect").val();
        var doctorDataItems=$("#doctor_id_values_multiSelect").data("kendoMultiSelect")._dataItems;
        if(doctorDataItems!=undefined &&doctorDataItems.length>0){
            var doctor_id_valueText='';
            for(var j=0;j<doctorDataItems.length;j++){
                doctor_id_valueText+=doctorDataItems[j].ComboCaption+' , ';
            }
            docVar.doctor_id_text=doctor_id_valueText.substring(0,doctor_id_valueText.length-3);
        }
        docVar.service_ids=$("#service_id_values_multiSelect").val();
        var serviceDataItems=$("#service_id_values_multiSelect").data("kendoMultiSelect")._dataItems;
        if(serviceDataItems!=undefined &&serviceDataItems.length>0){
            var service_id_valueText='';
            for(var j=0;j<serviceDataItems.length;j++){
                service_id_valueText+=serviceDataItems[j].ComboCaption+' , ';
            }
            docVar.service_id_text=service_id_valueText.substring(0,service_id_valueText.length-3);
        }
        return docVar;
    }
</script>