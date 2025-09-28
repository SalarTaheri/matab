
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="ChiefComplaintDescriptionItem"/>

<base:my-grid-item name="ChiefComplaintDescriptionItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="cheifComplaint_id">
    <base:my-grid-column title='com.artonis.clinic.basicInfo.chiefComplaint.name'  field="name_item" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.chiefComplaint.code'  field="code_item" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.chiefComplaint.status'  field="status_itemStr" width="50px"/>


    <base:my-grid-schema-field name="name_item" type="string"/>
    <base:my-grid-schema-field name="code_item" type="string"/>
    <base:my-grid-schema-field name="status_itemStr" type="string"/>

</base:my-grid-item>

<base:footer></base:footer>


