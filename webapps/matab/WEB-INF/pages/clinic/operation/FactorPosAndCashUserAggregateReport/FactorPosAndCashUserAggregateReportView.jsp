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
        	<base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
            <base:multiSelect serverFilter="true" name="posId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllPos"
                              key="com.artonis.clinic.operation.factorPosAndCashReport.pos" />
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBox name="cashierUser_id" key="com.artonis.clinic.operation.factorView.cashierUser" comboLoaderUrl="combo/loadUsers" styleClass="small"/>
        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
	<%--<base:my-grid-column title='com.artonis.clinic.operation.factorPosAndCashReport.date' field="date" width="40"/>--%>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPosAndCashReport.pos' field="posName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPosAndCashReport.receipt' field="receipt" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.factorPosAndCashReport.rounded' field="rounded" width="40"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorView.cashierUserFullName' field="cashierFullName"  width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.operation.factorView.username' field="cashierUsername"  width="30px"/>
</base:my-grid-search>

<div class="uk-container uk-container-center my-uk-container" style="" >
    <form class="uk-form" id="footerItemsForm">
        <div class="uk-grid uk-grid-preserve">
            <base:testBoxNumericEx styleClass="small" name="sumCash" key="com.artonis.clinic.operation.factorPosAndCashReport.sumCash" disabled="true"/>
            <base:testBoxNumericEx styleClass="small" name="sumPos" key="com.artonis.clinic.operation.factorPosAndCashReport.sumPos" disabled="true"/>
            <base:testBoxNumericEx styleClass="small" name="sumAll" key="com.artonis.clinic.operation.factorPosAndCashReport.sumAll" disabled="true"/>
        </div>
    </form>
</div>

<base:footer/>

<script type="text/javascript">
    $(document).ready(function() {
        resetForm();
        $("#searchBtn").click();
    });
    function resetForm(){
        $("#fromDate").val("<%=curStringDate%>");
        $("#toDate").val("<%=curStringDate%>");
    }
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
        obj.cashierUser_id = $("#cashierUser_id").val();
        obj.cashierUsername=$("#cashierUser_id_Comb").data("kendoComboBox").text().replace('.','');
		////---------- END -------------
		return obj;
	}
	function doAfterSearch(searchJsonString){
        var requestUrl = "${pageContext.request.contextPath}"+"/clinic/operation/factorPosAndCashUserReport/getSumValues/" + searchJsonString;
        $.getJSON(requestUrl, function (data) {
            $("#sumCash").val(data.sumCash);
            $("#sumPos").val(data.sumPos);
            $("#sumAll").val(data.sumAll);
            setNumericTextValue();
        });
    }
</script>