<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader />
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.clinic.basicInfo.group.name"/>
			<base:testBox styleClass="small" name="code" key="com.artonis.clinic.basicInfo.group.code"/>
		</div>
	</form>
    <base:itemForm titleKeys="com.artonis.clinic.basicInfo.serviceState" masterIdStr="group_id" insertWithoutPopup="true"
                   formItemTabViewJspFiles="GroupStateTabView.jsp" formItemTabInputs="GroupStateTabInput" />
  </div>
