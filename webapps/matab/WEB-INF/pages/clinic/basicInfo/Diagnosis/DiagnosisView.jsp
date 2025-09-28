<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <base:my-grid-column title='clinic.basicInfo.diagnosis.diagnosis' field="diagnosis" width="100px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.diagnosis.code' field="code" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.basicInfo.diagnosis.status' field="statusStr" width="50px"/>
    <base:my-grid-column title='clinic.basicInfo.diagnosis.priority' field="priority" width="50px"/>
</base:my-grid>

<base:footer/>

<script type="text/javascript">
    $(function () {
        $("#grid").height(Number($(window).height()) - 200);
    });
</script>
