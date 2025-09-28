<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    String basePath="treeview/loadMenu/";
    basePath+= GlobalVariable.getUser().getUserName();
%>
<base:pageHeader/>
<base:pageInputHeader/>
<c:url value='<%=basePath%>' var="transportReadUrl"/>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="menuIdCommaSep" name="menuIdCommaSep" >
        <input type="hidden" id="previousMenuIdCommaSep" name="previousMenuIdCommaSep" >
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="name" key="system.authentication.role.name" />
            <base:testBox styleClass="verysmall" name="sessionTimeout" key="system.authentication.role.sessiontimeout" />
            <base:testBox styleClass="verysmall" name="code" key="system.authentication.role.code" />
        </div>
        <div class="uk-grid uk-grid-preserve" style="margin-top: 25px; margin-bottom: 25px;">
            <base:checkbox styleClass="verysmall" name="active" key="system.authentication.role.sessiontimeout"/>
            <base:checkbox styleClass="verysmall" name="showFinanceYear" key="system.authentication.role.showFinanceYear" divLableStyle="padding-right: 0px !important; margin-right: 30px;"/>
            <base:checkbox styleClass="verysmall" name="notShowOnOtherUserForDef" key="system.authentication.role.notShowOnOtherUserForDef" divLableStyle="padding-right: 0px !important; margin-right: 30px;"/>
        </div>
		<table style="margin-top: 10px; width: 100%">
			<tr>
				<td width="20%">
		        	<div class="k-rtl uk-grid uk-grid-preserve" >
        	        	<base:checkBoxTree filterChkBox="${id}" outputResultTag="menuIdCommaSep" previousResultTag="previousMenuIdCommaSep" name="aaa"
								key="clinic.visit.labTestNames" dataLoaderController="treeview/loadMenu/${id}" loadOnDemand="false"/>
        			</div>
				</td>
				<td width="40%" align="left">
					<base:checkListBox4RoleInputePage chkControllerPath="combo/loadAllComponent" name="aaaaa" key="system.authentication.role.sessiontimeout"/>
				</td>
                <td width="40%" align="left">
					<base:checkListBox4GridRoleInputePage chkControllerPath="combo/loadAllGridCols" name="gridCols"/>
				</td>
			</tr>
		</table>
    </form>
</div>
