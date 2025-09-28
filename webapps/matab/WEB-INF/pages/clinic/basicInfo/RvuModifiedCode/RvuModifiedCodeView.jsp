<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
  <%--<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.employee_id'  field="employeeFullName" width="50px"/>--%>
  <base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate'  field="fromDate" width="40px"/>
  <base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.toDate'  field="toDate" width="30px"/>
</base:my-grid>

<base:footer/>

<script type="text/javascript">
</script>
