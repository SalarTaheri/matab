<%@page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ page import="com.artonis.core.base.core.Date" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    Date curDate=new Date(System.currentTimeMillis());
    String curStringDate=curDate.toString();
    String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));
%>

<base:pageHeaderTitle/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 0px;margin-top: 5px;padding-bottom: 15px;" >
    <form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="doctor_id_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllDoctor" key="his.patient.doctorName" />
            <base:multiSelect serverFilter="true" name="service_item_values" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.basicInfo.service.name" />
            <%if(GlobalVariable.getButtonContainer(menuSysCode,"factor-pcpdsu-cashierUserPermission")){ %>
            	<base:comboBox name="cashierUserId" key="com.artonis.clinic.operation.factorView.cashierUser" comboLoaderUrl="combo/loadUsers" styleClass="small"/>
           	<%}else{ %>
           		<base:label name="cashierCurrentUser" key="com.artonis.clinic.operation.factorView.cashierUser" styleClass="small"></base:label>
           	<%} %>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
    </form>
</div>
<div class="uk-container uk-container-center my-uk-container" >
    <base:my-grid-search  showMultipleDelete="false" showOperation="false" >
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.patientCount' field="patientCount"  width="30px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.doctor_lastName' field="doctor_lastName"  width="30px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.service_name' field="service_name"  width="50px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.date' field="date"  width="30px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumTotalCostStr' field="sumTotalCostStr"  width="50px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumInsuranceCostStr' field="sumInsuranceCostStr"  width="30px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumTotalDiscountsStr' field="sumTotalDiscountsStr"  width="40px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.sumPaymentableCostStr' field="sumPaymentableCostStr"  width="40px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.cancel' field="cancelStr"  width="50px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.cashierUserFullName' field="cashierFullName"  width="50px"/>
	     <base:my-grid-column title='com.artonis.clinic.operation.factorView.username' field="cashierUsername"  width="30px"/>
    </base:my-grid-search>
    <div class="uk-grid uk-grid-preserve" style="background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);padding-top: 10px;margin-right: 0px;padding-bottom: 10px;">
        <base:testBoxNumericEx disabled="true" name="totalCostSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumTotalCostStr"/>
        <base:testBoxNumericEx disabled="true" name="insuranceCostSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumInsuranceCostStr"/>
        <base:testBoxNumericEx disabled="true" name="totalDiscountsSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumTotalDiscountsStr"/>
        <base:testBoxNumericEx disabled="true" name="paymentableCostSum" styleClass="verysmall" styledivLabel="width: 15%;" key="com.artonis.clinic.operation.factorView.sumPaymentableCostStr"/>
    </div>
    <div class="uk-grid uk-grid-preserve" style="background: linear-gradient(to bottom, rgba(160, 188, 197, 1) 0%,rgba(190, 201, 206, 1) 37%,rgba(121, 139, 142, 1) 100%);padding-top: 10px;margin-right: 0px;padding-bottom: 10px;">
        <base:testBoxNumericEx disabled="true" name="patientCountSum" styleClass="verysmall" key="com.artonis.clinic.operation.factorView.sumPatientCount"/>
    </div>
</div>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        doAfterSearch(getSearchJsonString());
        $("#cashierCurrentUser").val("${currentUsername}");
    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
    function getSearchObject(){
        var docVar = {};
        docVar.fromDate=$("#fromDate").val();
        docVar.toDate=$("#toDate").val();
        var hasPermision = <%=GlobalVariable.getButtonContainer(menuSysCode,"factor-pcpdsu-cashierUserPermission")%>;
        if(hasPermision){
        	docVar.cashierUserId = $("#cashierUserId").val();	
        }else{
        	docVar.cashierUserId = "${currentUserId}";
        }
        ////---- This part is for get value from multiSelects -----------
        var getOptionArray = function(options){
        	var arr = [];
        	for(var i=0;i<options.length;i++){
            	arr[i]=options[i].value;
            }
        	return arr;
        };
        $("*[data-role='multiselect']").each(function(){
        	docVar[this.id.replace("_multiSelect","")] = getOptionArray(this.selectedOptions);
        })
		////---------- END -------------
        return docVar;
    }
    
    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/clinic/operation/factorPatientCountPerDoctorServiceUser/sumTotalCost/' + searchString,
            contentType:"application/json",
            dataType:'json',
            type:'POST',
            success:function (result) {
                $("#totalCostSum").val(result.totalCostSum);
                $("#insuranceCostSum").val(result.insuranceCostSum);
                $("#totalDiscountsSum").val(result.totalDiscountsSum);
                $("#paymentableCostSum").val(result.paymentableCostSum);
                $("#patientCountSum").val(result.patientCountSum);
                setNumericTextValue();
                $("#cancel_Comb").data("kendoComboBox").text('')
            }
        });
    }
</script>
