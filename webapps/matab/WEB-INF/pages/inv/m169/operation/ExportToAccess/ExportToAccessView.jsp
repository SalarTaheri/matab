<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
	<div id="header-toolbar" align="right">
			<base:buttonPermission key="global.crud.export" classNames="uk-button uk-button-success" id="body-heade-save" />
	</div>
</div>