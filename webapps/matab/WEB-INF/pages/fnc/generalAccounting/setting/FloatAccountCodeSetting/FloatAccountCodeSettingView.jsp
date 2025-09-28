
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='fnc.generalAccounting.setting.floatAccountCodeSetting.layerNumber'  field="layerNumber" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.setting.floatAccountCodeSetting.codeLength'  field="codeLength" width="50px"/>


        <base:my-grid-schema-field name="layerNumber" type="string"/>
        <base:my-grid-schema-field name="codeLength" type="string"/>
</base:my-grid>
<base:footer/>
