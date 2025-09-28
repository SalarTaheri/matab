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
            <base:multiSelect serverFilter="true" name="employeeId_values" styleClass="small" multiSelectLoaderUrl="combo/loadAllEmployee" key="com.artonis.clinic.operation.surgery.personel" />
            <base:multiSelect serverFilter="true" name="serviceId_values" styleClass="small" multiSelectLoaderUrl="combo/allService" key="com.artonis.clinic.operation.surgery.service.name" />
            <base:comboBox styleClass="small" name="workingGroup" isListConstant="true" key="hrm.employee.workingGroup" comboLoaderUrl="combo/loadAllEmployeeWorkingGroup" />
        </div>
        <div class="uk-grid uk-grid-preserve">
        	<base:mDatePicker name="fromDate" key="global.fromDate" styleClass="small"/>
            <base:mDatePicker name="toDate" key="global.toDate" styleClass="small"/>
        </div>
    </form>
</div>

<base:my-grid-search showOperation="false">
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.personel'  field="fullName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.service.name'  field="serviceName" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.count'  field="count" width="40"/>
	<base:my-grid-column title='com.artonis.clinic.operation.surgery.price'  field="price" width="40"/>
</base:my-grid-search>

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
		docVar.fromDate = $("#fromDate").val();
		docVar.toDate = $("#toDate").val();
		docVar.workingGroup = $("#workingGroup").val();
        docVar.workingGroup_txt=$("#workingGroup_Comb").data("kendoComboBox").text();

        ////---- This part is for get values from multiSelects -----------
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
</script>