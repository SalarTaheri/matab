<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="DayItem"/>

<base:my-grid-item name="DayItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="weekTemplateId">
    <base:my-grid-column title='com.artonis.clinic.appointment.day.dayName'  field="dayName" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.fromTime'  field="fromTime" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.toTime'  field="toTime" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.timeDistance'  field="timeDistance" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.capacity'  field="capacity" width="50px"/>
    <base:my-grid-column title='com.artonis.clinic.appointment.weekTemplate.internetCapacity'  field="internetCapacity" width="50px"/>
    
    <base:my-grid-function text="com.artonis.clinic.appointment.appointmentReport.register" functionClick="grid_onAppointmentRptBtnRegister" name="appointmentRpt-btn-register" />
    <base:my-grid-function text="com.artonis.clinic.appointment.appointmentReport.log" functionClick="grid_onAppointmentRptBtnLog" name="appointmentRpt-btn-log" />
</base:my-grid-item>

<base:footer/>