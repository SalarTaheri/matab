<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%--<base:pageHeader/>--%>
<%--<base:pageInputHeader/>--%>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form2-KaItem" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:textBoxTwice name="name" nameDisable="preName" key="com.artonis.clinic.basicInfo.ka.name" />
			<base:testBoxNumericEx styleClass="small" name="price" key="com.artonis.clinic.basicInfo.ka.price"/>

		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="kaType" key="com.artonis.clinic.basicInfo.ka.type" comboLoaderUrl="combo/loadAllKaType"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="description" key="com.artonis.clinic.basicInfo.ka.description"/>
		</div>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#preName").val("-k");
});
</script>