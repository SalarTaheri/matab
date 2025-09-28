<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="SurveyFormItem"/>

<base:my-grid-item name="SurveyFormItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="surveyform_id">
	<base:my-grid-column title='com.artonis.clinic.research.surveyFormItem.name'  field="name" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.research.surveyFormItem.key_'  field="key_" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.research.surveyFormItem.datatype'  field="datatype" width="20px"/>
	<base:my-grid-column title='com.artonis.clinic.research.surveyFormItem.fieldCommaSep'  field="fieldCommaSep" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.research.surveyFormItem.listLoaderUrl'  field="listLoaderUrl" width="50px"/>
</base:my-grid-item>
<base:footer></base:footer>

