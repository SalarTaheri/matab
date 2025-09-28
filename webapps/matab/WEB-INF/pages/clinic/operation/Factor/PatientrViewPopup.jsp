<%@ page import="com.artonis.core.system.authentication.service.util.AuthenticationServiceUtil"%>
<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable"%>
<%@ page import="com.artonis.hrm.employee.service.util.EmployeeServiceUtil"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.artonis.core.system.authentication.service.util.AuthenticationServiceUtil"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script type="text/javascript">
function grid_onSelectItem(e){
	var data = this.dataItem($(e.target).closest("tr"));
    $('#fileNumber').val(data.filenumber);
    $('#patientId').val(data.id);
    $('#phone').val(data.tel1);
    $('#cellPhone').val(data.cellphon);
    $('#age').val(data.age);
    ///
    $('#nameAndFam_Comb').data('kendoComboBox').value(data.id);
	var ppb = $("#nameAndFam_Comb").data("kendoComboBox");
	ppb.dataSource.filter({ logic: 'and', filters: [{ field: "searchField", operator: "contains", value: data.filenumber }]});
	ppb.dataSource.read();
	ppb.value(data.id);
    ///
    modal.hide();
}
</script>

<div class="k-rtl">
<base:mehrSys-grid-text name="grid" transportReadUrl="${pageContext.request.contextPath}/clinic/patientr/patientr/grid-read" modelFieldFilter="searchField"
				selectable="true"  showSearchIcon="false" onDoubleSelectRowEvent="selectRowEventCallBack">
	<base:my-grid-column title='clinic.patient.fileNumber' 	field="filenumber" width="30px" />
	<base:my-grid-column title='clinic.patient.oldFileNumber' 	field="oldFileNumber" width="40px" />
	<base:my-grid-column title='clinic.patient.firstName' field="firstname"	width="30px" />
	<base:my-grid-column title='clinic.patient.lastName' field="lastname" width="40px" />
	<base:my-grid-column title='clinic.patient.fatherName'	field="fathername" width="30px" />
	<base:my-grid-column title='clinic.patient.age' field="age"	width="20px" />
	<base:my-grid-column title='clinic.patient.birthDate' field="birthYear"	width="25px" />
	<base:my-grid-column title='clinic.patient.tel1' field="tel1" width="30px" />
	<base:my-grid-column title='clinic.patient.cellPone' field="cellphon" width="30px" />
    <base:my-grid-column title='his.patient.doctorName' field="doctorFam" width="30px" />

	<base:my-grid-schema-field name="filenumber" type="string" />
	<base:my-grid-schema-field name="firstName" type="string" />
	<base:my-grid-schema-field name="lastName" type="string" />
	<base:my-grid-schema-field name="fatherName" type="string" />
	<base:my-grid-schema-field name="age" type="number" />
	<base:my-grid-schema-field name="birthYear" type="int" />
	<base:my-grid-schema-field name="tel1" type="string" />
	<base:my-grid-schema-field name="cellPone" type="string" />
	<base:my-grid-schema-field name="doctorFam" type="string" />

	<base:my-grid-function text="action.select" functionClick="grid_onSelectItem"  name="gridOnSelectItem"/> 
</base:mehrSys-grid-text>
</div>

<style type="text/css">
    .uk-modal-dialog{
        right:0px;
        margin-right: 0px;
        width: 100%;
        padding:0px;
        top: 5%;
    }
</style>