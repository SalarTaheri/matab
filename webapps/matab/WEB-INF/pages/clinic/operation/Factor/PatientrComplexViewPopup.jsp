<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
String areUShure = resource.getString("action.alert.areYouSure.delete");

//String basePath = getServletContext().getContextPath();
//String gridUrl = basePath + "/clinic/patientr/patientrView/search/defaultSearch/grid-read";
%>
<base:pageHeader title="clinic.patient.patientView"/>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fileNumber_" key="clinic.patient.fileNumber" styleClass="small"/>
			<%--<base:testBox name="oldFileNumber_" key="com.artonis.clinic.operation.factor.oldFileNumber" styleClass="small"/>--%>
			<base:testBox name="nationalCode" key="clinic.patient.nationalCode" styleClass="small"/>
			<base:mDatePicker name="date" key="clinic.patient.date" styleClass="small" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="firstName" key="clinic.patient.firstName" styleClass="small"/>
			<base:testBox name="lastName" key="clinic.patient.lastName" styleClass="small"/>
			<base:testBox name="fatherName" key="clinic.patient.fatherName" styleClass="small"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="tel1" key="clinic.patient.tel1" styleClass="small"/>
			<base:testBox name="cellPone" key="clinic.patient.cellPone" styleClass="small"/>
		</div>
	</form>	 
</div>
<%--<base:searchButton defaultReadUrl="<%=gridUrl%>" defaultReadUrlIsRelative="false"/>--%>
<base:searchButton searchGridName="patientComplexGrid"
				   defaultReadUrl="${pageContext.request.contextPath}/clinic/patientr/patientrView/search/defaultSearch/grid-read"
				   defaultReadUrlIsRelative="false" baseReadUrl="${pageContext.request.contextPath}/clinic/patientr/patientrView/"/>
<base:my-grid-search searchGridName="patientComplexGrid"  defaultReadUrl="${pageContext.request.contextPath}/clinic/patientr/patientrView/search/defaultSearch/grid-read" defaultReadUrlIsRelative="false" isAccordionable="true" showOperation="false"
			 onDoubleSelectRowEvent="selectRowEventCallBack" >
	<base:my-grid-column title='clinic.patient.date' field="date" width="30px" />
	<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px" />
	<%--<base:my-grid-column title='com.artonis.clinic.operation.factor.oldFileNumber' field="oldFileNumber" width="30px" />--%>
	<base:my-grid-column title='clinic.patient.nationalCode' field="nationalCode"	width="30px" />
	<base:my-grid-column title='clinic.patient.firstName' field="firstname"	width="30px" />
	<base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px" />
	<base:my-grid-column title='clinic.patient.fatherName' field="fathername" width="30px" />
	<base:my-grid-column title='clinic.patient.age' field="age"	width="20px" />
	<base:my-grid-column title='clinic.patient.birthDate' field="birthYear"	width="25px" />
	<base:my-grid-column title='clinic.patient.tel1' field="tel1" width="30px" />
	<base:my-grid-column title='clinic.patient.cellPone' field="cellphon" width="30px" />
	<base:my-grid-column title='his.patient.doctorName' field="doctorFam" width="30px" />
	<base:my-grid-column title='clinic.patient.englishFirstName' field="englishFirstName" width="30px" />
    <base:my-grid-column title='clinic.patient.englishLastName' field="englishLastName" width="30px" />
    <base:my-grid-column title='clinic.patient.externalId' field="externalId" width="30px" />

	<base:my-grid-schema-field name="birthYear" type="string" />
	<base:my-grid-schema-field name="externalId" type="string" />
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
function getSearchObject_patientComplexGrid(){
	var patient = {};
	patient.filenumber=$("#fileNumber_").val();
//	patient.oldFileNumber=$("#oldFileNumber_").val();
	patient.nationalCode=$("#nationalCode").val();
	patient.firstname=$("#firstName").val();
	patient.lastname=$("#lastName").val();
	patient.fathername=$("#fatherName").val();
	patient.tel1=$("#tel1").val();
	patient.cellphon=$("#cellPone").val();
	if($("#date").val()!=""){
		patient.date=$("#date").val();
	}
	return patient;
}
//$("#patientComplexGrid").on("click", "tr.k-state-selected", function () {
       /* var selectedDataItems = [];
        var data = $("#patientComplexGrid").data("kendoGrid").dataItem(this);
        $('#fileNumber').val(data.filenumber);
//        $('#oldFileNumber').val(data.oldFileNumber);
        $('#nationalCode').val(data.nationalCode);
        $('#patientId').val(data.id);
        $('#phone').val(data.tel1);
        $('#cellPhone').val(data.cellphon);
        $('#age').val(data.age);
        ///
        $('#nameAndFam_Comb').data('kendoComboBox').value(data.id);
    	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
    	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "searchField", operator: "contains", value: data.filenumber }]});
    	ppb.dataSource.read();
    	ppb.value(data.id);*/
        ///*/
//});

function do_before_search_callback_patientComplexGrid(){
	var searchJsonString = "{}";
	console.log(getSearchObject_patientComplexGrid());
	searchJsonString = JSON.stringify(getSearchObject_patientComplexGrid());
	searchJsonString = searchJsonString.replace(/\//g, ':@:');
	var urlGrid = "${pageContext.request.contextPath}/clinic/patientr/patientrView/search/search/grid-read/" + searchJsonString;
	$("#patientComplexGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	$("#patientComplexGrid").data("kendoGrid").dataSource.page(1);
	return "false";
}
</script>
<style type="text/css">
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>