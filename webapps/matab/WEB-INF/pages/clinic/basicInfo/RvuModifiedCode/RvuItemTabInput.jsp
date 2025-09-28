<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<base:buttonPermission key="com.artonis.clinic.basicInfo.rvu.import" classNames="uk-button uk-button-success" id="import-rvu"/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form2-RvuItem" >
		<input type="hidden" id="id" name="id" >
		<%--<div class="uk-grid uk-grid-preserve">--%>
			<%--<base:testBox styleClass="small" name="id" key="com.artonis.clinic.basicInfo.rvu.id"/>--%>
			<%--<base:testBox styleClass="small" name="attribute" key="com.artonis.clinic.basicInfo.rvu.attribute"/>--%>
			<%--<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.rvu.code"/>--%>
		<%--</div>--%>
		<%--<div class="uk-grid uk-grid-preserve">--%>
			<%--<base:testBox styleClass="small" name="value" key="com.artonis.clinic.basicInfo.rvu.value"/>--%>
			<%--<base:testBox styleClass="small" name="comment" key="com.artonis.clinic.basicInfo.rvu.comment"/>--%>
			<%--<base:testBox styleClass="small" name="relativeValue" key="com.artonis.clinic.basicInfo.rvu.relativeValue"/>--%>
		<%--</div>--%>
		<%--<div class="uk-grid uk-grid-preserve">--%>
			<%--<base:testBox styleClass="small" name="anesthesiaBaseValue" key="com.artonis.clinic.basicInfo.rvu.anesthesiaBaseValue"/>--%>
			<%--<base:testBox styleClass="small" name="creationDate" key="com.artonis.clinic.basicInfo.rvu.creationDate"/>--%>
			<%--<base:testBox styleClass="small" name="modificationDate" key="com.artonis.clinic.basicInfo.rvu.modificationDate"/>--%>
		<%--</div>--%>
		<%--<div class="uk-grid uk-grid-preserve">--%>
			<%--<base:testBox styleClass="small" name="version" key="com.artonis.clinic.basicInfo.rvu.version"/>--%>
			<%--<base:testBox styleClass="small" name="deleted" key="com.artonis.clinic.basicInfo.rvu.deleted"/>--%>
			<%--<base:testBox styleClass="small" name="sourceGroup" key="com.artonis.clinic.basicInfo.rvu.sourceGroup"/>--%>
		<%--</div>--%>
		<%--<div class="uk-grid uk-grid-preserve">--%>
			<%--<base:testBox styleClass="small" name="TerminologyId" key="com.artonis.clinic.basicInfo.rvu.TerminologyId"/>--%>
			<%--</div>--%>
	
	</form>
</div>
<script type="text/javascript">
	$("#import-rvu").click(function () {
		$.getJSON("<c:url value='/' />" + "clinic/basicInfo/rvu/import/" , function (data) {

		})

	});


</script>
