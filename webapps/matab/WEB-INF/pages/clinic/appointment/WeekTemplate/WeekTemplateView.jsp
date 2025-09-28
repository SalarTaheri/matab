
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader></base:pageHeader>

<base:mehrSys-grid-mongo name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" >
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.doctorNameAndFam'  field="doctorNameAndFam" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.name'  field="name" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.description'  field="description" width="50px"/>
</base:mehrSys-grid-mongo>

<base:footer/>
