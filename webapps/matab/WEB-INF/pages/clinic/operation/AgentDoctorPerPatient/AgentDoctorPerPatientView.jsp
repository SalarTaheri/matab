<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
  Date curDate=new Date(System.currentTimeMillis());
  String curStringDate=curDate.toString();
%>
<base:pageHeaderTitle/>

<div class="uk-container uk-container-center my-uk-container" >
  <form class="uk-form" id="mainForm">
    <div class="uk-grid uk-grid-preserve">
      <base:multiSelect serverFilter="true" name="reagent_doctor_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="com.artonis.clinic.core.view.agentDoctor.agentDoctorFullName" />
      <base:multiSelect serverFilter="true" name="service_ids" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
      <base:multiSelect serverFilter="true" name="patient_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllPatient"
                        key="com.artonis.clinic.core.view.agentDoctor.patient" />


    </div>

    <div class="uk-grid uk-grid-preserve">
      <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
      <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
    </div>
    <base:my-grid-search  showMultipleDelete="false"  showOperation="false" scrollable="true">
      <%--<base:my-grid-column title='com.artonis.clinic.operation.factorView.service_item_name' field="service_item_name"  width="50px"/>--%>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.agentDoctorFullName' field="agentDoctorFullName"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.date' field="date"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.patientFileNumber' field="patientFileNumber"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.patientFirstName' field="patientFirstName"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.patientLastName' field="patientLastName"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.serviceName' field="serviceName"  width="80px"/>
      <base:my-grid-column title='com.artonis.clinic.core.view.agentDoctor.totalPayable' field="totalPayable"  width="80px"/>


      <%--<base:my-grid-schema-field name="service_item_name" type="string" />--%>
      <base:my-grid-schema-field name="patientFileNumber" type="string" />
      <base:my-grid-schema-field name="patientFirstName" type="string" />
      <base:my-grid-schema-field name="date" type="string" />
      <base:my-grid-schema-field name="agentDoctorFullName" type="string" />
      <base:my-grid-schema-field name="serviceName" type="string" />
      <base:my-grid-schema-field name="totalPayable" type="long" />

    </base:my-grid-search>
  </form>
  <div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
      <base:testBoxNumericEx disabled="true" name="sumTotalPayable" styleClass="small" key="com.artonis.clinic.core.view.agentDoctor.sumTotalPayable"/>
    </div>

  </div>
</div>
<base:footer/>

<script type="text/javascript">
  $(document).ready(function() {
    resetForm();
    doAfterSearch(getSearchJsonString());

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

    docVar.reagent_doctor_ids=$("#reagent_doctor_ids_multiSelect").val();
    var doctorDataItems=$("#reagent_doctor_ids_multiSelect").data("kendoMultiSelect")._dataItems;
    if(doctorDataItems!=undefined &&doctorDataItems.length>0){
      var doctor_id_valueText='';
      for(var j=0;j<doctorDataItems.length;j++){
        doctor_id_valueText+=doctorDataItems[j].ComboCaption+' , ';
      }
      docVar.reagent_doctor_id_text=doctor_id_valueText.substring(0,doctor_id_valueText.length-3);
    }

    docVar.service_ids=$("#service_ids_multiSelect").val();
    var arrayDataItems=$("#service_ids_multiSelect").data("kendoMultiSelect")._dataItems;
    if(arrayDataItems!=undefined &&arrayDataItems.length>0){
      var service_item_valueText='';
      for(var i=0;i<arrayDataItems.length;i++){
        service_item_valueText+=arrayDataItems[i].ComboCaption+' , ';
      }
      docVar.service_id_text=service_item_valueText.substring(0,service_item_valueText.length-3);
    }

    docVar.patient_ids=$("#patient_ids_multiSelect").val();
    var arrayDataItems=$("#patient_ids_multiSelect").data("kendoMultiSelect")._dataItems;
    if(arrayDataItems!=undefined &&arrayDataItems.length>0){
      var patient_id_valueText='';
      for(var i=0;i<arrayDataItems.length;i++){
        patient_id_valueText+=arrayDataItems[i].ComboCaption+' , ';
      }
      docVar.patient_id_text=patient_id_valueText.substring(0,patient_id_valueText.length-3);
    }

    return docVar;

  }

  function doAfterSearch(searchString){
    $.ajax({
      url:'${pageContext.request.contextPath}' + '/clinic/operation/agentDoctorPerPatient/sumTotalCost/' + searchString,
      contentType:"application/json",
      dataType:'json',
      type:'POST',
      success:function (result) {
        $("#sumTotalPayable").val(result.sumTotalPayable);

        console.log(result);
        setNumericTextValue();
      }

    });
  }

</script>
