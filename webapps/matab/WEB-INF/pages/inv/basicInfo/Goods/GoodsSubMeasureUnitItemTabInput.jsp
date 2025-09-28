<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form2-GoodsSubMeasureUnitItem">
		<input type="hidden" id="id" name="id" />
		<div class="uk-grid uk-grid-preserve">
			<base:comboBoxAutoComplete name="measureUnitId" styleClass="small" key="com.artonis.inv.basicInfo.goods.subMeasureUnit" comboLoaderUrl="combo/loadAllMeasureUnit"
                                       dataTextField="measureUnit" dataValueField="id" minLength="0" hasTemplate="false" templateComaSep="measureUnit" iscomboLoaderUrlRelative="true"/>
			<base:testBox styleClass="small" name="convertCoefficient" key="com.artonis.inv.basicInfo.goods.convertCoefficient"/>
		</div>
	</form>
</div>
