<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<form class="uk-form2-ServiceParentService">
	<input type="hidden" id="id" name="id">
	
	<div class="uk-grid uk-grid-preserve">
		<base:comboBox name="parentServiceId" value="name" key="com.artonis.clinic.basicInfo.service.serviceParentService"
					comboLoaderUrl="combo/loadParentService" styleClass="larg" />
	</div>
</form>