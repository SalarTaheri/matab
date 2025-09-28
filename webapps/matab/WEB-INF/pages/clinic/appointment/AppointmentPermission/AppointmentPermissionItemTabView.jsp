<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageTabViewHeader readUrl="transportReadUrl" removeUrl="transportRemoveUrl" updateUrl="" tabName="AppointmentPermissionItem"/>

<base:my-grid-item name="AppointmentPermissionItem" transportReadUrl="${transportReadUrl}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="appointmentPermissionId">
	<base:my-grid-column title='com.artonis.clinic.appointment.appointmentPermissionItem.doctor'  field="doctorName" width="50px"/>
	<base:my-grid-column title='com.artonis.clinic.appointment.appointmentPermissionItem.allowEdit' field="allowTypeText" width="60px"/>
</base:my-grid-item>

<base:footer></base:footer>