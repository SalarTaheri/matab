<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="title" key="pursale.paymentService.title"/>
			<base:testBox styleClass="small" name="serial" key="pursale.paymentService.serial"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" value="name" key="pursale.paymentService.type" comboLoaderUrl="combo/loadAllTypes" styleClass="midsmall" />
		</div>
	</form>
</div>
