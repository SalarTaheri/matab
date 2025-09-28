<%@page import="com.artonis.hrm.core.service.util.HrmCoreServiceUtil"%>
<%@ page import="com.artonis.core.base.core.Date" %>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
    boolean isEmployeeDoctor = HrmCoreServiceUtil.isEmployeeWorkingGroupDoctor(GlobalVariable.getEmployee().getWorkingGroup());
    Long employeeId = GlobalVariable.getEmployee().getId();

%>
<base:pageHeaderTitle/>

<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="doctor_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName" />
            <base:multiSelect serverFilter="true" name="group_ids" styleClass="small" multiSelectLoaderUrl="combo/allGroup" key="com.artonis.clinic.basicInfo.group.name" />
            <%--<base:comboBox name="service_id" key="com.artonis.clinic.basicInfo.service.name" comboLoaderUrl="combo/allService" styleClass="small"/>--%>
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>

        </div>

        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
        <base:my-grid-search  showMultipleDelete="false"  showOperation="false" scrollable="true">
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.group_name' field="group_name"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctor_lastName' field="doctor_lastName"  width="80px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="50px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.serviceItemAmountSum' field="serviceItemAmountSumStr"  width="80px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.totalReceiveCostSum' field="totalReceiveCostSumStr"  width="70px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.insuranceAmountSum' field="insuranceAmountSumStr"  width="60px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicDiscount' field="clinicDiscountStr"  width="70px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorDiscount' field="doctorDiscountStr"  width="70px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.bothDiscount' field="bothDiscountStr"  width="70px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum' field="doctorPortionReceiveCostSumStr"  width="100px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum' field="clinicPortionReceiveCostSumStr"  width="100px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctorPortionInsurance' field="doctorPortionInsuranceStr"  width="100px"/>
            <base:my-grid-column title='com.artonis.clinic.operation.factorView.clinicPortionInsurance' field="clinicPortionInsuranceStr"  width="100px"/>


            <base:my-grid-schema-field name="group_name" type="string" />
            <base:my-grid-schema-field name="doctor_lastName" type="string" />
            <base:my-grid-schema-field name="patientCount" type="string" />
            <base:my-grid-schema-field name="serviceItemAmountSumStr" type="string" />
            <%--<base:my-grid-schema-field name="insuranceAmountSumStr" type="string" />--%>
            <base:my-grid-schema-field name="totalReceiveCostSumStr" type="string" />
            <base:my-grid-schema-field name="clinicDiscountStr" type="string" />
            <base:my-grid-schema-field name="doctorDiscountStr" type="string" />
            <base:my-grid-schema-field name="bothDiscountStr" type="string" />
            <base:my-grid-schema-field name="doctorPortionReceiveCostSumStr" type="string" />
            <base:my-grid-schema-field name="clinicPortionReceiveCostSumStr" type="string" />

        </base:my-grid-search >
    </form>
<div class="uk-grid uk-grid-preserve" style="border-style: double;margin-right: 0px;padding-top: 5px;padding-bottom: 5px;">
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.patientCount"/>
        <base:testBoxNumericEx disabled="true" name="serviceItemAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.serviceItemAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="totalReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.totalReceiveCostSum"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="insuranceAmountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.insuranceAmountSum"/>
        <base:testBoxNumericEx disabled="true" name="clinicDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicDiscount"/>
        <base:testBoxNumericEx disabled="true" name="doctorDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorDiscount"/>

    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="bothDiscountSum" styleClass="small" key="com.artonis.clinic.operation.factorView.bothDiscount"/>
        <base:testBoxNumericEx disabled="true" name="doctorPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionReceiveCostSum"/>
        <base:testBoxNumericEx disabled="true" name="clinicPortionReceiveCostSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionReceiveCostSum"/>
    </div>
    <div class="uk-grid uk-grid-preserve">
        <base:testBoxNumericEx disabled="true" name="doctorPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.doctorPortionInsurance"/>
        <base:testBoxNumericEx disabled="true" name="clinicPortionInsuranceSum" styleClass="small" key="com.artonis.clinic.operation.factorView.clinicPortionInsurance"/>

    </div>
  </div>
</div>
<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        var isEmployeeDoctor=<%=isEmployeeDoctor%>;
        var employeeId=<%=employeeId%>;
        if(isEmployeeDoctor==true){
            $("#doctor_id").val(employeeId);
            $("#doctor_id_Comb").data("kendoComboBox").value(employeeId);
            $("#doctor_id_Comb").data("kendoComboBox").enable(false);;
        }

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

        docVar.doctor_ids=$("#doctor_ids_multiSelect").val();
        var doctorDataItems=$("#doctor_ids_multiSelect").data("kendoMultiSelect")._dataItems;
        if(doctorDataItems!=undefined &&doctorDataItems.length>0){
            var doctor_id_valueText='';
            for(var j=0;j<doctorDataItems.length;j++){
                doctor_id_valueText+=doctorDataItems[j].ComboCaption+' , ';
            }
            docVar.doctor_id_text=doctor_id_valueText.substring(0,doctor_id_valueText.length-3);
        }

        docVar.group_ids=$("#group_ids_multiSelect").val();
        var groupDataItems=$("#group_ids_multiSelect").data("kendoMultiSelect")._dataItems;
        if(groupDataItems!=undefined &&groupDataItems.length>0){
            var group_id_valueText='';
            for(var j=0;j<groupDataItems.length;j++){
                group_id_valueText+=groupDataItems[j].ComboCaption+' , ';
            }
            docVar.group_id_text=group_id_valueText.substring(0,group_id_valueText.length-3);
        }

        return docVar;

    }

    function doAfterClearAndSearch(){
        doAfterSearch(getSearchJsonString());
    }


    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorDoctorClinicPortionBasedDoctorGroup/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#patientCountSum").val(result.patientCountSum);
                $("#serviceItemAmountSum").val(result.serviceItemAmountSum);
                $("#totalReceiveCostSum").val(result.totalReceiveCostSum);
                $("#insuranceAmountSum").val(result.insuranceAmountSum);
                $("#clinicDiscountSum").val(result.clinicDiscountSum);
                $("#doctorDiscountSum").val(result.doctorDiscountSum);
                $("#bothDiscountSum").val(result.bothDiscountSum);
                $("#doctorPortionReceiveCostSum").val(result.doctorPortionReceiveCostSum);
                $("#clinicPortionReceiveCostSum").val(result.clinicPortionReceiveCostSum);
                $("#doctorPortionInsuranceSum").val(result.doctorPortionInsuranceSum);
                $("#clinicPortionInsuranceSum").val(result.clinicPortionInsuranceSum);

                setNumericTextValue();
            }

        });

    }

    function searchGrid_onDataBound_callback(e){
        if($("#searchGrid").data("kendoGrid").dataSource._total!=undefined &&
            $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url.indexOf("search/search/grid-read/"+$("#searchGrid").data("kendoGrid").dataSource._total+"/")==-1){
            $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url=
                $("#searchGrid").data("kendoGrid").dataSource.transport.options.read.url.replace("search/search/grid-read/","search/search/grid-read/"+$("#searchGrid").data("kendoGrid").dataSource._total+"/")
        }
    }

</script>
