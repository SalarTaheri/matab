
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" noDeleteButton="true">
	<base:my-grid-column title='fnc.generalAccounting.setting.accountcodesetting.layerName'  field="layerNameText" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.setting.accountcodesetting.codeLength'  field="codeLength" width="50px"/>


        <base:my-grid-schema-field name="layerNameText" type="string"/>
        <base:my-grid-schema-field name="codeLength" type="string"/>
</base:my-grid>
<base:footer/>
