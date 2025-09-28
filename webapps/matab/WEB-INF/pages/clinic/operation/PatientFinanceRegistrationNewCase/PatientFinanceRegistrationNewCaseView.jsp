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
            <base:multiSelect serverFilter="true" name="service_ids" styleClass="small" multiSelectLoaderUrl="combo/loadAllService"
                              key="com.artonis.clinic.operation.patientFinanceRegistrationNewCase.service" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:multiSelect serverFilter="true" name="doctor_ids" styleClass="small"  multiSelectLoaderUrl="combo/loadAllDoctor"
                              key="com.artonis.clinic.operation.patientFinanceRegistrationNewCase.doctor" />

        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
    <base:my-grid-column title='global.date' field="date" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.patientFinanceRegistrationNewCase.patientCount' field="patientCount" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.patientFinanceRegistrationNewCase.service' field="service_name" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.patientFinanceRegistrationNewCase.doctor' field="doctor_fullname" width="40"/>

</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
//        doAfterSearch(getSearchJsonString());
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

	<%--function doAfterSearch(searchJsonString){--%>
        <%--var requestUrl = "${pageContext.request.contextPath}"+"/clinic/operation/factorPatientDenotativeCost/getSumValues/" + searchJsonString;--%>
        <%--$.getJSON(requestUrl, function (data) {--%>
            <%--$("#sumDoctorPortion").val(Math.round(data.sumDoctorPortion));--%>
            <%--$("#sumClinicPortion").val(Math.round(data.sumClinicPortion));--%>
            <%--setNumericTextValue();--%>
        <%--});--%>
    <%--}--%>

    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
</script>