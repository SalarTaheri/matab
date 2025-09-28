
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
%>
<base:pageHeader></base:pageHeader>


<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read">
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.name'  field="name" width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.code' field="code"  width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.startDate' field="startDate"  width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.endDate' field="endDate"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.financeYear' field="financeYearName"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.priorSalaryPeriod' field="priorSalaryPeriodName"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.insuranceStartDate' field="insuranceStartDate"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.insuranceEndDate' field="insuranceEndDate"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.description' field="description"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.activeFlg' field="activeFlgStr"   width="50px"/>
    <base:my-grid-column title='hrm.basicinfo.salaryperiod.closeFlg' field="closeFlgStr"   width="50px"/>



    <base:my-grid-schema-field name="name" type="string" />
    <base:my-grid-schema-field name="code" type="string" />
    <base:my-grid-schema-field name="startDate" type="string" />
    <base:my-grid-schema-field name="endDate" type="string" />
    <base:my-grid-schema-field name="description" type="string" />
    <base:my-grid-schema-field name="activeFlgStr" type="string" />
    <base:my-grid-schema-field name="closeFlgStr" type="string" />
    <base:my-grid-schema-field name="insuranceStartDate" type="string" />
    <base:my-grid-schema-field name="insuranceEndDate" type="string" />
    <base:my-grid-schema-field name="financeYearName" type="string" />
    <base:my-grid-schema-field name="priorSalaryPeriodName" type="string" />

</base:my-grid>

<base:footer></base:footer>
