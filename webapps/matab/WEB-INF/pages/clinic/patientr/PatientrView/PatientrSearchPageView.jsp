<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
ResourceBundle resource = ResourceBundle.getBundle("application_fa");
String areUShure = resource.getString("action.alert.areYouSure.delete");
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

<base:my-grid-search>
	<base:my-grid-column title='clinic.patient.fileNumber' field="filenumber" width="30px" />
	<base:my-grid-column title='clinic.patient.oldFileNumber' field="oldFileNumber" width="30px" />
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
</base:my-grid-search>

<base:footer/>

<script type="text/javascript">
function getSearchObject(){
	var patient = {};
	patient.filenumber=$("#fileNumber").val();
	patient.oldFileNumber=$("#oldFileNumber").val();
	patient.firstname=$("#firstName").val();
	patient.lastname=$("#lastName").val();
	patient.fathername=$("#fatherName").val();
	patient.tel1=$("#tel1").val();
	patient.cellphon=$("#cellPone").val();
	return patient;
}
function searchGrid_before_edit_callback(data){
	window.location = "${pageContext.request.contextPath}"+"/clinic/patientr/patientr/edit/" + data.id;
	return "false";
}
function searchGrid_before_delete_callback(data){
	var areUShure = "<%=areUShure%>";
    alertify.confirm(areUShure, function (e) {
	    if (e) {
	        jQuery.ajax ({
			    url: basePath + "remove",
			    type: "POST",
			    data: JSON.stringify({id: data.id}),
			    dataType: "json",
			    contentType: "application/json; charset=utf-8",
			    success: function(result){
			        if(result.state == "success"){
			        	$("#searchGrid").data("kendoGrid").dataSource.read();
		        		alertify.success(result.message);
			        }else if(result.state == "error"){
			        	for(var i=0; i<result.errors.length; i++){
			        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
			        	}
			        }else{
			        	lertify.error("Something is not good! O_o");
			        }
			    },
                error:function(result){
                    if(result.status==401){
                        window.location.href="";
                    }
                }
			});
	    }
	});
	return "false";
}

</script>