<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

	<form class="uk-form" id="mainForm" >
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="name" key="hrm.basicInfo.formule.name"/>
			<base:testBox name="variable" key="hrm.basicInfo.formule.variable"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:textArea name="formula" key="hrm.basicInfo.formule.formula" direction="ltr"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="parametr" key="hrm.basicInfo.formule.parametr" comboLoaderUrl="combo/loadAllParametr" ignore="true"/>
			<button class="uk-button" type="button" onclick="addParam()">+</button>
		</div>
			
	</form>
</div>

<script>
	function addParam(){
	//if(document.getElementById("formula").sellectedIndex)
		document.getElementById("formula").value += "$"+document.getElementById("parametr").value;
	document.forms[0].submit();
	}
</script>
