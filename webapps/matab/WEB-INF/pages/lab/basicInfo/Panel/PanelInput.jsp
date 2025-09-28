<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>

<base:pageHeader/>
<base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id"/>

		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" name="name" key="com.artonis.lab.basicInfo.panel.name"/>
			<base:testBox styleClass="small" name="code" key="com.artonis.lab.basicInfo.panel.code"/>
		</div>
	</form>

	<base:itemForm titleKeys="com.artonis.lab.basicInfo.panelItem" formItemTabViewJspFiles="PanelItemTabView.jsp" formItemTabInputs="PanelItemTabInput" masterIdStr="panelId" insertWithoutPopup="true"/>
</div>
