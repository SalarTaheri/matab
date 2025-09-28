<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

	<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="multiple" isPopup="true" >
		<base:my-grid-column title='hrm.employee.firstName'  field="firstName" width="50px"/>
		<base:my-grid-column title='hrm.employee.lastName' field="lastName"  width="50px"/>
		<base:my-grid-column title='hrm.employee.fatherName' field="fatherName"  width="50px"/>
		<base:my-grid-column title='hrm.employee.nationalCode' field="nationalCode"  width="50px"/>
		<base:my-grid-column title='hrm.employee.identityNumber' field="identityNumber"  width="50px"/>
		<base:my-grid-column title='hrm.employee.birthDate' field="birthDate"  width="50px"/>
       
		<base:my-grid-schema-field name="firstName" type="string" />
		<base:my-grid-schema-field name="lastName" type="string" />
		<base:my-grid-schema-field name="fatherName" type="string" />
		<base:my-grid-schema-field name="fatherName" type="string" />
		<base:my-grid-schema-field name="nationalCode" type="string" />
		<base:my-grid-schema-field name="identityNumber" type="string" />
		<base:my-grid-schema-field name="birthDate" type="string" />
		<base:my-grid-function name="select" text="action.select"   functionClick="selectMe" />
	</base:my-grid>
<base:footer></base:footer>
<script type="text/javascript">
		function closeMe(){
			window.close();
		}
		function msg(x){
			document.forms[0].selectedId.value=x;
		}

		function selectMe(){
			var grid = $("#grid").data("kendoGrid");
			var row = grid.select();
			var data = grid.dataItem(row);
			window.alert(data.id);
			opener.document.getElementById("aaaa").value=data.id
			window.close();
			//if (document.forms[0].selectedId.value!='undefined'){
//				document.forms[0].actionType.value = 'execute';
	//			document.forms[0].submit();
		//	}
		}
	</script>
