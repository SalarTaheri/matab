
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader></base:pageHeader>

<base:mehrSys-grid-mongo name="grid" transportReadUrl="${basePath}/grid-read" selectable="single" >
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.appPersionDate'  field="appPersionDate" width="50px"/>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.fromTime'  field="fromTime" width="50px"/>
    <base:my-grid-column title='clinic.appointment.doctorAppointmentCalendar.toTime'  field="toTime" width="50px"/>
</base:mehrSys-grid-mongo>

<base:footer/>