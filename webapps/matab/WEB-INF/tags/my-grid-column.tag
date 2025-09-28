<%@tag import="com.artonis.core.base.components.ui.kendo.MyColumnTag"%>
<%@tag import="java.util.ArrayList"%>
<%@tag import="java.util.List"%>
<%@tag import="com.kendoui.taglib.grid.ColumnTag"%>
<%@tag import="java.util.ResourceBundle"%>
<%@ tag import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>

<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="format" required="false" rtexprvalue="true"%>
<%@ attribute name="field" required="true" rtexprvalue="true"%>
<%@ attribute name="width" required="true" rtexprvalue="true"%>
<%@ attribute name="isCombo" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="isFlag" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="flagDestinationUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="flagIconUrl" required="false" rtexprvalue="true"%>
<%@ attribute name="dialogConfirmName" required="false" rtexprvalue="true"%>
<%@ attribute name="dialogConfirmKey" required="false" rtexprvalue="true"%>
<%@ attribute name="showWithPermission" required="false" rtexprvalue="true" type="java.lang.Boolean"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String menuSysCode = String.valueOf(request.getAttribute("menuSystemCode"));

	MyColumnTag col = new MyColumnTag();
	col.setTitle(resource.getString(title));
	col.setField(field);
	col.setWidth(width);
	col.setFlagDestinationUrl(flagDestinationUrl);
	col.setFormat(format);

	if (isCombo == null) {
		col.setCombo(false);
	} else {
		col.setCombo(isCombo);
	}

	if (isFlag == null) {
		col.setFlag(false);
	} else {
		col.setFlag(isFlag);
	}

	if (flagIconUrl == null) {
		col.setFlagIconUrl("/resources/images/blue/button-synchronize.png");
	} else {
		col.setFlagIconUrl(flagIconUrl);
	}

	if (dialogConfirmName != null) {
		col.setDialogConfirmName(dialogConfirmName);
	}

	if (dialogConfirmKey != null) {
		col.setDialogConfirmKey(dialogConfirmKey);
	}

	if (showWithPermission == null) {
		col.setShowWithPermission(false);
	} else {
		col.setShowWithPermission(showWithPermission);
	}

	List<MyColumnTag> cols = (List<MyColumnTag>) request.getAttribute("cols");
	//
	if (col.isShowWithPermission()) {
		if(GlobalVariable.getGridColumnContainer(menuSysCode, col.getField())){
			cols.add(col);
		}
	} else {
		cols.add(col);
	}
	//
	request.setAttribute("cols", cols);
%>
