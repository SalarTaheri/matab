<%@ page import="java.util.ResourceBundle" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span> <%=resource.getString("pursale.paymentService")%></span></li>
	</ul>
	  <div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="body-heade-create"/>
	   </div>
</div>

<div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
    <form class="uk-form" id="mainForm">
    
    	<div class="uk-grid uk-grid-preserve">
				<base:testBox styleClass="small" name="title" key="pursale.paymentService.title"/>
				<base:comboBox name="type" value="name" key="pursale.paymentService.type" comboLoaderUrl="combo/loadAllTypes" styleClass="midsmall" />
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="fromSerial" key="pursale.paymentService.fromSerial"/>
			<base:testBox styleClass="small" name="toSerial" key="pursale.paymentService.toSerial"/>
		</div>
	</form>	 
</div>
	<base:my-grid-search>
		<base:my-grid-column title='pursale.paymentService.title'  field="title" width="50px"/>
		<base:my-grid-column title='pursale.paymentService.serial'  field="serial" width="50px"/>
		<base:my-grid-column title='pursale.paymentService.type'  field="typeStr" width="50px"/>
	
	    <base:my-grid-schema-field name="title" type="string"/>
	    <base:my-grid-schema-field name="serial" type="string"/>
	    <base:my-grid-schema-field name="typeStr" type="string"/>
</base:my-grid-search>
<base:footer/>


<script>
function getSearchObject(){
		var purchaseService = {};
		purchaseService.title=$("#title").val();
		purchaseService.type=$("#type").val();
		purchaseService.fromSerial=$("#fromSerial").val();
		purchaseService.toSerial=$("#toSerial").val();
		return purchaseService;
}

</script>
