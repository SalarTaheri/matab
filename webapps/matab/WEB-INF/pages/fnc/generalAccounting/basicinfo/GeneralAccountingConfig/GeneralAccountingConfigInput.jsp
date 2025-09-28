
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
			<div class="uk-grid uk-grid-preserve">
				<base:comboBox name="numberActiveLevels" key="fnc.generalAccounting.basicinfo.numberActiveLevels"  value="name"  comboLoaderUrl="combo/loadAllNumberActiveLevels" styleClass="small" />
			</div>
	</form>
	<div class="uk-grid uk-grid-preserve"></div>
	<div align="center">
		<base:SubmitButton />
	</div>
</div>
<base:Pattern3/>
<base:footer/>

<script>
    var id="${generalAccountingConfig.id}";
    var numberActiveLevels="${generalAccountingConfig.numberActiveLevels}";

    if(!isNaN("${generalAccountingConfig.id}") && "${generalAccountingConfig.id}" > 0){
        $("#id").val("${generalAccountingConfig.id}");
    }
    if(!isNaN(numberActiveLevels) &&  numberActiveLevels!=null){
        $("#numberActiveLevels").val(numberActiveLevels);
        $("#numberActiveLevels_Comb").data("kendoComboBox").value(numberActiveLevels);
	}
</script>
