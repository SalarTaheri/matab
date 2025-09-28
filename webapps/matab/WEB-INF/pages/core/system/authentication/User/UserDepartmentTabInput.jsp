
<%@page import="java.util.ResourceBundle"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("application_fa");
%>

<form class="uk-form2-UserDepartment" >

    <input  type="hidden" id="id" name="id" class="uk-width-1-1">
    <div class="uk-grid uk-grid-preserve">
        <base:comboBox name="department_id" value="name" key="system.authentication.role.department" comboLoaderUrl="combo/loadAllDepartment"/>
    </div>




</form>
